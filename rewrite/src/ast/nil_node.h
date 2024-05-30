#ifndef NIL_NODE_H
#define NIL_NODE_H

#include "expression_node.h"

class NilNode final : public ExpressionNode
{
public:
    explicit NilNode() : ExpressionNode(AstKind::NilNode) {}

    void accept(AstVisitor* p_Visitor) override;
};

#endif //NIL_NODE_H
