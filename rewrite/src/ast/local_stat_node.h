#ifndef LOCAL_STAT_NODE_H
#define LOCAL_STAT_NODE_H

#include "expression_node.h"

class LocalStatNode final : public ExpressionNode
{
public:
    ExpressionNode* statement;

    explicit LocalStatNode(ExpressionNode* p_Statement) : ExpressionNode(AstKind::LocalStatNode), statement(p_Statement)
    {
        if (statement) statement->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //LOCAL_STAT_NODE_H
