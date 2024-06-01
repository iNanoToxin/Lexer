#ifndef UNARY_OP_NODE_H
#define UNARY_OP_NODE_H

#include <utility>
#include <string>

#include "expression_node.h"

class UnaryOpNode final : public ExpressionNode
{
public:
    std::string op;
    std::shared_ptr<ExpressionNode> value;

    explicit UnaryOpNode() : ExpressionNode(AstKind::UnaryOpNode) {}

    static std::shared_ptr<UnaryOpNode> create(std::string p_Operation, std::shared_ptr<ExpressionNode> p_Value)
    {
        std::shared_ptr<UnaryOpNode> node = std::make_shared<UnaryOpNode>();
        node->op = std::move(p_Operation);
        node->value = std::move(p_Value);

        if (node->value != nullptr)
        {
            node->value->parent = node;
        }
        return node;
    }
    static std::shared_ptr<UnaryOpNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<UnaryOpNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //UNARY_OP_NODE_H
