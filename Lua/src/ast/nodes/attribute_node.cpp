#include "attribute_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AttributeNode> AttributeNode::create(const std::shared_ptr<AstNode>& p_Value, const std::shared_ptr<AstNode>& p_Attribute)
{
    std::shared_ptr<AttributeNode> node = std::make_shared<AttributeNode>();
    node->value = p_Value;
    node->attribute = p_Attribute;

    if (node->value != nullptr)
    {
        node->value->setParent(node);
    }
    if (node->attribute != nullptr)
    {
        node->attribute->setParent(node);
    }
    return node;
}

void AttributeNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<AttributeNode>());
}
