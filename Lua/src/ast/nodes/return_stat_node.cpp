#include "return_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ReturnStatNode> ReturnStatNode::create(const std::shared_ptr<AstNode>& p_Args)
{
    std::shared_ptr<ReturnStatNode> node = std::make_shared<ReturnStatNode>();
    node->args = p_Args;

    if (node->args != nullptr)
    {
        node->args->setParent(node);
    }
    return node;
}

void ReturnStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<ReturnStatNode>());
}
