#ifndef NUMBERNODE_H
#define NUMBERNODE_H

#include <string>
#include "expression_node.h"

class NumberNode final : public ExpressionNode {
public:
    int value;

    explicit NumberNode(const int p_Value) : ExpressionNode(AstKind::NumberNode), value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif
