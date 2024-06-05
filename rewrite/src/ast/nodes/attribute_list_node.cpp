#include "attribute_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AttributeListNode> AttributeListNode::create(std::vector<std::shared_ptr<AstNode>> p_List)
{
    std::shared_ptr<AttributeListNode> node = std::make_shared<AttributeListNode>();
    node->list = std::move(p_List);

    for (const std::shared_ptr<AstNode>& child : node->list)
    {
        if (child != nullptr)
        {
            child->setParent(node);
        }
    }
    return node;
}

std::shared_ptr<AttributeListNode> AttributeListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<AttributeListNode>(p_Node);
}

void AttributeListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
