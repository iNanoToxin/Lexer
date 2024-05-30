#ifndef IF_STAT_NODE_H
#define IF_STAT_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class IfStatNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> conditionalBlocks;

    explicit IfStatNode(std::vector<ExpressionNode*> p_ConditionalBlocks) : ExpressionNode(AstKind::IfStatNode), conditionalBlocks(std::move(p_ConditionalBlocks)) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //IF_STAT_NODE_H
