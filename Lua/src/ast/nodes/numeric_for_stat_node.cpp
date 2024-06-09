#include "numeric_for_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NumericForStatNode> NumericForStatNode::create(const std::shared_ptr<AstNode>& p_Name, const std::shared_ptr<AstNode>& p_Init, const std::shared_ptr<AstNode>& p_Goal, const std::shared_ptr<AstNode>& p_Step, const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<NumericForStatNode> node = std::make_shared<NumericForStatNode>();
    node->name = p_Name;
    node->init = p_Init;
    node->goal = p_Goal;
    node->step = p_Step;
    node->block = p_Block;

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

void NumericForStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<NumericForStatNode>());
}
