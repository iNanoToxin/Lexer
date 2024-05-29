#ifndef UNARY_OP_NODE_H
#define UNARY_OP_NODE_H

#include <utility>

#include "expression_node.h"

class UnaryOpNode final : public ExpressionNode
{
public:
    std::string op;
    ExpressionNode* value;

    UnaryOpNode(std::string p_Operation, ExpressionNode* p_Value) : op(std::move(p_Operation)), value(p_Value) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //UNARY_OP_NODE_H
