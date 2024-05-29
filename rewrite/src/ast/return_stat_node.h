#ifndef RETURN_STAT_NODE_H
#define RETURN_STAT_NODE_H

#include "expression_node.h"

class ReturnStatNode final : public ExpressionNode
{
public:
    ExpressionNode* args;

    explicit ReturnStatNode(ExpressionNode* p_Args) : args(p_Args) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //RETURN_STAT_NODE_H
