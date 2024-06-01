#ifndef DO_STAT_NODE_H
#define DO_STAT_NODE_H

#include <utility>

#include "expression_node.h"

class DoStatNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> block;

    explicit DoStatNode() : ExpressionNode(AstKind::DoStatNode) {}

    static std::shared_ptr<DoStatNode> create(std::shared_ptr<ExpressionNode> p_Block)
    {
        std::shared_ptr<DoStatNode> node = std::make_shared<DoStatNode>();
        node->block = std::move(p_Block);

        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        return node;
    }
    static std::shared_ptr<DoStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<DoStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //DO_STAT_NODE_H
