#ifndef NUMERIC_FOR_STAT_NODE_H
#define NUMERIC_FOR_STAT_NODE_H

#include "expression_node.h"

class NumericForStatNode final : public ExpressionNode
{
public:
    ExpressionNode* name;
    ExpressionNode* init;
    ExpressionNode* goal;
    ExpressionNode* step;
    ExpressionNode* block;

    explicit NumericForStatNode(ExpressionNode* p_Name, ExpressionNode* p_Init, ExpressionNode* p_Goal, ExpressionNode* p_Step, ExpressionNode* p_Block) : ExpressionNode(AstKind::NumericForStatNode), name(p_Name), init(p_Init), goal(p_Goal), step(p_Step), block(p_Block)
    {
        if (name) name->parent = this;
        if (init) init->parent = this;
        if (goal) goal->parent = this;
        if (step) step->parent = this;
        if (block) block->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //NUMERIC_FOR_STAT_NODE_H
