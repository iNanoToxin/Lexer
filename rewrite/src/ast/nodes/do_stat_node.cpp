#include "do_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<DoStatNode> DoStatNode::create(std::shared_ptr<AstNode> p_Block)
{
    std::shared_ptr<DoStatNode> node = std::make_shared<DoStatNode>();
    node->block = std::move(p_Block);

    if (node->block != nullptr)
    {
        node->block->parent = node;
    }
    return node;
}

std::shared_ptr<DoStatNode> DoStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<DoStatNode>(p_Node);
}

void DoStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
