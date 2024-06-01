#pragma once
#include <string>
#include "ast_node.h"

class BinaryOpNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> lhs;
    std::shared_ptr<AstNode> rhs;
    std::string op;

    explicit BinaryOpNode() : AstNode(AstKind::BinaryOpNode) {}

    static std::shared_ptr<BinaryOpNode> create(std::shared_ptr<AstNode> p_Lhs, std::string p_Operator, std::shared_ptr<AstNode> p_Rhs);
    static std::shared_ptr<BinaryOpNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
