#ifndef REPEAT_STAT_NODE_H
#define REPEAT_STAT_NODE_H

#include "expression_node.h"

class RepeatStatNode final : public ExpressionNode
{
public:
    ExpressionNode* block;
    ExpressionNode* condition;

    explicit RepeatStatNode(ExpressionNode* p_Block, ExpressionNode* p_Condition) : ExpressionNode(AstKind::RepeatStatNode), block(p_Block), condition(p_Condition)
    {
        if (block) block->parent = this;
        if (condition) condition->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //REPEAT_STAT_NODE_H
