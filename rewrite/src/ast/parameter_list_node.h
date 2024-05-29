#ifndef PARAMETER_LIST_NODE_H
#define PARAMETER_LIST_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class ParameterListNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> list;

    explicit ParameterListNode(std::vector<ExpressionNode*> p_List) : list(std::move(p_List)) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //PARAMETER_LIST_NODE_H
