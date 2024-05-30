#ifndef ARGUMENT_LIST_NODE_H
#define ARGUMENT_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class ArgumentListNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> list;

    explicit ArgumentListNode(std::vector<ExpressionNode*> p_List) : ExpressionNode(AstKind::ArgumentListNode), list(std::move(p_List)) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //ARGUMENT_LIST_NODE_H
