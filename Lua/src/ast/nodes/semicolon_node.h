#pragma once
#include "ast_node.h"

class SemicolonNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::SemicolonNode;

public:
    explicit SemicolonNode() : AstNode(AstKind::SemicolonNode) {}

    static std::shared_ptr<SemicolonNode> create();
    void accept(AstVisitor& p_Visitor) override;
};
