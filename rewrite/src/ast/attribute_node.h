#ifndef ATTRIBUTE_NODE_H
#define ATTRIBUTE_NODE_H

#include "expression_node.h"

class AttributeNode final : public ExpressionNode
{
public:
    ExpressionNode* value;
    ExpressionNode* attribute;

    explicit AttributeNode(ExpressionNode* p_Value, ExpressionNode* p_Attribute) : ExpressionNode(AstKind::AttributeNode), value(p_Value), attribute(p_Attribute) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //ATTRIBUTE_NODE_H
