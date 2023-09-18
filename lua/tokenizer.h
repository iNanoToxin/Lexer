#ifndef LUA_TOKENIZER_H
#define LUA_TOKENIZER_H

#include <string>
#include <vector>
#include <cstring>
#include <stdexcept>

#define return_if_fail(A) \
token_result result = A;  \
if (result != token_result::SUCCESS) { \
    return result;        \
}

#define return_token(A, B) \
if (starts_with(A)) {      \
    bump(strlen(A));       \
    add_token(B);          \
    return; \
}

enum class token_type {
    IDENTIFIER,

    STRING_RAW,
    STRING,

    COMMENT,

    NUMBER_HEXADECIMAL,
    NUMBER_BINARY,
    NUMBER,

    DECL_FUNCTION,
    DECL_LOCAL,

    BOOL_FALSE,
    BOOL_TRUE,

    COND_AND,
    COND_NOT,
    COND_OR,

    STAT_ELSE_IF,
    STAT_ELSE,
    STAT_FOR,
    STAT_DO,
    STAT_IF,
    STAT_WHILE,
    STAT_REPEAT,
    STAT_RETURN,
    STAT_GOTO,

    LOOP_BREAK,
    LOOP_CONTINUE,

    KEYWORD_UNTIL,
    KEYWORD_THEN,
    KEYWORD_NIL,
    KEYWORD_IN,
    KEYWORD_END,


    OP_EQ,
    OP_NOT_EQ,
    OP_LE,
    OP_GE,
    OP_LT,
    OP_GT,

    OP_ADD,
    OP_SUB,
    OP_MUL,
    OP_DIV,
    OP_MOD,
    OP_POW,
    OP_IDIV,
    OP_CONCAT,

    OP_BIT_AND,
    OP_BIT_NOT,
    OP_BIT_XOR,
    OP_BIT_LSHIFT,
    OP_BIT_RSHIFT,

    OP_LEN,
    OP_INDEX,
    OP_INDEX_SYNTACTIC,

    OP_ASSIGN,
    OP_ASSIGN_ADD,
    OP_ASSIGN_SUB,
    OP_ASSIGN_MUL,
    OP_ASSIGN_DIV,
    OP_ASSIGN_MOD,
    OP_ASSIGN_POW,
    OP_ASSIGN_CONCAT,


    PUNC_LPAREN,
    PUNC_RPAREN,
    PUNC_LBRACE,
    PUNC_RBRACE,
    PUNC_LBRACKET,
    PUNC_RBRACKET,

    PUNC_VARARGS,
    PUNC_SEMICOLON,
    PUNC_COMMA,
    PUNC_LABEL
};

struct token {
    token_type type;
    std::string literal;
};



static constexpr const char* KEYWORDS[] = {
    "and",
    "break",
    "do",
    "else",
    "elseif",
    "end",
    "false",
    "for",
    "function",
    "if",
    "in",
    "local",
    "nil",
    "not",
    "or",
    "repeat",
    "return",
    "then",
    "true",
    "until",
    "while",
    "continue"
};

static constexpr const char* PUNCTUATIONS[] = {
    // Variadic Symbol.
    "...",
    // Equality operators.
    "==",
    "~=",
    "<=",
    ">=",
    "<",
    ">",
    // Assignment operators.
    "+=",
    "-=",
    "*=",
    "/=",
    "%=",
    "^=",
    "..=",
    "=",
    // Operators.
    "+",
    "-",
    "*",
    "/",
    "%",
    "^",
    "..",
    "#",

    ".",
    ":",
    ";",
    ",",
    "{",
    "}",
    "[",
    "]",
    "(",
    ")"
};



bool is_digit(char c) {
    return (c >= '0') && (c <= '9');
}

bool is_hexadecimal_digit(char c) {
    return is_digit(c) || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F');
}

bool is_binary_digit(char c) {
    return (c == '0') || (c == '1');
}

bool is_identifier_nondigit(char c) {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c == '_');
}

bool is_identifier(char c) {
    return is_identifier_nondigit(c) || (c >= '0' && c <= '9');
}


bool is_escape_character(char c) {
    switch (c) {
        case '\"':
        case '\'':
        case '?':
        case '\\':
        case '#':
        case 'a':
        case 'b':
        case 'f':
        case 'n':
        case 'r':
        case 't':
        case 'v':
        case '0': {
            return true;
        }
        default: {
            return false;
        }
    }
}

bool is_symbol(char c) {
    switch (c) {
        case '`':
        case '~':
        case '!':
        case '@':
        case '#':
        case '$':
        case '%':
        case '^':
        case '&':
        case '*':
        case '(':
        case ')':
        case '_':
        case '-':
        case '+':
        case '=':
        case '{':
        case '}':
        case '[':
        case ']':
        case '|':
        case '\\':
        case ':':
        case ';':
        case '\"':
        case '\'':
        case '<':
        case '>':
        case ',':
        case '.':
        case '?':
        case '/': {
            return true;
        }
        default: {
            return false;
        }
    }
}

bool is_white_space(char c) {
    return (c == ' ' || c == '\n' || c == '\t' || c == '\r' || c == '\v' || c == '\f');
}

bool is_keyword(const std::string& str) {
    for (const char* keyword : KEYWORDS) {
        if (keyword == str) {
            return true;
        }
    }
    return false;
}










class token_stream {
public:
    std::size_t length = 0;
    std::size_t index = 0;
    std::string source;
    std::string buffer;
    std::vector<token> tokens;

    void tokenize(const std::string& source) {
        this->source = source;
        this->length = source.length();

        while (next()) {
            if (starts_with("__EXIT__SAFE__")) {
                break;
            }

            if (is_comment_token()) {
                parse_comment();
            }
            else if (is_keyword_token()) {
                parse_keyword();
            }
            else if (is_identifier_token()) {
                parse_identifier();
            }
            else if (is_string_token()) {
                parse_string();
            }
            else if (is_numeric_token()) {
                if (starts_with("0x") || starts_with("0X")) {
                    parse_hexadecimal_number();
                }
                else if (starts_with("0b") || starts_with("0B")) {
                    parse_binary_number();
                }
                else {
                    parse_number();
                }
            }
            else if (is_punctuation_token()) {
                parse_punctuation();
            }
            else if (is_white_space(peek())) {
                consume();
            }
            else {
                throw std::invalid_argument("unknown token type");
            }
        }
    }

    void add_token(const token_type& type) {
        // std::cout << buffer << "\n";
        tokens.push_back(token{.type = type, .literal = buffer});
        buffer.clear();
    }

    template <typename T>
    void parse_numeric_notation_sequence(token_type type, T is_digit_type) {
        bool is_malformed = false;
        unsigned int length_sequence = 0;

        while (next() && !is_white_space(peek())) {
            if (not_starts_with('_')) {
                if (not_starts_with('.') && is_symbol(peek())) {
                    break;
                }
                else if (is_digit_type(peek())) {
                    length_sequence++;
                }
                else {
                    is_malformed = true;
                }
            }
            bump();
        }

        if (is_malformed || length_sequence == 0) {
            throw std::invalid_argument("malformed number");
        }

        add_token(type);
    }

    void parse_hexadecimal_number() {
        bump(2);
        return parse_numeric_notation_sequence(token_type::NUMBER_HEXADECIMAL, &is_hexadecimal_digit);
    }

    void parse_binary_number() {
        bump(2);
        return parse_numeric_notation_sequence(token_type::NUMBER_BINARY, &is_binary_digit);
    }

    void parse_exponential_number() {
        bump();

        if (starts_with('-') || starts_with('+')) {
            bump();
        }
        return parse_numeric_notation_sequence(token_type::NUMBER, &is_digit);
    }

    void parse_number() {
        bool is_malformed = false;
        unsigned int decimal_points = 0;

        while (next() && !is_white_space(peek())) {
            // Handle numbers with exponents.
            if (starts_with('e') || starts_with('E')) {
                parse_exponential_number();
                break;
            }

            if (not_starts_with('_')) {
                if (starts_with('.')) {
                    decimal_points++;
                }
                else if (is_symbol(peek())) {
                    break;
                }
                else if (!is_digit(peek())) {
                    is_malformed = true;
                }
            }
            bump();
        }

        if (is_malformed || decimal_points > 1) {
            throw std::invalid_argument("malformed number");
        }

        add_token(token_type::NUMBER);
    }

    void parse_long_brackets() {
        std::string closing_bracket;

        bump();
        closing_bracket.push_back(']');

        while (starts_with('=')) {
            bump();
            closing_bracket.push_back('=');
        }

        bump();
        closing_bracket.push_back(']');

        while (next()) {
            if (starts_with(closing_bracket)) {
                break;
            }
            bump();
        }
        if (starts_with(closing_bracket)) {
            bump(closing_bracket.length());
        }
        else {
            throw std::invalid_argument("invalid bracket");
        }
    }

    void parse_string() {
        if (starts_with_long_bracket()) {
            parse_long_brackets();
            add_token(token_type::STRING_RAW);
        }
        else {
            char quote = bump();

            while (not_starts_with(quote) && not_starts_with('\n')) {
                // Handle escape characters in strings.
                if (starts_with('\\')) {
                    if (!next(1)) {
                        throw std::invalid_argument("invalid escape sequence");
                    }
                    bump();
                }
                bump();
            }

            if (!starts_with(quote)) {
                throw std::invalid_argument("malformed string");
            }

            bump();
            add_token(token_type::STRING);
        }
    }

    void parse_comment() {
        bump(2);

        if (starts_with_long_bracket()) {
            parse_long_brackets();
        }
        else {
            while (not_starts_with('\n')) {
                bump();
            }
        }

        add_token(token_type::COMMENT);
    }

    void parse_identifier() {
        while (next() && is_identifier(peek())) {
            bump();
        }
        add_token(token_type::IDENTIFIER);
    }

    void parse_keyword() {
        return_token("function", token_type::DECL_FUNCTION)
        return_token("local", token_type::DECL_LOCAL)

        return_token("false", token_type::BOOL_FALSE)
        return_token("true", token_type::BOOL_TRUE)

        return_token("and", token_type::COND_AND)
        return_token("not", token_type::COND_NOT)
        return_token("or", token_type::COND_OR)

        return_token("elseif", token_type::STAT_ELSE_IF)
        return_token("else", token_type::STAT_ELSE)
        return_token("for", token_type::STAT_FOR)
        return_token("do", token_type::STAT_DO)
        return_token("if", token_type::STAT_IF)
        return_token("while", token_type::STAT_WHILE)
        return_token("repeat", token_type::STAT_REPEAT)
        return_token("return", token_type::STAT_RETURN)

        return_token("break", token_type::LOOP_BREAK)
        return_token("continue", token_type::LOOP_CONTINUE)

        return_token("until", token_type::KEYWORD_UNTIL)
        return_token("then", token_type::KEYWORD_THEN)
        return_token("nil", token_type::KEYWORD_NIL)
        return_token("in", token_type::KEYWORD_IN)
        return_token("end", token_type::KEYWORD_END)
    }

    void parse_punctuation() {
        return_token("...", token_type::PUNC_VARARGS)

        return_token("==", token_type::OP_EQ)
        return_token("~=", token_type::OP_NOT_EQ)
        return_token("<=", token_type::OP_LE)
        return_token(">=", token_type::OP_GE)
        return_token("<", token_type::OP_LT)
        return_token(">", token_type::OP_GT)

        return_token("+=", token_type::OP_ASSIGN_ADD)
        return_token("-=", token_type::OP_ASSIGN_SUB)
        return_token("*=", token_type::OP_ASSIGN_MUL)
        return_token("/=", token_type::OP_ASSIGN_DIV)
        return_token("%=", token_type::OP_ASSIGN_MOD)
        return_token("^=", token_type::OP_ASSIGN_POW)
        return_token("..=", token_type::OP_ASSIGN_CONCAT)

        return_token("+", token_type::OP_ADD)
        return_token("-", token_type::OP_SUB)
        return_token("*", token_type::OP_MUL)
        return_token("/", token_type::OP_DIV)
        return_token("%", token_type::OP_MOD)
        return_token("^", token_type::OP_POW)
        return_token("..", token_type::OP_CONCAT)


        return_token("#", token_type::OP_LEN)
        return_token("=", token_type::OP_ASSIGN)

        return_token(".", token_type::OP_INDEX)
        return_token(":", token_type::OP_INDEX_SYNTACTIC)
        return_token(";", token_type::PUNC_SEMICOLON)
        return_token(",", token_type::PUNC_COMMA)
        return_token("(", token_type::PUNC_LPAREN)
        return_token(")", token_type::PUNC_RPAREN)
        return_token("{", token_type::PUNC_LBRACE)
        return_token("}", token_type::PUNC_RBRACE)
        return_token("[", token_type::PUNC_LBRACKET)
        return_token("]", token_type::PUNC_RBRACKET)
    }


    bool is_comment_token() {
        return starts_with("--");
    }

    bool is_identifier_token() {
        return is_identifier_nondigit(peek());
    }

    bool is_string_token() {
        return starts_with('\"') || starts_with('\'') || starts_with_long_bracket();
    }

    bool is_numeric_token() {
        return starts_with('.') && next(1) && is_digit(peek(1)) || is_digit(peek());
    }

    bool is_punctuation_token() {
        for (const char* punctuation : PUNCTUATIONS) {
            if (starts_with(punctuation)) {
                return true;
            }
        }
        return false;
    }
    bool is_keyword_token() {
        for (const char* keyword : KEYWORDS) {
            if (starts_with(keyword)) {
                return true;
            }
        }
        return false;
    }
    char consume() {
        return source.at(index++);
    }
    char bump() {
        char c = consume();
        buffer.push_back(c);
        return c;
    }
    void bump(std::size_t amount) {
        for (std::size_t i = 0; i < amount; i++) {
            buffer.push_back(consume());
        }
    }
    [[nodiscard]] bool next(std::size_t offset = 0) const {
        return index + offset < length;
    }
    [[nodiscard]] char peek(std::size_t offset = 0) {
        return source.at(index + offset);
    }
    [[nodiscard]] bool starts_with(const std::string& str) const {
        return next(str.length() - 1) && source.substr(index, str.length()) == str;
    }

    [[nodiscard]] bool starts_with(const char* str) const {
        return next(strlen(str) - 1) && source.substr(index, strlen(str)) == str;
    }

    [[nodiscard]] bool starts_with(char c) {
        return next() && peek() == c;
    }

    [[nodiscard]] bool not_starts_with(char c) {
        return next() && peek() != c;
    }
    [[nodiscard]] bool starts_with_long_bracket() {
        if (starts_with('[')) {
            int i = 1;
            while (next(i) && peek(i) == '=') {
                i++;
            }
            if (next(i) && peek(i) == '[') {
                return true;
            }
        }
        return false;
    }
};

#endif