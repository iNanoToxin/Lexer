#ifndef BOOLEAN_NODE_H
#define BOOLEAN_NODE_H

#include "expression_node.h"

class BooleanNode final : public ExpressionNode
{
public:
    bool value;

    explicit BooleanNode(bool p_Value) : ExpressionNode(AstKind::BooleanNode), value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
};



#endif //BOOLEAN_NODE_H
