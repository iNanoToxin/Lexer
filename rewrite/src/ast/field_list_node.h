#ifndef FIELD_LIST_NODE_H
#define FIELD_LIST_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class FieldListNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> list;

    explicit FieldListNode(std::vector<ExpressionNode*> p_List) : ExpressionNode(AstKind::FieldListNode), list(std::move(p_List))
    {
        for (ExpressionNode* node : list)
        {
            node->parent = this;
        }
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FIELD_LIST_NODE_H
