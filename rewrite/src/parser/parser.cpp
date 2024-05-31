#include "Parser.h"

bool Parser::next(const std::size_t p_Offset) const
{
    return m_Index + p_Offset < m_Length;
}

Token Parser::peek(const std::size_t p_Offset)
{
    return m_Tokens.at(m_Index + p_Offset);
}

std::size_t Parser::mark() const
{
    return m_Index;
}

Token Parser::consume()
{
    return m_Tokens.at(m_Index++);
}

void Parser::revert(const std::size_t p_Marked)
{
    m_Index = p_Marked;
}

bool Parser::expectPeek(const TokenType p_Type, const std::size_t p_Offset)
{
    return next(p_Offset) && peek(p_Offset).type == p_Type;
}

bool Parser::expectPeek(const std::string& p_Match, const std::size_t p_Offset)
{
    return next(p_Offset) && peek(p_Offset).literal == p_Match;
}





bool is_binary_operator(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("+")
           || p_CurrentToken.is("-")
           || p_CurrentToken.is("*")
           || p_CurrentToken.is("/")
           || p_CurrentToken.is("//")
           || p_CurrentToken.is("^")
           || p_CurrentToken.is("%")
           || p_CurrentToken.is("&")
           || p_CurrentToken.is("~")
           || p_CurrentToken.is("|")
           || p_CurrentToken.is(">>")
           || p_CurrentToken.is("<<")
           || p_CurrentToken.is("..")
           || p_CurrentToken.is("<")
           || p_CurrentToken.is("<=")
           || p_CurrentToken.is(">")
           || p_CurrentToken.is(">=")
           || p_CurrentToken.is("==")
           || p_CurrentToken.is("~=")
           || p_CurrentToken.is("and")
           || p_CurrentToken.is("or");
}

bool is_field_separator(const Token& p_CurrentToken)
{
    return p_CurrentToken.is(",") || p_CurrentToken.is(";");
}

bool is_unary_operator(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("-")
           || p_CurrentToken.is("not")
           || p_CurrentToken.is("#")
           || p_CurrentToken.is("~");
}

bool is_boolean(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("true") || p_CurrentToken.is("false");
}

bool is_conditional(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("and") || p_CurrentToken.is("or");
}

bool is_null(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("nil");
}

bool is_rhs_associative(const Token& p_Token)
{
    return p_Token.literal == "^" || p_Token.literal == "..";
}
