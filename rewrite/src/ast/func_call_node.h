#ifndef FUNC_CALL_NODE_H
#define FUNC_CALL_NODE_H

#include "expression_node.h"

class FuncCallNode final : public ExpressionNode
{
public:
    ExpressionNode* ptr1;
    ExpressionNode* ptr2;

    FuncCallNode(ExpressionNode* p_Ptr1, ExpressionNode* p_Ptr2) : ptr1(p_Ptr1), ptr2(p_Ptr2) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FUNC_CALL_NODE_H
