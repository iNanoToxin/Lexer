#ifndef VARIABLE_LIST_NODE_H
#define VARIABLE_LIST_NODE_H

#include "expression_node.h"

class VariableListNode final : public ExpressionNode
{
public:
    ExpressionNode* ptr1;
    ExpressionNode* ptr2;

    VariableListNode(ExpressionNode* p_Ptr1, ExpressionNode* p_Ptr2) : ptr1(p_Ptr1), ptr2(p_Ptr2) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //VARIABLE_LIST_NODE_H
