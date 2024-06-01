#ifndef BINARYOPNODE_H
#define BINARYOPNODE_H

#include <string>
#include <utility>
#include "expression_node.h"

class BinaryOpNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> lhs;
    std::shared_ptr<ExpressionNode> rhs;
    std::string op;

    explicit BinaryOpNode() : ExpressionNode(AstKind::BinaryOpNode) {}

    static std::shared_ptr<BinaryOpNode> create(std::shared_ptr<ExpressionNode> p_Lhs, std::string p_Operator, std::shared_ptr<ExpressionNode> p_Rhs)
    {
        std::shared_ptr<BinaryOpNode> node = std::make_shared<BinaryOpNode>();
        node->lhs = std::move(p_Lhs);
        node->rhs = std::move(p_Rhs);
        node->op = std::move(p_Operator);

        if (node->lhs != nullptr)
        {
            node->lhs->parent = node;
        }
        if (node->rhs != nullptr)
        {
            node->rhs->parent = node;
        }
        return node;
    }
    static std::shared_ptr<BinaryOpNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<BinaryOpNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif
