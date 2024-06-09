#pragma once
#include "ast_node.h"

class VarargsNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::VarargsNode;

public:
    explicit VarargsNode() : AstNode(AstKind::VarargsNode) {}

    static std::shared_ptr<VarargsNode> create();
    void accept(AstVisitor& p_Visitor) override;
};
