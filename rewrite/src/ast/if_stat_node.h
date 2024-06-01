#ifndef IF_STAT_NODE_H
#define IF_STAT_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class IfStatNode final : public ExpressionNode
{
public:
    std::vector<ExpressionPair> conditionalBlocks;

    explicit IfStatNode() : ExpressionNode(AstKind::IfStatNode) {}

    static std::shared_ptr<IfStatNode> create(std::vector<ExpressionPair> p_ConditionalBlocks)
    {
        std::shared_ptr<IfStatNode> node = std::make_shared<IfStatNode>();
        node->conditionalBlocks = std::move(p_ConditionalBlocks);

        for (const ExpressionPair& pair : node->conditionalBlocks)
        {
            if (pair.first != nullptr)
            {
                pair.first->parent = node;
            }
            if (pair.second != nullptr)
            {
                pair.second->parent = node;
            }
        }
        return node;
    }
    static std::shared_ptr<IfStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<IfStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //IF_STAT_NODE_H
