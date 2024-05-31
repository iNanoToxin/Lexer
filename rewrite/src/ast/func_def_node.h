#ifndef FUNC_DEF_NODE_H
#define FUNC_DEF_NODE_H

#include "expression_node.h"

class FuncDefNode final : public ExpressionNode
{
public:
    ExpressionNode* name;
    ExpressionNode* body;

    explicit FuncDefNode(ExpressionNode* p_Name, ExpressionNode* p_Body) : ExpressionNode(AstKind::FuncDefNode), name(p_Name), body(p_Body)
    {
        if (name) name->parent = this;
        if (body) body->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FUNC_DEF_NODE_H
