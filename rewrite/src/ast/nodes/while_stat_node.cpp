#include "while_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<WhileStatNode> WhileStatNode::create(std::shared_ptr<AstNode> p_Condition, std::shared_ptr<AstNode> p_Block)
{
    std::shared_ptr<WhileStatNode> node = std::make_shared<WhileStatNode>();
    node->condition = std::move(p_Condition);
    node->block = std::move(p_Block);

    if (node->condition != nullptr)
    {
        node->condition->parent = node;
    }
    if (node->block != nullptr)
    {
        node->block->parent = node;
    }
    return node;
}

std::shared_ptr<WhileStatNode> WhileStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<WhileStatNode>(p_Node);
}

void WhileStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
