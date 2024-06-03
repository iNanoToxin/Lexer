#pragma once
#include <string>
#include <vector>

enum class TokenType
{
    IDENTIFIER,
    STRING_RAW,
    STRING,
    COMMENT_RAW,
    COMMENT,
    NUMBER_HEXADECIMAL,
    NUMBER_BINARY,
    NUMBER,
    KEYWORD,
    PUNCTUATION
};

struct Token
{
public:
    TokenType type;
    std::string literal;

    bool is(const std::string& p_TokenLiteral) const;
    bool is(const TokenType& p_TokenType) const;
};

using Tokens = std::vector<Token>;

class TokenStream
{
private:
    std::size_t m_Length = 0;
    std::size_t m_Index = 0;
    std::string m_Source;
    std::string m_Buffer;
    Tokens m_Tokens;
public:
    void tokenize(const std::string& p_Source);

    template <typename T>
    void parseNumericSequence(TokenType p_Type, T p_IsDigitSequence);
    void parseHexadecimal();
    void parseBinary();
    void parseExponential();
    void parseNumber();
    void parseLongBrackets();
    void parseString();
    void parseComment();
    void parseWord();
    void parsePunctuation();

    bool startsWith(char p_Char) const;
    bool startsWith(const std::string& p_String) const;
    bool startsWithComment() const;
    bool startsWithWord() const;
    bool startsWithString() const;
    bool startsWithNumber() const;
    bool startsWithPunctuation() const;
    bool startsWithLongBracket() const;
    bool next(std::size_t p_Offset = 0) const;
    char peek(std::size_t p_Offset = 0) const;
    Tokens getTokens();

    void bump(std::size_t p_Amount = 1);
    char consume();
    void addToken(const TokenType& p_Type);
};

bool is_digit(char p_Char);
bool is_hexadecimal_digit(char p_Char);
bool is_binary_digit(char p_Char);
bool is_identifier_nondigit(char p_Char);
bool is_identifier(char p_Char);
bool is_escape_character(char p_Char);
bool is_symbol(char p_Char);
bool is_white_space(char p_Char);
bool is_keyword(const std::string& p_String);
