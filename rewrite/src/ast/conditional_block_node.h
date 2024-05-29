#ifndef CONDITIONAL_BLOCK_NODE_H
#define CONDITIONAL_BLOCK_NODE_H

#include "expression_node.h"

class ConditionalBlockNode final : public ExpressionNode
{
public:
    ExpressionNode* condition;
    ExpressionNode* block;

    ConditionalBlockNode(ExpressionNode* p_Condition, ExpressionNode* p_Block) : condition(p_Condition), block(p_Block) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //CONDITIONAL_BLOCK_NODE_H
