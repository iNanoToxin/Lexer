#ifndef BREAK_STAT_H
#define BREAK_STAT_H

#include "expression_node.h"

class BreakStat final : public ExpressionNode
{
public:

    explicit BreakStat() : ExpressionNode(AstKind::BreakStat) {}

    static std::shared_ptr<BreakStat> create()
    {
        return std::make_shared<BreakStat>();
    }
    static std::shared_ptr<BreakStat> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<BreakStat>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //BREAK_STAT_H
