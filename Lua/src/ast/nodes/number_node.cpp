#include "number_node.h"
#include <limits>
#include "utilities/assert.h"
#include "ast/visitors/ast_visitor.h"
#include "utilities/math.h"
#include "lua.h"
#include "lnumutils.h"

std::shared_ptr<NumberNode> NumberNode::create(const std::string& p_Number)
{
    LuaInteger lua_integer = 0;
    if (Math::string_to_integer(&lua_integer, p_Number))
    {
        return create(lua_integer);
    }

    LuaDouble lua_double = 0;
    if (Math::string_to_double(&lua_double, p_Number))
    {
        return create(lua_double);
    }
    LL_failure("p_NumberLiteral != number", "Failed to convert string to number");
    return nullptr;
}

std::shared_ptr<NumberNode> NumberNode::create(const LuaInteger p_Integer)
{
    std::shared_ptr<NumberNode> node = std::make_shared<NumberNode>();
    node->setInt(p_Integer);
    return node;
}

std::shared_ptr<NumberNode> NumberNode::create(const LuaDouble p_Double)
{
    std::shared_ptr<NumberNode> node = std::make_shared<NumberNode>();
    node->setDouble(p_Double);
    return node;
}

void NumberNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<NumberNode>());
}

void NumberNode::setInt(const LuaInteger p_Integer)
{
    m_IsInteger = true;
    m_Int = p_Integer;
}

void NumberNode::negate()
{
    if (isInt())
    {
        m_Int *= -1;
    }
    else
    {
        m_Double *= -1;
    }
}

LuaInteger NumberNode::getInt() const
{
    return m_Int;
}

void NumberNode::setDouble(const LuaDouble p_Double)
{
    m_IsInteger = false;
    m_Double = p_Double;
}

LuaDouble NumberNode::getDouble() const
{
    return m_Double;
}

bool NumberNode::isInt() const
{
    return m_IsInteger;
}

bool NumberNode::isNegative() const
{
    return isInt() ? m_Int < 0 : m_Double < 0.0;
}

bool NumberNode::isConvertibleToInt() const
{
    return isInt() || Math::is_convertible_to_int(m_Double);
}

LuaDouble NumberNode::toDouble() const
{
    return isInt() ? static_cast<LuaDouble>(getInt()) : getDouble();
}

LuaInteger NumberNode::toInt() const
{
    return isInt() ? getInt() : static_cast<LuaInteger>(getDouble());
}

std::string NumberNode::toString() const
{
    // char s[LUAI_MAXNUM2STR];
    // char* s2 = luai_num2str(s, 4343.0);
    // std::cout << s << " format: " << (s2[0] == '\0') << std::endl;
    //
    // for (int i = 0; i < LUAI_MAXNUM2STR; i++)
    // {
    //     if (s[i] == '\0')
    //     {
    //         break;
    //     }
    //     std::cout << s[i];
    // }
    // std::cout << std::endl;

    return "std::string{s}";
}
