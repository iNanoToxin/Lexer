#include "number_node.h"
#include <cerrno>
#include <limits>
#include <optional>
#include "../../utilities/assert.h"
#include "ast/visitors/ast_visitor.h"

#define MAXBY10 ((unsigned long long)(LLONG_MAX / 10))
#define MAXLASTD ((int)(LLONG_MAX % 10))

inline int hex_value(const int p_Char)
{
    if (std::isdigit(p_Char)) return p_Char - '0';
    return std::tolower(p_Char) - 'a' + 10;
}

// static const char* l_str2d(const char* s, lua_Number* result)
// {
//     std::stoi();
//     const char* endptr;
//     const char* pmode = strpbrk(s, ".xXnN"); /* look for special chars */
//     int mode = pmode ? ltolower(cast_uchar(*pmode)) : 0;
//     if (mode == 'n') /* reject 'inf' and 'nan' */
//         return NULL;
//     endptr = l_str2dloc(s, result, mode); /* try to convert */
//     if (endptr == NULL)
//     {
//         /* failed? may be a different locale */
//         char buff[L_MAXLENNUM + 1];
//         const char* pdot = strchr(s, '.');
//         if (pdot == NULL || strlen(s) > L_MAXLENNUM) return NULL; /* string too long or no dot; fail */
//         strcpy(buff, s); /* copy string to buffer */
//         buff[pdot - s] = lua_getlocaledecpoint(); /* correct decimal point */
//         endptr = l_str2dloc(buff, result, mode); /* try again */
//         if (endptr != NULL) endptr = s + (endptr - buff); /* make relative to 's' */
//     }
//     return endptr;
// }


inline std::optional<LuaInteger> l_str2_int(const std::string& p_Num)
{
    std::size_t integer = 0;
    std::size_t index = 0;
    bool is_empty = true;
    bool is_negative = false;

    while (std::isspace(p_Num[index])) index++;

    if (p_Num[index] == '-')
    {
        index++;
        is_negative = true;
    }
    else if (p_Num[index] == '+')
    {
        index++;
    }

    if (p_Num[index] == '0' && (p_Num[index + 1] == 'x' || p_Num[index + 1] == 'X'))
    {
        index += 2;
        while (std::isxdigit(p_Num[index]))
        {
            integer = integer * 16 + hex_value(p_Num[index]);
            is_empty = false;
            index++;
        }
    }
    else
    {
        while (std::isdigit(p_Num[index]))
        {
            int d = p_Num[index] - '0';
            if (integer >= MAXBY10 && (integer > MAXBY10 || d > MAXLASTD + is_negative))
            {
                return std::optional<LuaInteger>{std::nullopt};
            }
            integer = integer * 10 + d;
            is_empty = false;
            index++;
        }
    }

    while (std::isspace(p_Num[index])) index++;

    if (is_empty || p_Num[index] != '\0')
    {
        return std::optional<LuaInteger>{std::nullopt};
    }
    return std::optional<LuaInteger>{is_negative ? 0u - integer : integer};
}


std::shared_ptr<NumberNode> NumberNode::create(const std::string& p_NumberLiteral)
{
    try
    {
        if (p_NumberLiteral.size() > 1 && p_NumberLiteral[0] == '0' && std::tolower(p_NumberLiteral[1]) == 'x')
        {
            return create(std::stoll(p_NumberLiteral, nullptr, 16));
        }
        return create(std::stoll(p_NumberLiteral));
    }
    catch (std::out_of_range&) {}

    try
    {
        return create(std::stod(p_NumberLiteral));
    }
    catch (std::out_of_range&)
    {
        return create(std::numeric_limits<LuaDouble>::infinity());
    }
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
