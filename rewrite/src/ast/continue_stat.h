#ifndef CONTINUE_STAT_H
#define CONTINUE_STAT_H

#include "expression_node.h"

class ContinueStat final : public ExpressionNode
{
public:
    explicit ContinueStat() : ExpressionNode(AstKind::BreakStat) {}

    void accept(AstVisitor* p_Visitor) override;
};

#endif //CONTINUE_STAT_H
