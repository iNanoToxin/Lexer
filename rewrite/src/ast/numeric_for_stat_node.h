#ifndef NUMERIC_FOR_STAT_NODE_H
#define NUMERIC_FOR_STAT_NODE_H

#include <utility>

#include "expression_node.h"

class NumericForStatNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> name;
    std::shared_ptr<ExpressionNode> init;
    std::shared_ptr<ExpressionNode> goal;
    std::shared_ptr<ExpressionNode> step;
    std::shared_ptr<ExpressionNode> block;

    explicit NumericForStatNode() : ExpressionNode(AstKind::NumericForStatNode) {}

    static std::shared_ptr<NumericForStatNode> create(std::shared_ptr<ExpressionNode> p_Name, std::shared_ptr<ExpressionNode> p_Init, std::shared_ptr<ExpressionNode> p_Goal, std::shared_ptr<ExpressionNode> p_Step, std::shared_ptr<ExpressionNode> p_Block)
    {
        std::shared_ptr<NumericForStatNode> node = std::make_shared<NumericForStatNode>();
        node->name = std::move(p_Name);
        node->init = std::move(p_Init);
        node->goal = std::move(p_Goal);
        node->step = std::move(p_Step);
        node->block = std::move(p_Block);

        if (node->name != nullptr)
        {
            node->name->parent = node;
        }
        if (node->init != nullptr)
        {
            node->init->parent = node;
        }
        if (node->goal != nullptr)
        {
            node->goal->parent = node;
        }
        if (node->step != nullptr)
        {
            node->step->parent = node;
        }
        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        return node;
    }
    static std::shared_ptr<NumericForStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<NumericForStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //NUMERIC_FOR_STAT_NODE_H
