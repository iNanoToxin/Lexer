#include "argument_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ArgumentListNode> ArgumentListNode::create(std::shared_ptr<AstNode> p_List)
{
    std::shared_ptr<ArgumentListNode> node = std::make_shared<ArgumentListNode>();
    node->list = std::move(p_List);

    if (node->list != nullptr)
    {
        node->list->getParent() = node;
    }
    return node;
}

std::shared_ptr<ArgumentListNode> ArgumentListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<ArgumentListNode>(p_Node);
}

void ArgumentListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
