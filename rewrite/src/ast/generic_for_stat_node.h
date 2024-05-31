#ifndef GENERIC_FOR_STAT_NODE_H
#define GENERIC_FOR_STAT_NODE_H

#include "expression_node.h"

class GenericForStatNode final : public ExpressionNode
{
public:
    ExpressionNode* nameList;
    ExpressionNode* expressionList;
    ExpressionNode* block;

    explicit GenericForStatNode(ExpressionNode* p_NameList, ExpressionNode* p_ExpressionList, ExpressionNode* p_Block) : ExpressionNode(AstKind::NumericForStatNode), nameList(p_NameList), expressionList(p_ExpressionList), block(p_Block)
    {
        if (nameList) nameList->parent = this;
        if (expressionList) expressionList->parent = this;
        if (block) block->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //GENERIC_FOR_STAT_NODE_H
