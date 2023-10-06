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

bool Parser::expect_peek(token_type type, std::size_t offset)
{
    return next(offset) && peek(offset).type == type;
}

bool Parser::expect_peek(const std::string& match, std::size_t offset)
{
    return next(offset) && peek(offset).literal == match;
}
