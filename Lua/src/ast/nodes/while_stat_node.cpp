#include "while_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<WhileStatNode> WhileStatNode::create(const std::shared_ptr<AstNode>& p_Condition, const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<WhileStatNode> node = std::make_shared<WhileStatNode>();
    node->condition = p_Condition;
    node->block = p_Block;

    if (node->condition != nullptr)
    {
        node->condition->setParent(node);
    }
    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

void WhileStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<WhileStatNode>());
}
