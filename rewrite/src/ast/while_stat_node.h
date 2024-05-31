#ifndef WHILE_STAT_NODE_H
#define WHILE_STAT_NODE_H

#include "expression_node.h"

class WhileStatNode final : public ExpressionNode
{
public:
    ExpressionNode* condition;
    ExpressionNode* block;

    explicit WhileStatNode(ExpressionNode* p_Condition, ExpressionNode* p_Block) : ExpressionNode(AstKind::WhileStatNode), condition(p_Condition), block(p_Block)
    {
        if (condition) condition->parent = this;
        if (block) block->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //WHILE_STAT_NODE_H
