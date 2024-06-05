#include "numeric_for_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NumericForStatNode> NumericForStatNode::create(std::shared_ptr<AstNode> p_Name, std::shared_ptr<AstNode> p_Init, std::shared_ptr<AstNode> p_Goal, std::shared_ptr<AstNode> p_Step, std::shared_ptr<AstNode> p_Block)
{
    std::shared_ptr<NumericForStatNode> node = std::make_shared<NumericForStatNode>();
    node->name = std::move(p_Name);
    node->init = std::move(p_Init);
    node->goal = std::move(p_Goal);
    node->step = std::move(p_Step);
    node->block = std::move(p_Block);

    if (node->name != nullptr)
    {
        node->name->setParent(node);
    }
    if (node->init != nullptr)
    {
        node->init->setParent(node);
    }
    if (node->goal != nullptr)
    {
        node->goal->setParent(node);
    }
    if (node->step != nullptr)
    {
        node->step->setParent(node);
    }
    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

std::shared_ptr<NumericForStatNode> NumericForStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<NumericForStatNode>(p_Node);
}

void NumericForStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
