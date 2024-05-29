#ifndef NUMBERNODE_H
#define NUMBERNODE_H

#include "expression_node.h"

class NumberNode final : public ExpressionNode {
public:
    explicit NumberNode(const int p_Value) : value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;

    int value;
};

#endif
