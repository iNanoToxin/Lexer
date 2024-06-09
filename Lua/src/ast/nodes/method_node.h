#pragma once
#include "ast_node.h"

class MethodNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::MethodNode;

public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> method;

    explicit MethodNode() : AstNode(AstKind::MethodNode) {}

    static std::shared_ptr<MethodNode> create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Name);
    void accept(AstVisitor& p_Visitor) override;
};
