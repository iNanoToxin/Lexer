#ifndef EXPRESSIONNODE_H
#define EXPRESSIONNODE_H

#include "ast_node.h"

class ExpressionNode : public AstNode
{
public:
    explicit ExpressionNode(const AstKind& p_Kind) : AstNode(p_Kind) {}
    ~ExpressionNode() override = default;
    void destroy() override;
};

inline void ExpressionNode::destroy()
{
    delete this;
}

#endif
