#ifndef TABLE_INDEX_VALUE_NODE_H
#define TABLE_INDEX_VALUE_NODE_H

#include "expression_node.h"

class TableIndexValueNode final : public ExpressionNode
{
public:
    ExpressionNode* index;
    ExpressionNode* value;

    explicit TableIndexValueNode(ExpressionNode* p_Index, ExpressionNode* p_Value) : ExpressionNode(AstKind::TableIndexValueNode), index(p_Index), value(p_Value)
    {
        if (index) index->parent = this;
        if (value) value->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //TABLE_INDEX_VALUE_NODE_H
