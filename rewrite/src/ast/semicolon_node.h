#ifndef SEMICOLON_NODE_H
#define SEMICOLON_NODE_H

#include "expression_node.h"

class SemicolonNode final : public ExpressionNode
{
public:
    SemicolonNode() = default;

    void accept(AstVisitor* p_Visitor) override;
};

#endif //SEMICOLON_NODE_H