#ifndef FUNC_CALL_NODE_H
#define FUNC_CALL_NODE_H

#include <utility>

#include "ast_node.h"

class FuncCallNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> args;

    explicit FuncCallNode() : AstNode(AstKind::FuncCallNode) {}

    static std::shared_ptr<FuncCallNode> create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Args)
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
