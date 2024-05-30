#ifndef FOR_STAT_NODE_H
#define FOR_STAT_NODE_H

#include "expression_node.h"

class ForStatNode final : public ExpressionNode
{
public:
    ExpressionNode* name = nullptr;
    ExpressionNode* init = nullptr;
    ExpressionNode* goal = nullptr;
    ExpressionNode* step = nullptr;
    ExpressionNode* block = nullptr;

    ExpressionNode* nameList = nullptr;
    ExpressionNode* expressionList = nullptr;

    explicit ForStatNode(ExpressionNode* p_Name, ExpressionNode* p_Init, ExpressionNode* p_Goal, ExpressionNode* p_Step, ExpressionNode* p_Block) : ExpressionNode(AstKind::ForStatNode), name(p_Name), init(p_Init), goal(p_Goal), step(p_Step), block(p_Block) {}

    explicit ForStatNode(ExpressionNode* p_NameList, ExpressionNode* p_ExpressionList) : ExpressionNode(AstKind::ForStatNode), nameList(p_NameList), expressionList(p_ExpressionList) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FOR_STAT_NODE_H
