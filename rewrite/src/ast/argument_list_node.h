#ifndef ARGUMENT_LIST_NODE_H
#define ARGUMENT_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class ArgumentListNode final : public ExpressionNode
{
public:
    ExpressionNode* list;

    explicit ArgumentListNode(ExpressionNode* p_List) : ExpressionNode(AstKind::ArgumentListNode), list(p_List)
    {
        if (list) list->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //ARGUMENT_LIST_NODE_H
