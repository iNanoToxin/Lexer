#ifndef TABLE_NAME_VALUE_NODE_H
#define TABLE_NAME_VALUE_NODE_H

#include "expression_node.h"

class TableNameValueNode final : public ExpressionNode
{
public:
    ExpressionNode* name;
    ExpressionNode* value;

    TableNameValueNode(ExpressionNode* p_Name, ExpressionNode* p_Value) : name(p_Name), value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //TABLE_NAME_VALUE_NODE_H
