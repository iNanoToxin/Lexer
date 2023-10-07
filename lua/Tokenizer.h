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

    [[nodiscard]] bool is(const std::string& tokenLiteral) const;
    [[nodiscard]] bool is(const TokenType& tokenType) const;
};

class TokenStream
{
public:
    std::size_t m_Length = 0;
    std::size_t m_Index = 0;
    std::string m_Source;
    std::string m_Buffer;
    std::vector<Token> m_Tokens;

    void tokenize(const std::string& source);

    template <typename T>
    void parseNumericSequence(TokenType type, T isDigitSequence);
    void parseHexadecimal();
    void parseBinary();
    void parseExponential();
    void parseNumber();
    void parseLongBrackets();
    void parseString();
    void parseComment();
    void parseWord();
    void parsePunctuation();

    [[nodiscard]] bool startsWith(char c);
    [[nodiscard]] bool startsWith(const std::string& string) const;
    [[nodiscard]] bool startsWithComment() const;
    [[nodiscard]] bool startsWithWord();
    [[nodiscard]] bool startsWithString();
    [[nodiscard]] bool startsWithNumber();
    [[nodiscard]] bool startsWithPunctuation() const;
    [[nodiscard]] bool startsWithLongBracket();
    [[nodiscard]] bool next(std::size_t offset = 0) const;
    [[nodiscard]] char peek(std::size_t offset = 0);

    void bump(std::size_t amount = 1);
    char consume();
    void addToken(const TokenType& type);
};

bool isDigit(char c);
bool isHexadecimalDigit(char c);
bool isBinaryDigit(char c);
bool isIdentifierNondigit(char c);
bool isIdentifier(char c);
bool isEscapeCharacter(char c);
bool isSymbol(char c);
bool isWhiteSpace(char c);
bool isKeyword(const std::string& str);

#endif