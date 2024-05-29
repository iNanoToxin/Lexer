#ifndef VARARGS_NODE_H
#define VARARGS_NODE_H

#include "expression_node.h"

class VarargsNode final : public ExpressionNode
{
public:
    VarargsNode() = default;

    void accept(AstVisitor* p_Visitor) override;
};

#endif //VARARGS_NODE_H
