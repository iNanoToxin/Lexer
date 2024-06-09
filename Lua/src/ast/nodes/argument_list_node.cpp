#include "argument_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ArgumentListNode> ArgumentListNode::create(const std::shared_ptr<AstNode>& p_List)
{
    std::shared_ptr<ArgumentListNode> node = std::make_shared<ArgumentListNode>();
    node->list = p_List;

    if (node->list != nullptr)
    {
        node->list->setParent(node);
    }
    return node;
}

void ArgumentListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<ArgumentListNode>());
}
