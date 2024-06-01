#include "field_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FieldListNode> FieldListNode::create(std::vector<std::shared_ptr<AstNode>> p_List)
{
    std::shared_ptr<FieldListNode> node = std::make_shared<FieldListNode>();
    node->list = std::move(p_List);

    for (const std::shared_ptr<AstNode>& child : node->list)
    {
        if (child != nullptr)
        {
            child->parent = node;
        }
    }
    return node;
}

std::shared_ptr<FieldListNode> FieldListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<FieldListNode>(p_Node);
}

void FieldListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
