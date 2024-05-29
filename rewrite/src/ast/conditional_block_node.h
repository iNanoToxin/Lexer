#ifndef CONDITIONAL_BLOCK_NODE_H
#define CONDITIONAL_BLOCK_NODE_H

#include "expression_node.h"

class ConditionalBlockNode final : public ExpressionNode
{
public:
    ExpressionNode* ptr1;
    ExpressionNode* ptr2;

    ConditionalBlockNode(ExpressionNode* p_Ptr1, ExpressionNode* p_Ptr2) : ptr1(p_Ptr1), ptr2(p_Ptr2) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //CONDITIONAL_BLOCK_NODE_H
