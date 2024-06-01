#ifndef WHILE_STAT_NODE_H
#define WHILE_STAT_NODE_H

#include <utility>

#include "expression_node.h"

class WhileStatNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> condition;
    std::shared_ptr<ExpressionNode> block;

    explicit WhileStatNode() : ExpressionNode(AstKind::WhileStatNode) {}

    static std::shared_ptr<WhileStatNode> create(std::shared_ptr<ExpressionNode> p_Condition, std::shared_ptr<ExpressionNode> p_Block)
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
    static std::shared_ptr<WhileStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<WhileStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //WHILE_STAT_NODE_H
