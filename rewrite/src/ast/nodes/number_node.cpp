#include "number_node.h"
#include <limits>
#include "../../utilities/assert.h"
#include "ast/visitors/ast_visitor.h"

inline bool l_str2_int(LuaInteger* p_Out, const std::string& p_Number)
{
    try
    {
        std::size_t position;
        if (p_Number.size() > 1 && p_Number[0] == '0' && std::tolower(p_Number[1]) == 'x')
        {
            *p_Out = std::stoll(p_Number, &position, 16);
            return position == p_Number.size();
        }
        *p_Out = std::stoll(p_Number, &position);
        return position == p_Number.size();
    }
    catch (...) {}
    return false;
}

inline bool l_str2_double(LuaDouble* p_Out, const std::string& p_Number)
{
    try
    {
        std::size_t position;
        *p_Out = std::stod(p_Number, &position);
        return position == p_Number.size();
    }
    catch (std::out_of_range&)
    {
        *p_Out = std::numeric_limits<LuaDouble>::infinity();
    }
    catch (std::invalid_argument&)
    {
        return false;
    }
    return true;
}


std::shared_ptr<NumberNode> NumberNode::create(const std::string& p_NumberLiteral)
{
    LuaInteger lua_integer = 0;
    if (l_str2_int(&lua_integer, p_NumberLiteral))
    {
        return create(lua_integer);
    }

    LuaDouble lua_double = 0;
    if (l_str2_double(&lua_double, p_NumberLiteral))
    {
        return create(lua_double);
    }
    LL_failure("p_NumberLiteral != number", "Failed to convert string to number");
    return nullptr;
}

std::shared_ptr<NumberNode> NumberNode::create(const LuaInteger p_Integer)
{
    std::shared_ptr<NumberNode> node = std::make_shared<NumberNode>();
    node->numInteger = p_Integer;
    node->isInteger = true;
    return node;
}

std::shared_ptr<NumberNode> NumberNode::create(const LuaDouble p_Double)
{
    std::shared_ptr<NumberNode> node = std::make_shared<NumberNode>();
    node->numDouble = p_Double;
    node->isInteger = false;
    return node;
}

std::shared_ptr<NumberNode> NumberNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<NumberNode>(p_Node);
}

void NumberNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
