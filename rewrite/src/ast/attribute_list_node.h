#ifndef ATTRIBUTE_LIST_NODE_H
#define ATTRIBUTE_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class AttributeListNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> list;

    explicit AttributeListNode(std::vector<ExpressionNode*> p_List) : ExpressionNode(AstKind::AttributeListNode), list(std::move(p_List)) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //ATTRIBUTE_LIST_NODE_H
