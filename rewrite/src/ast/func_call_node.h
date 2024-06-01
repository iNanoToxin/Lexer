#ifndef FUNC_CALL_NODE_H
#define FUNC_CALL_NODE_H

#include <utility>

#include "expression_node.h"

class FuncCallNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> root;
    std::shared_ptr<ExpressionNode> args;

    explicit FuncCallNode() : ExpressionNode(AstKind::FuncCallNode) {}

    static std::shared_ptr<FuncCallNode> create(std::shared_ptr<ExpressionNode> p_Root, std::shared_ptr<ExpressionNode> p_Args)
    {
        std::shared_ptr<FuncCallNode> node = std::make_shared<FuncCallNode>();
        node->root = std::move(p_Root);
        node->args = std::move(p_Args);

        if (node->root != nullptr)
        {
            node->root->parent = node;
        }
        if (node->args != nullptr)
        {
            node->args->parent = node;
        }
        return node;
    }
    static std::shared_ptr<FuncCallNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<FuncCallNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //FUNC_CALL_NODE_H
