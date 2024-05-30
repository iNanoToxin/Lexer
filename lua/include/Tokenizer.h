#ifndef LUA_TOKENIZER_H
#define LUA_TOKENIZER_H

#include <string>
#include <vector>
#include <cstring>
#include <stdexcept>

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

    [[nodiscard]] bool is(const std::string& p_TokenLiteral) const;
    [[nodiscard]] bool is(const TokenType& p_TokenType) const;
};

class TokenStream
{
public:
    std::size_t m_Length = 0;
    std::size_t m_Index = 0;
    std::string m_Source;
    std::string m_Buffer;
    std::vector<Token> m_Tokens;

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

    [[nodiscard]] bool startsWith(char p_Char);
    [[nodiscard]] bool startsWith(const std::string& p_String) const;
    [[nodiscard]] bool startsWithComment() const;
    [[nodiscard]] bool startsWithWord();
    [[nodiscard]] bool startsWithString();
    [[nodiscard]] bool startsWithNumber();
    [[nodiscard]] bool startsWithPunctuation() const;
    [[nodiscard]] bool startsWithLongBracket();
    [[nodiscard]] bool next(std::size_t p_Offset = 0) const;
    [[nodiscard]] char peek(std::size_t p_Offset = 0);

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

#endif
