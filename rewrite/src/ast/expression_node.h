#ifndef EXPRESSIONNODE_H
#define EXPRESSIONNODE_H

#include "ast_node.h"
#include <memory>

class ExpressionNode : public ASTNode {
public:
    virtual ~ExpressionNode() = default;
};

using ExpressionNodePtr = std::unique_ptr<ExpressionNode>;

#endif
