// #pragma clang diagnostic push
// #pragma ide diagnostic ignored "OCDFAInspection"

#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include "tokenizer.h"
#include <iostream>
#include <memory>

#pragma region MACROS
    #define COUT(A) std::cout << A << std::endl
    #define SP(A, B) std::string((B) * 4, ' ') + A + "\n"

    #define PRINT_NAME_SPACE(NAME, INSIDE)                  \
    do {                                                    \
        str += SP(NAME + " = {", depth);                    \
        depth++;                                            \
        INSIDE                                              \
        depth--;                                            \
        str += SP("}", depth);                              \
    } while (false)

    #define PRINT_PTR_FIELD(NAME, FIELD)                    \
    do {                                                    \
        if (FIELD != nullptr) {                             \
            str += SP(NAME, depth);                         \
            str.erase(str.end() - 1);                       \
            str += ": <";                                   \
            std::size_t pos = str.size();                   \
            str += FIELD->tostring(depth);                  \
            str.erase(pos, depth * 4);                      \
            while (pos < str.size()) {                      \
                if (str[pos] == ' ') {                      \
                    str.insert(str.begin() + pos, '>');     \
                    break;                                  \
                }                                           \
                pos++;                                      \
            }                                               \
        }                                                   \
        else {                                              \
            str += SP(NAME + " = nullptr", depth);          \
        }                                                   \
    } while (false)

    #define PRINT_FIELD(NAME, FIELD)                        \
    do {                                                    \
        str += SP(NAME + " = " + FIELD, depth);             \
    } while (false)

    #define PRINT_VECTOR_FIELD(NAME, VECTOR_FIELD)          \
    do {                                                    \
        if (!VECTOR_FIELD.empty()) {                        \
            PRINT_NAME_SPACE(NAME, {                        \
                int i = 0;                                  \
                for (auto& field : VECTOR_FIELD) {          \
                    char c = static_cast<char>(++i + '0');  \
                    PRINT_PTR_FIELD("[" + c + "]", field);  \
                }                                           \
            });                                             \
        }                                                   \
        else {                                              \
            str += SP(NAME + " = {}", depth);               \
        }                                                   \
    } while (false)

    #define TOSTRING(BODY) \
    [[nodiscard]] std::string tostring(std::size_t depth) const override { \
        std::string str;   \
        BODY               \
        return str;        \
    }

    template <typename T>
    void HELPER_PRINT(const std::string& name, std::shared_ptr<T> field, std::string& str, std::size_t depth) {
        PRINT_PTR_FIELD(name, field);
    }

    template <typename T>
    void HELPER_PRINT(const std::string& name, T field, std::string& str, std::size_t depth) {
        PRINT_FIELD(name, field);
    }
#pragma endregion

bool is_binop(const token& token) {
    return token.is("+") 
    || token.is("-")
    || token.is("*")
    || token.is("/")
    || token.is("//")
    || token.is("^")
    || token.is("%")
    || token.is("&")
    || token.is("~")
    || token.is("|")
    || token.is(">>")
    || token.is("<<")
    || token.is("..")
    || token.is("<")
    || token.is("<=")
    || token.is(">")
    || token.is(">=")
    || token.is("==")
    || token.is("~=")
    || token.is("and")
    || token.is("or");
}

bool is_fieldsep(const token& token) {
    return token.is(",") || token.is(";");
}

bool is_unop(const token& token) {
    return token.is("-")
    || token.is("not")
    || token.is("#")
    || token.is("~");
}

bool is_boolean(const token& token) {
    return token.is("true") || token.is("false");
}

bool is_conditional(const token& token) {
    return token.is("and") || token.is("or");
}

bool is_null(const token& token) {
    return token.is("nil");
}



class base {
public:
    enum class kind {
        CHUNK,
        BLOCK,
        STAT,
        ATTNAMELIST,
        ATTRIB,
        RETSTAT,
        LABEL,
        FUNCNAME,
        VARLIST,
        VAR,
        NAMELIST,
        EXPLIST,
        EXP,
        PREFIXEXP,
        FUNCTIONCALL,
        ARGS,
        FUNCTIONDEF,
        FUNCBODY,
        PARLIST,
        TABLECONSTRUCTOR,
        FIELDLIST,
        FIELD,
        FIELDSEP,
        BINOP,
        UNOP,


        binary_operator_expr,
        unary_operator_expr,
        table_constructor_expr,
        numeric_literal_expr,
        conditional_expr,
        boolean_expr,
        null_expr,
        string_expr,
        varargs_expr,
        identifier_expr,

        attnamelist,
    };

    kind kind;
    explicit base(enum kind kind) : kind(kind) {}
    [[nodiscard]] virtual std::string tostring(std::size_t depth = 0) const { return ""; }
};


#define BASE_TYPE_CLASS(CLASS_NAME, TYPE, FIELD_NAME) \
class CLASS_NAME : public base {                      \
public:                                               \
    TYPE FIELD_NAME;                                  \
    explicit CLASS_NAME(TYPE FIELD_NAME) :            \
    base(kind::CLASS_NAME),                           \
    FIELD_NAME(std::move(FIELD_NAME)) {}              \
};


class binary_operator_expr : public base {
public:
    std::string binary_operator;
    std::shared_ptr<base> lhs;
    std::shared_ptr<base> rhs;

    binary_operator_expr(
        std::string binary_operator,
        std::shared_ptr<base> lhs,
        std::shared_ptr<base> rhs
    ) :
        base(kind::binary_operator_expr),
        binary_operator(std::move(binary_operator)),
        lhs(std::move(lhs)),
        rhs(std::move(rhs)) {}

    TOSTRING({
        PRINT_NAME_SPACE("binary_operator_expr", {
            PRINT_FIELD("binary_operator", "\'" + binary_operator + "\'");
            PRINT_PTR_FIELD("lhs", lhs);
            PRINT_PTR_FIELD("rhs", rhs);
        });
    })
};

class unary_operator_expr : public base {
public:
    std::string unary_operator;
    std::shared_ptr<base> expr;

    unary_operator_expr(
        std::string unary_operator,
        std::shared_ptr<base> expr
    ) :
        base(kind::unary_operator_expr),
        unary_operator(std::move(unary_operator)),
        expr(std::move(expr)) {}

    TOSTRING({
        PRINT_NAME_SPACE("unary_operator_expr", {
            PRINT_FIELD("unary_operator", "\'" + unary_operator + "\'");
            PRINT_PTR_FIELD("expr", expr);
        });
    })
};



BASE_TYPE_CLASS(table_constructor_expr,              std::shared_ptr<base>,  field_list)
BASE_TYPE_CLASS(  numeric_literal_expr,                        std::string,       value)
BASE_TYPE_CLASS(      conditional_expr,                        std::string, conditional)
BASE_TYPE_CLASS(          boolean_expr,                        std::string,     boolean)
BASE_TYPE_CLASS(             null_expr,                        std::string,       value)
BASE_TYPE_CLASS(           string_expr,                        std::string,       value)
BASE_TYPE_CLASS(          varargs_expr,                        std::string,       value)
BASE_TYPE_CLASS(       identifier_expr,                        std::string,       value)
BASE_TYPE_CLASS(           attnamelist, std::vector<std::shared_ptr<base>>,       value)


std::string attnamelist::tostring(std::size_t depth) const {
    return "";
}

#define RETURN_UNOP(TOKEN) \
do {                       \
    consume();             \
    if (auto expr = parse_next(get_precedence(TOKEN, true))) { \
        return std::make_unique<unary_operator_expr>(TOKEN.literal, std::move(expr)); \
    }                      \
    throw std::invalid_argument("expected expression after " + TOKEN.literal); \
} while (false)



class parser {
public:
    std::size_t length = 0;
    std::size_t index = 0;
    std::vector<token> tokens;


    std::shared_ptr<base> get_name() {
        if (!expect_peek(token_type::IDENTIFIER)) {
            throw std::invalid_argument("name expected");
        }
        return parse_primary();
    }

    std::shared_ptr<base> get_attname() {

    }






    void parse(const std::string& source) {
        token_stream stream;
        stream.tokenize(source);
        tokens = stream.tokens;
        length = tokens.size();

        #define PRINT_TOKENS
        // #define RETURN_EARLY

        #ifdef PRINT_TOKENS
        {
            std::clog << "VIEW TOKENS: " << stream.tokens.size() << "\n";

            std::size_t max_length = 0;
            for (token& token: stream.tokens) {
                if (token.literal.length() <= 15) {
                    max_length = std::max(max_length, token.literal.length());
                }
            }

            for (token& token: stream.tokens) {
                std::string type;

                switch (token.type) {
                    case token_type::IDENTIFIER: {
                        type = "IDENTIFIER";
                        break;
                    }
                    case token_type::STRING_RAW: {
                        type = "STRING_RAW";
                        break;
                    }
                    case token_type::STRING: {
                        type = "STRING";
                        break;
                    }
                    case token_type::COMMENT_RAW: {
                        type = "COMMENT_RAW";
                        break;
                    }
                    case token_type::COMMENT: {
                        type = "COMMENT";
                        break;
                    }
                    case token_type::NUMBER_HEXADECIMAL: {
                        type = "NUMBER_HEXADECIMAL";
                        break;
                    }
                    case token_type::NUMBER_BINARY: {
                        type = "NUMBER_BINARY";
                        break;
                    }
                    case token_type::NUMBER: {
                        type = "NUMBER";
                        break;
                    }
                    case token_type::KEYWORD: {
                        type = "KEYWORD";
                        break;
                    }
                    case token_type::PUNCTUATION: {
                        type = "PUNCTUATION";
                        break;
                    }
                }

                // if (!(token.type == token_type::STRING)) {
                //     continue;
                // }

                if (token.literal.length() <= 15) {
                    std::cout << token.literal << std::string(
                        max_length - token.literal.length(),
                        ' '
                    ) << " -> " << (type) << "\n";
                }
                else {
                    std::cout << token.literal << " -> " << (type) << "\n";
                }
            }

            std::cout << "\n";
        }
        #endif

        #ifdef RETURN_EARLY
            return;
        #endif


        COUT(parse_next()->tostring(0));
    }

    int get_precedence(const token& token, bool is_unop = false) {
        static const std::vector<std::vector<std::string>> priority = {
            {"or"},
            {"and"},
            {"<", ">", "<=", ">=", "~=", "=="},
            {"|"},
            {"~"},
            {"&"},
            {"<<", ">>"},
            {".."},
            {"+", "-"},
            {"*", "/", "//", "%"},
            {"not", "#", "-", "~"},
            {"^"}
        };

        if (is_unop) {
            return priority.size() - 1;
        }

        for (int i = 0; i < priority.size(); i++) {
            for (auto& e : priority[i]) {
                if (token.is(e)) {
                    return i + 1;
                }
            }
        }
        return -1;
    }

    std::shared_ptr<base> parse_primary() {
        if (!next()) {
            return nullptr;
        }

        token curr_token = peek();

        switch (curr_token.type) {
            case token_type::IDENTIFIER: {
                return std::make_unique<identifier_expr>(consume().literal);
            }
            case token_type::STRING_RAW:
            case token_type::STRING: {
                return std::make_unique<string_expr>(consume().literal);
            }
            case token_type::COMMENT_RAW: {
                break;
            }
            case token_type::COMMENT: {
                break;
            }
            case token_type::NUMBER_HEXADECIMAL:
            case token_type::NUMBER_BINARY:
            case token_type::NUMBER: {
                return std::make_unique<numeric_literal_expr>(consume().literal);
            }
            case token_type::KEYWORD: {
                if (is_conditional(curr_token)) {
                    return std::make_unique<conditional_expr>(consume().literal);
                }
                else if (is_boolean(curr_token)) {
                    return std::make_unique<boolean_expr>(consume().literal);
                }
                else if (is_unop(curr_token)) {
                    RETURN_UNOP(curr_token);
                }
                else if (is_null(curr_token)) {
                    return std::make_unique<null_expr>(consume().literal);
                }
                break;
            }
            case token_type::PUNCTUATION: {
                if (curr_token.is("(")) {
                    consume();

                    auto expr = parse_next();

                    if (!expect_peek(token_type::PUNCTUATION) || !peek().is(")")) {
                        throw std::invalid_argument("expected ) after (");
                    }
                    consume();

                    return expr;
                }
                else if (curr_token.is("{")) {
                    consume();

                    // auto expr = parse_next();

                    if (!expect_peek(token_type::PUNCTUATION) || !peek().is("}")) {
                        throw std::invalid_argument("expected } after {");
                    }
                    consume();

                    return std::make_unique<table_constructor_expr>(nullptr);
                }
                else if (curr_token.is("...")) {
                    return std::make_unique<varargs_expr>(consume().literal);
                }
                else if (is_unop(curr_token)) {
                    RETURN_UNOP(curr_token);
                }
                break;
            }
        }

        throw std::invalid_argument("unknown: " + curr_token.literal);
        return nullptr;
    }

    std::shared_ptr<base> parse_rhs(int min_precedence, std::shared_ptr<base> lhs) {
        while(next()) {
            token curr_token = peek();
            int curr_precedence = get_precedence(curr_token);

            if (curr_precedence < min_precedence) {
                return lhs;
            }

            consume();

            auto rhs = parse_primary();
            if (rhs == nullptr) {
                return rhs;
            }

            if (next()) {
                int next_precedence = get_precedence(peek());
                if (curr_precedence < next_precedence) {
                    rhs = parse_rhs(curr_precedence + 1, std::move(rhs));
                    if (rhs == nullptr) {
                        return rhs;
                    }
                }
            }

            if (is_binop(curr_token)) {
                lhs = std::make_unique<binary_operator_expr>(curr_token.literal, std::move(lhs), std::move(rhs));
            }
        }
        return lhs;
    }

    std::shared_ptr<base> parse_next(int precedence = 0) {
        auto expr = parse_primary();

        if (expr != nullptr) {
            if (auto next_expr = parse_rhs(precedence, std::move(expr))) {
                expr = next_expr;
            }
        }

        return expr;
    }

    bool next(std::size_t offset = 0) const {
        return index + offset < length;
    }

    token peek(std::size_t offset = 0) {
        return tokens.at(index + offset);
    }

    token consume() {
        return tokens.at(index++);
    }

    bool expect_peek(token_type type) {
        return next() && peek().type == type;
    }

    bool expect_peek(std::size_t offset, token_type type) {
        return next(offset) && peek(offset).type == type;
    }
};







#endif