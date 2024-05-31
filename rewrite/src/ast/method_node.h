#ifndef METHOD_NODE_H
#define METHOD_NODE_H

#include "expression_node.h"

class MethodNode final : public ExpressionNode
{
public:
    ExpressionNode* root;
    ExpressionNode* method;

    explicit MethodNode(ExpressionNode* p_Root, ExpressionNode* p_Name) : ExpressionNode(AstKind::MethodNode), root(p_Root), method(p_Name)
    {
        if (root) root->parent = this;
        if (method) method->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //METHOD_NODE_H
