#ifndef TABLE_VALUE_NODE_H
#define TABLE_VALUE_NODE_H

#include "expression_node.h"

class TableValueNode final : public ExpressionNode
{
public:
    ExpressionNode* value;

    explicit TableValueNode(ExpressionNode* p_Value) : value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //TABLE_VALUE_NODE_H