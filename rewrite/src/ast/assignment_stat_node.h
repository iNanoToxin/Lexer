#ifndef ASSIGNMENT_STAT_NODE_H
#define ASSIGNMENT_STAT_NODE_H

#include "expression_node.h"

class AssignmentStatNode final : public ExpressionNode
{
public:
    ExpressionNode* variableList;
    ExpressionNode* expressionList;

    explicit AssignmentStatNode(ExpressionNode* p_VariableList, ExpressionNode* p_ExpressionList) : ExpressionNode(AstKind::AssignmentStatNode), variableList(p_VariableList), expressionList(p_ExpressionList) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //ASSIGNMENT_STAT_NODE_H
