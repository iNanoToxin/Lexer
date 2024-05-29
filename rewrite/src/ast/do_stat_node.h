#ifndef DO_STAT_NODE_H
#define DO_STAT_NODE_H

#include "expression_node.h"

class DoStatNode final : public ExpressionNode
{
public:
    ExpressionNode* block;

    explicit DoStatNode(ExpressionNode* p_Block) : block(p_Block) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //DO_STAT_NODE_H
