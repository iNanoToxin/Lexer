#include "local_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<LocalStatNode> LocalStatNode::create(std::shared_ptr<AstNode> p_Statement)
{
    std::shared_ptr<LocalStatNode> node = std::make_shared<LocalStatNode>();
    node->statement = std::move(p_Statement);

    if (node->statement != nullptr)
    {
        node->statement->setParent(node);
    }
    return node;
}

std::shared_ptr<LocalStatNode> LocalStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<LocalStatNode>(p_Node);
}

void LocalStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
