#ifndef METHOD_NODE_H
#define METHOD_NODE_H

#include "expression_node.h"

class MethodNode final : public ExpressionNode
{
public:
    ExpressionNode* root;
    ExpressionNode* name;

    MethodNode(ExpressionNode* p_Root, ExpressionNode* p_Name) : root(p_Root), name(p_Name) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //METHOD_NODE_H
