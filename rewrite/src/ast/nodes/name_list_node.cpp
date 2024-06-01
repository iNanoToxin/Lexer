#include "name_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NameListNode> NameListNode::create(std::vector<std::shared_ptr<AstNode>> p_List)
{
    std::shared_ptr<NameListNode> node = std::make_shared<NameListNode>();
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

std::shared_ptr<NameListNode> NameListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<NameListNode>(p_Node);
}

void NameListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
