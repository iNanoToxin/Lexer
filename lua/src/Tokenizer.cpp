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


bool isDigit(char c)
{
    return (c >= '0') && (c <= '9');
}

bool isHexadecimalDigit(char c)
{
    return isDigit(c) || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F');
}

bool isBinaryDigit(char c)
{
    return (c == '0') || (c == '1');
}

bool isIdentifierNondigit(char c)
{
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c == '_');
}

bool isIdentifier(char c)
{
    return isIdentifierNondigit(c) || (c >= '0' && c <= '9');
}

bool isEscapeCharacter(char c)
{
    switch (c)
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

bool isSymbol(char c)
{
    switch (c)
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

bool isWhiteSpace(char c)
{
    return (c == ' ' || c == '\n' || c == '\t' || c == '\r' || c == '\v' || c == '\f');
}

bool isKeyword(const std::string& str)
{
    for (const char* keyword: keywords)
    {
        if (keyword == str)
        {
            return true;
        }
    }
    return false;
}

bool Token::is(const std::string& tokenLiteral) const
{
    return literal == tokenLiteral;
}

bool Token::is(const TokenType& tokenType) const
{
    return type == tokenType;
}

void TokenStream::tokenize(const std::string& source)
{
    m_Source = source;
    m_Length = source.length();

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
        else if (isWhiteSpace(peek()))
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
void TokenStream::parseNumericSequence(TokenType type, T isDigitSequence)
{
    bool is_malformed = false;
    unsigned int length_sequence = 0;

    while (next() && !isWhiteSpace(peek()))
    {
        if (next() && !startsWith('_'))
        {
            if (!startsWith('.') && isSymbol(peek()))
            {
                break;
            }
            else if (isDigitSequence(peek()))
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

    addToken(type);
}

void TokenStream::parseHexadecimal()
{
    bump(2);
    return parseNumericSequence(TokenType::NUMBER_HEXADECIMAL, &isHexadecimalDigit);
}

void TokenStream::parseBinary()
{
    bump(2);
    return parseNumericSequence(TokenType::NUMBER_BINARY, &isBinaryDigit);
}

void TokenStream::parseExponential()
{
    bump();

    if (startsWith('-') || startsWith('+'))
    {
        bump();
    }
    return parseNumericSequence(TokenType::NUMBER, &isDigit);
}

void TokenStream::parseNumber()
{
    bool is_malformed = false;
    unsigned int decimal_points = 0;

    while (next() && !isWhiteSpace(peek()))
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
            else if (isSymbol(peek()))
            {
                break;
            }
            else if (!isDigit(peek()))
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
    while (next() && isIdentifier(peek()))
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
    for (auto punctuation: punctuations)
    {
        if (startsWith(punctuation))
        {
            bump(strlen(punctuation));
            addToken(TokenType::PUNCTUATION);
            break;
        }
    }
}

bool TokenStream::startsWith(char c)
{
    return next() && peek() == c;
}

bool TokenStream::startsWith(const std::string& string) const
{
    return next(string.length() - 1) && m_Source.substr(m_Index, string.length()) == string;
}

bool TokenStream::startsWithComment() const
{
    return startsWith("--");
}

bool TokenStream::startsWithWord()
{
    return isIdentifierNondigit(peek());
}

bool TokenStream::startsWithString()
{
    return startsWith('\"') || startsWith('\'') || startsWithLongBracket();
}

bool TokenStream::startsWithNumber()
{
    return startsWith('.') && next(1) && isDigit(peek(1)) || isDigit(peek());
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

bool TokenStream::next(std::size_t offset) const
{
    return m_Index + offset < m_Length;
}

char TokenStream::peek(std::size_t offset)
{
    return m_Source.at(m_Index + offset);
}

void TokenStream::bump(std::size_t amount)
{
    for (std::size_t i = 0; i < amount; i++)
    {
        m_Buffer.push_back(consume());
    }
}

char TokenStream::consume()
{
    return m_Source.at(m_Index++);
}

void TokenStream::addToken(const TokenType& type)
{
    // std::cout << m_Buffer << "\n";
    if (type != TokenType::COMMENT && type != TokenType::COMMENT_RAW)
    {
        m_Tokens.push_back(Token{.type = type, .literal = m_Buffer});
    }
    m_Buffer.clear();
}
