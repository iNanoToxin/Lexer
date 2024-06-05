#include "return_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ReturnStatNode> ReturnStatNode::create(std::shared_ptr<AstNode> p_Args)
{
    std::shared_ptr<ReturnStatNode> node = std::make_shared<ReturnStatNode>();
    node->args = std::move(p_Args);

    if (node->args != nullptr)
    {
        node->args->setParent(node);
    }
    return node;
}

std::shared_ptr<ReturnStatNode> ReturnStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<ReturnStatNode>(p_Node);
}

void ReturnStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
