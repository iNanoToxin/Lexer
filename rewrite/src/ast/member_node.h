#ifndef MEMBER_NODE_H
#define MEMBER_NODE_H

#include <utility>

#include "expression_node.h"

class MemberNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> root;
    std::shared_ptr<ExpressionNode> member;

    explicit MemberNode() : ExpressionNode(AstKind::MemberNode) {}

    static std::shared_ptr<MemberNode> create(std::shared_ptr<ExpressionNode> p_Root, std::shared_ptr<ExpressionNode> p_Member)
    {
        std::shared_ptr<MemberNode> node = std::make_shared<MemberNode>();
        node->root = std::move(p_Root);
        node->member = std::move(p_Member);

        if (node->root != nullptr)
        {
            node->root->parent = node;
        }
        if (node->member != nullptr)
        {
            node->member->parent = node;
        }
        return node;
    }
    static std::shared_ptr<MemberNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<MemberNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //MEMBER_NODE_H
