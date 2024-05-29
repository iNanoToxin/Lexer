#ifndef BREAK_STAT_H
#define BREAK_STAT_H

#include "expression_node.h"

class BreakStat final : public ExpressionNode
{
public:
    ExpressionNode* ptr1;
    ExpressionNode* ptr2;

    BreakStat(ExpressionNode* p_Ptr1, ExpressionNode* p_Ptr2) : ptr1(p_Ptr1), ptr2(p_Ptr2) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //BREAK_STAT_H
