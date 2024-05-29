#ifndef BOOLEAN_NODE_H
#define BOOLEAN_NODE_H

#include <utility>
#include <string>

#include "expression_node.h"

class BooleanNode final : public ExpressionNode
{
public:
    bool value;

    explicit BooleanNode(bool p_Value) : value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
};



#endif //BOOLEAN_NODE_H
