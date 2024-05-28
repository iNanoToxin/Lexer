#ifndef NUMBERNODE_H
#define NUMBERNODE_H

#include "expression_node.h"

class NumberNode : public ExpressionNode {
public:
    NumberNode(int value) : value(value) {}

    void accept(ASTVisitor& visitor) override;

    int value;
};

#endif
