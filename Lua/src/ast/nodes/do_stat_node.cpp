#include "do_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<DoStatNode> DoStatNode::create(const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<DoStatNode> node = std::make_shared<DoStatNode>();
    node->block = p_Block;

    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

void DoStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<DoStatNode>());
}
