#ifndef ATTRIBUTE_NODE_H
#define ATTRIBUTE_NODE_H

#include <utility>

#include "expression_node.h"

class AttributeNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> value;
    std::shared_ptr<ExpressionNode> attribute;

    explicit AttributeNode() : ExpressionNode(AstKind::AttributeNode) {}

    static std::shared_ptr<AttributeNode> create(std::shared_ptr<ExpressionNode> p_Value, std::shared_ptr<ExpressionNode> p_Attribute)
    {
        std::shared_ptr<AttributeNode> node = std::make_shared<AttributeNode>();
        node->value = std::move(p_Value);
        node->attribute = std::move(p_Attribute);

        if (node->value != nullptr)
        {
            node->value->parent = node;
        }
        if (node->attribute != nullptr)
        {
            node->attribute->parent = node;
        }
        return node;
    }
    static std::shared_ptr<AttributeNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<AttributeNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //ATTRIBUTE_NODE_H
