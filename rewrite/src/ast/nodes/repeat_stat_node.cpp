#include "repeat_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<RepeatStatNode> RepeatStatNode::create(std::shared_ptr<AstNode> p_Block, std::shared_ptr<AstNode> p_Condition)
{
    std::shared_ptr<RepeatStatNode> node = std::make_shared<RepeatStatNode>();
    node->block = std::move(p_Block);
    node->condition = std::move(p_Condition);

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

std::shared_ptr<RepeatStatNode> RepeatStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<RepeatStatNode>(p_Node);
}

void RepeatStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
