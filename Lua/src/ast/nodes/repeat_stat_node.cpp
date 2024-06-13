#include "repeat_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<RepeatStatNode> RepeatStatNode::create(const std::shared_ptr<AstNode>& p_Block, const std::shared_ptr<AstNode>& p_Condition)
{
    std::shared_ptr<RepeatStatNode> node = std::make_shared<RepeatStatNode>();
    node->block = p_Block;
    node->condition = p_Condition;

    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    if (node->condition != nullptr)
    {
        node->condition->setParent(node);
    }
    return node;
}

void RepeatStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<RepeatStatNode>());
}
