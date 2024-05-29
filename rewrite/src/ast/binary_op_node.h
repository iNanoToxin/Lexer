#ifndef BINARYOPNODE_H
#define BINARYOPNODE_H

#include "expression_node.h"

class BinaryOpNode final : public ExpressionNode
{
public:
    ExpressionNode* lhs;
    ExpressionNode* rhs;
    char op;

    explicit BinaryOpNode(ExpressionNode* p_Lhs, const char p_Operator, ExpressionNode* p_Rhs) : lhs(p_Lhs), rhs(p_Rhs), op(p_Operator) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif
