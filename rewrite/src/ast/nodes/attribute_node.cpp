#include "attribute_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AttributeNode> AttributeNode::create(std::shared_ptr<AstNode> p_Value, std::shared_ptr<AstNode> p_Attribute)
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

std::shared_ptr<AttributeNode> AttributeNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<AttributeNode>(p_Node);
}

void AttributeNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
