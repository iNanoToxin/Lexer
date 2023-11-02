#include "Parser.h"

bool Parser::next(std::size_t offset) const
{
    return m_Index + offset < m_Length;
}

Token Parser::peek(std::size_t offset)
{
    return m_Tokens.at(m_Index + offset);
}

std::size_t Parser::mark() const
{
    return m_Index;
}

Token Parser::consume()
{
    return m_Tokens.at(m_Index++);
}

void Parser::revert(std::size_t marked)
{
    m_Index = marked;
}

bool Parser::expectPeek(TokenType type, std::size_t offset)
{
    return next(offset) && peek(offset).type == type;
}

bool Parser::expectPeek(const std::string& match, std::size_t offset)
{
    return next(offset) && peek(offset).literal == match;
}





bool isBinaryOperator(const Token& currentToken)
{
    return currentToken.is("+")
        || currentToken.is("-")
        || currentToken.is("*")
        || currentToken.is("/")
        || currentToken.is("//")
        || currentToken.is("^")
        || currentToken.is("%")
        || currentToken.is("&")
        || currentToken.is("~")
        || currentToken.is("|")
        || currentToken.is(">>")
        || currentToken.is("<<")
        || currentToken.is("..")
        || currentToken.is("<")
        || currentToken.is("<=")
        || currentToken.is(">")
        || currentToken.is(">=")
        || currentToken.is("==")
        || currentToken.is("~=")
        || currentToken.is("and")
        || currentToken.is("or");
}

bool isFieldSeparator(const Token& currentToken)
{
    return currentToken.is(",") || currentToken.is(";");
}

bool isUnaryOperator(const Token& currentToken)
{
    return currentToken.is("-")
        || currentToken.is("not")
        || currentToken.is("#")
        || currentToken.is("~");
}

bool isBoolean(const Token& currentToken)
{
    return currentToken.is("true") || currentToken.is("false");
}

bool isConditional(const Token& currentToken)
{
    return currentToken.is("and") || currentToken.is("or");
}

bool isNull(const Token& currentToken)
{
    return currentToken.is("nil");
}

bool isRhsAssociative(const Token& token)
{
    return token.literal == "^" || token.literal == "..";
}
