#ifndef EXPRESSION_LIST_NODE_H
#define EXPRESSION_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class ExpressionListNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> list;

    explicit ExpressionListNode(std::vector<ExpressionNode*> p_List) : ExpressionNode(AstKind::ExpressionListNode), list(std::move(p_List)) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //EXPRESSION_LIST_NODE_H
