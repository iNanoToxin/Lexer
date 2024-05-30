#ifndef GOTO_STAT_NODE_H
#define GOTO_STAT_NODE_H

#include "expression_node.h"

class GotoStatNode final : public ExpressionNode
{
public:
    ExpressionNode* label;

    explicit GotoStatNode(ExpressionNode* p_Label) : ExpressionNode(AstKind::GotoStatNode), label(p_Label) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //GOTO_STAT_NODE_H
