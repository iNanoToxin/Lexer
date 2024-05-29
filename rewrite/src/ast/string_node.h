#ifndef STRING_NODE_H
#define STRING_NODE_H

#include <utility>
#include <string>

#include "expression_node.h"

class StringNode final : public ExpressionNode
{
public:
    std::string value;

    explicit StringNode(std::string p_Value) : value(std::move(p_Value)) {}
    void accept(AstVisitor* p_Visitor) override;
};



#endif //STRING_NODE_H
