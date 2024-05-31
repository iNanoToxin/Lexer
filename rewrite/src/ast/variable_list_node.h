#ifndef VARIABLE_LIST_NODE_H
#define VARIABLE_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class VariableListNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> list;

    explicit VariableListNode(std::vector<ExpressionNode*> p_List) : ExpressionNode(AstKind::VariableListNode), list(std::move(p_List))
    {
        for (ExpressionNode* node : list)
        {
            node->parent = this;
        }
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //VARIABLE_LIST_NODE_H
