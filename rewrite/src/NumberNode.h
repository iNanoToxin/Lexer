#ifndef NUMBERNODE_H
#define NUMBERNODE_H

#include "ExpressionNode.h"

// Node for numeric literals
class NumberNode : public ExpressionNode {
public:
    NumberNode(int value) : value(value) {}

    void accept(ASTVisitor& visitor) override;

    int value;
};

#endif
