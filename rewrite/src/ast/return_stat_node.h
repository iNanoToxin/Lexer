#ifndef RETURN_STAT_NODE_H
#define RETURN_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class ReturnStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> args;

    explicit ReturnStatNode() : AstNode(AstKind::ReturnStatNode) {}

    static std::shared_ptr<ReturnStatNode> create(std::shared_ptr<AstNode> p_Args)
    {
        std::shared_ptr<ReturnStatNode> node = std::make_shared<ReturnStatNode>();
        node->args = std::move(p_Args);

        if (node->args != nullptr)
        {
            node->args->parent = node;
        }
        return node;
    }
    static std::shared_ptr<ReturnStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ReturnStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //RETURN_STAT_NODE_H
