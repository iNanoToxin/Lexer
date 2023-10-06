#include "Parser.h"

bool Parser::next(std::size_t offset) const
{
    return m_Index + offset < m_Length;
}

token Parser::peek(std::size_t offset)
{
    return m_Tokens.at(m_Index + offset);
}

std::size_t Parser::mark() const
{
    return m_Index;
}

token Parser::consume()
{
    return m_Tokens.at(m_Index++);
}

void Parser::revert(std::size_t marked)
{
    m_Index = marked;
}

bool Parser::expectPeek(token_type type, std::size_t offset)
{
    return next(offset) && peek(offset).type == type;
}

bool Parser::expectPeek(const std::string& match, std::size_t offset)
{
    return next(offset) && peek(offset).literal == match;
}





bool isBinaryOperator(const token& currentToken)
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

bool isFieldSeparator(const token& currentToken)
{
    return currentToken.is(",") || currentToken.is(";");
}

bool isUnaryOperator(const token& currentToken)
{
    return currentToken.is("-")
        || currentToken.is("not")
        || currentToken.is("#")
        || currentToken.is("~");
}

bool isBoolean(const token& currentToken)
{
    return currentToken.is("true") || currentToken.is("false");
}

bool isConditional(const token& currentToken)
{
    return currentToken.is("and") || currentToken.is("or");
}

bool isNull(const token& currentToken)
{
    return currentToken.is("nil");
}
