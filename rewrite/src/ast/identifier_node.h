#ifndef IDENTIFIER_NODE_H
#define IDENTIFIER_NODE_H

#include <utility>
#include <string>

#include "expression_node.h"

class IdentifierNode final : public ExpressionNode
{
public:
    std::string value;

    explicit IdentifierNode(std::string p_Value) : value(std::move(p_Value)) {}
    void accept(AstVisitor* p_Visitor) override;
};



#endif //IDENTIFIER_NODE_H
