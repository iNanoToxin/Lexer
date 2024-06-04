#pragma once
#include "ast_node.h"

using LuaInteger = long long int;
using LuaDouble = double;

class NumberNode final : public AstNode
{
private:
    LuaInteger m_Int = 0;
    LuaDouble m_Double = 0.0;
    bool m_IsInteger = true;
public:
    explicit NumberNode() : AstNode(AstKind::NumberNode) {}

    static std::shared_ptr<NumberNode> create(const std::string& p_Number);
    static std::shared_ptr<NumberNode> create(LuaInteger p_Integer);
    static std::shared_ptr<NumberNode> create(LuaDouble p_Double);
    static std::shared_ptr<NumberNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;

    LuaDouble getDouble() const;
    LuaInteger getInt() const;
    void setDouble(LuaDouble p_Double);
    void setInt(LuaInteger p_Integer);
    void negate();
    bool isInt() const;
    bool isNegative() const;
    bool isConvertibleToInt() const;
    LuaDouble toDouble() const;
    LuaInteger toInt() const;
};
