#ifndef BINARYOPNODE_H
#define BINARYOPNODE_H

#include <string>
#include <utility>
#include "expression_node.h"

class BinaryOpNode final : public ExpressionNode
{
public:
    ExpressionNode* lhs;
    ExpressionNode* rhs;
    std::string op;

    explicit BinaryOpNode(ExpressionNode* p_Lhs, std::string p_Operator, ExpressionNode* p_Rhs) : ExpressionNode(AstKind::BinaryOpNode), lhs(p_Lhs), rhs(p_Rhs), op(std::move(p_Operator)) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif
