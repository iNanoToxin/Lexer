#ifndef EXPRESSIONNODE_H
#define EXPRESSIONNODE_H

#include "ASTNode.h"
#include <memory>

// Base class for all expression nodes
class ExpressionNode : public ASTNode {
public:
    virtual ~ExpressionNode() = default;
};

using ExpressionNodePtr = std::unique_ptr<ExpressionNode>;

#endif
