#ifndef EXPRESSIONNODE_H
#define EXPRESSIONNODE_H

#include "ast_node.h"

class ExpressionNode : public AstNode
{
public:
    ~ExpressionNode() override = default;
    void destroy() override;
};

inline void ExpressionNode::destroy()
{
    delete this;
}

#endif
