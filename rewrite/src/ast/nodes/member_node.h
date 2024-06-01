#pragma once
#include "ast_node.h"

class MemberNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> member;

    explicit MemberNode() : AstNode(AstKind::MemberNode) {}

    static std::shared_ptr<MemberNode> create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Member);
    static std::shared_ptr<MemberNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
