#ifndef IF_STAT_NODE_H
#define IF_STAT_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class IfStatNode final : public ExpressionNode
{
public:
    std::vector<ExpressionPair> conditionalBlocks;

    explicit IfStatNode(std::vector<ExpressionPair> p_ConditionalBlocks) : ExpressionNode(AstKind::IfStatNode), conditionalBlocks(std::move(p_ConditionalBlocks))
    {
        for (const ExpressionPair& pair : conditionalBlocks)
        {
            if (pair.first) pair.first->parent = this;
            if (pair.second) pair.second->parent = this;
        }
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //IF_STAT_NODE_H
