#ifndef TABLE_CONSTRUCTOR_NODE_H
#define TABLE_CONSTRUCTOR_NODE_H

#include "expression_node.h"

class TableConstructorNode final : public ExpressionNode
{
public:
    ExpressionNode* fieldList;

    explicit TableConstructorNode(ExpressionNode* p_FieldList) : fieldList(p_FieldList) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //TABLE_CONSTRUCTOR_NODE_H
