#ifndef FUNC_CALL_NODE_H
#define FUNC_CALL_NODE_H

#include "expression_node.h"

class FuncCallNode final : public ExpressionNode
{
public:
    ExpressionNode* root;
    ExpressionNode* args;

    explicit FuncCallNode(ExpressionNode* p_Root, ExpressionNode* p_Args) : ExpressionNode(AstKind::FuncCallNode), root(p_Root), args(p_Args) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FUNC_CALL_NODE_H
