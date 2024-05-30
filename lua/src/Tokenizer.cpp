#include "Tokenizer.h"

static constexpr const char* keywords[] = {
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
    "while"
};

static constexpr const char* punctuations[] = {
    "...",

    "<<",
    ">>",
    "//",
    "==",
    "~=",
    "<=",
    ">=",
    "..",
    "::",

    "+",
    "-",
    "*",
    "/",
    "%",
    "^",
    "#",
    "&",
    "~",
    "|",
    "<",
    ">",
    "=",
    "(",
    ")",
    "{",
    "}",
    "[",
    "]",
    ":",
    ";",
    ",",
    "."
};


bool is_digit(char p_Char)
{
    return (p_Char >= '0') && (p_Char <= '9');
}

bool is_hexadecimal_digit(char p_Char)
{
    return is_digit(p_Char) || (p_Char >= 'a' && p_Char <= 'f') || (p_Char >= 'A' && p_Char <= 'F');
}

bool is_binary_digit(char p_Char)
{
    return (p_Char == '0') || (p_Char == '1');
}

bool is_identifier_nondigit(char p_Char)
{
    return (p_Char >= 'a' && p_Char <= 'z') || (p_Char >= 'A' && p_Char <= 'Z') || (p_Char == '_');
}

bool is_identifier(char p_Char)
{
    return is_identifier_nondigit(p_Char) || (p_Char >= '0' && p_Char <= '9');
}

bool is_escape_character(char p_Char)
{
    switch (p_Char)
    {
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
        case '0':
        {
            return true;
        }
        default:
        {
            return false;
        }
    }
}

bool is_symbol(char p_Char)
{
    switch (p_Char)
    {
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
        case '/':
        {
            return true;
        }
        default:
        {
            return false;
        }
    }
}

bool is_white_space(char p_Char)
{
    return (p_Char == ' ' || p_Char == '\n' || p_Char == '\t' || p_Char == '\r' || p_Char == '\v' || p_Char == '\f');
}

bool is_keyword(const std::string& p_String)
{
    for (const char* keyword: keywords)
    {
        if (keyword == p_String)
        {
            return true;
        }
    }
    return false;
}

bool Token::is(const std::string& p_TokenLiteral) const
{
    return literal == p_TokenLiteral;
}

bool Token::is(const TokenType& p_TokenType) const
{
    return type == p_TokenType;
}

void TokenStream::tokenize(const std::string& p_Source)
{
    m_Source = p_Source;
    m_Length = p_Source.length();

    while (next())
    {
        if (startsWith("__EXIT__SAFE__"))
        {
            break;
        }




        if (startsWithComment())
        {
            parseComment();
        }
        else if (startsWithWord())
        {
            parseWord();
        }
        else if (startsWithString())
        {
            parseString();
        }
        else if (startsWithNumber())
        {
            if (startsWith("0x") || startsWith("0X"))
            {
                parseHexadecimal();
            }
            else if (startsWith("0b") || startsWith("0B"))
            {
                parseBinary();
            }
            else
            {
                parseNumber();
            }
        }
        else if (startsWithPunctuation())
        {
            parsePunctuation();
        }
        else if (is_white_space(peek()))
        {
            consume();
        }
        else
        {
            throw std::invalid_argument("unknown Token type");
        }
    }
}

template <typename T>
void TokenStream::parseNumericSequence(TokenType p_Type, T p_IsDigitSequence)
{
    bool is_malformed = false;
    unsigned int length_sequence = 0;

    while (next() && !is_white_space(peek()))
    {
        if (next() && !startsWith('_'))
        {
            if (!startsWith('.') && is_symbol(peek()))
            {
                break;
            }
            else if (p_IsDigitSequence(peek()))
            {
                length_sequence++;
            }
            else
            {
                is_malformed = true;
            }
        }
        bump();
    }

    if (is_malformed || length_sequence == 0)
    {
        throw std::invalid_argument("malformed number");
    }

    addToken(p_Type);
}

void TokenStream::parseHexadecimal()
{
    bump(2);
    return parseNumericSequence(TokenType::NUMBER_HEXADECIMAL, &is_hexadecimal_digit);
}

void TokenStream::parseBinary()
{
    bump(2);
    return parseNumericSequence(TokenType::NUMBER_BINARY, &is_binary_digit);
}

void TokenStream::parseExponential()
{
    bump();

    if (startsWith('-') || startsWith('+'))
    {
        bump();
    }
    return parseNumericSequence(TokenType::NUMBER, &is_digit);
}

void TokenStream::parseNumber()
{
    bool is_malformed = false;
    unsigned int decimal_points = 0;

    while (next() && !is_white_space(peek()))
    {
        // Handle numbers with exponents.
        if (startsWith('e') || startsWith('E'))
        {
            parseExponential();
            return;
        }

        if (!startsWith('_'))
        {
            if (startsWith('.'))
            {
                decimal_points++;
            }
            else if (is_symbol(peek()))
            {
                break;
            }
            else if (!is_digit(peek()))
            {
                is_malformed = true;
            }
        }
        bump();
    }

    if (is_malformed || decimal_points > 1)
    {
        throw std::invalid_argument("malformed number");
    }

    addToken(TokenType::NUMBER);
}

void TokenStream::parseLongBrackets()
{
    std::string closing_bracket;

    bump();
    closing_bracket.push_back(']');

    while (startsWith('='))
    {
        bump();
        closing_bracket.push_back('=');
    }

    bump();
    closing_bracket.push_back(']');

    while (next())
    {
        if (startsWith(closing_bracket))
        {
            break;
        }
        bump();
    }
    if (startsWith(closing_bracket))
    {
        bump(closing_bracket.length());
    }
    else
    {
        throw std::invalid_argument("invalid bracket");
    }
}

void TokenStream::parseString()
{
    if (startsWithLongBracket())
    {
        parseLongBrackets();
        addToken(TokenType::STRING_RAW);
    }
    else
    {
        char quote = peek();
        bump();

        while (next() && !startsWith(quote) && !startsWith('\n'))
        {
            // Handle escape characters in strings.
            if (startsWith('\\'))
            {
                if (!next(1))
                {
                    throw std::invalid_argument("invalid escape sequence");
                }
                bump();
            }
            bump();
        }

        if (!startsWith(quote))
        {
            throw std::invalid_argument("malformed string");
        }

        bump();
        addToken(TokenType::STRING);
    }
}

void TokenStream::parseComment()
{
    bump(2);

    if (startsWithLongBracket())
    {
        parseLongBrackets();
        addToken(TokenType::COMMENT_RAW);
    }
    else
    {
        while (next() && !startsWith('\n'))
        {
            bump();
        }
        addToken(TokenType::COMMENT);
    }
}

void TokenStream::parseWord()
{
    while (next() && is_identifier(peek()))
    {
        bump();
    }

    for (const char* keyword: keywords)
    {
        if (m_Buffer == keyword)
        {
            addToken(TokenType::KEYWORD);
            return;
        }
    }
    addToken(TokenType::IDENTIFIER);
}

void TokenStream::parsePunctuation()
{
    for (const char* punctuation: punctuations)
    {
        if (startsWith(punctuation))
        {
            bump(strlen(punctuation));
            addToken(TokenType::PUNCTUATION);
            break;
        }
    }
}

bool TokenStream::startsWith(char p_Char)
{
    return next() && peek() == p_Char;
}

bool TokenStream::startsWith(const std::string& p_String) const
{
    return next(p_String.length() - 1) && m_Source.substr(m_Index, p_String.length()) == p_String;
}

bool TokenStream::startsWithComment() const
{
    return startsWith("--");
}

bool TokenStream::startsWithWord()
{
    return is_identifier_nondigit(peek());
}

bool TokenStream::startsWithString()
{
    return startsWith('\"') || startsWith('\'') || startsWithLongBracket();
}

bool TokenStream::startsWithNumber()
{
    return startsWith('.') && next(1) && is_digit(peek(1)) || is_digit(peek());
}

bool TokenStream::startsWithPunctuation() const
{
    for (const char* punctuation: punctuations)
    {
        if (startsWith(punctuation))
        {
            return true;
        }
    }
    return false;
}

bool TokenStream::startsWithLongBracket()
{
    if (startsWith('['))
    {
        int i = 1;
        while (next(i) && peek(i) == '=')
        {
            i++;
        }
        if (next(i) && peek(i) == '[')
        {
            return true;
        }
    }
    return false;
}

bool TokenStream::next(std::size_t p_Offset) const
{
    return m_Index + p_Offset < m_Length;
}

char TokenStream::peek(std::size_t p_Offset)
{
    return m_Source.at(m_Index + p_Offset);
}

void TokenStream::bump(std::size_t p_Amount)
{
    for (std::size_t i = 0; i < p_Amount; i++)
    {
        m_Buffer.push_back(consume());
    }
}

char TokenStream::consume()
{
    return m_Source.at(m_Index++);
}

void TokenStream::addToken(const TokenType& p_Type)
{
    // std::cout << m_Buffer << "\n";
    if (p_Type != TokenType::COMMENT && p_Type != TokenType::COMMENT_RAW)
    {
        m_Tokens.push_back(Token{.type = p_Type, .literal = m_Buffer});
    }
    m_Buffer.clear();
}
