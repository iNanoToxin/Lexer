#pragma once
#include <optional>
#include "ast_node.h"

using LuaInteger = long long int;
using LuaDouble = double;

class NumberNode final : public AstNode
{
public:
    LuaInteger numInteger = 0;
    LuaDouble numDouble = 0.0;
    bool isInteger = true;
    bool isNegative = false;

    explicit NumberNode() : AstNode(AstKind::NumberNode) {}

    static std::shared_ptr<NumberNode> create(const std::string& p_NumberLiteral);
    static std::shared_ptr<NumberNode> create(LuaInteger p_Integer);
    static std::shared_ptr<NumberNode> create(LuaDouble p_Double);
    static std::shared_ptr<NumberNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
