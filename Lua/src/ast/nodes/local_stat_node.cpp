#include "local_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<LocalStatNode> LocalStatNode::create(const std::shared_ptr<AstNode>& p_Statement)
{
    std::shared_ptr<LocalStatNode> node = std::make_shared<LocalStatNode>();
    node->statement = p_Statement;

    if (node->statement != nullptr)
    {
        node->statement->setParent(node);
    }
    return node;
}

void LocalStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<LocalStatNode>());
}
