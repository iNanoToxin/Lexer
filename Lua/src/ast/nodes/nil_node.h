#pragma once
#include "ast_node.h"

class NilNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::NilNode;

public:
    explicit NilNode() : AstNode(AstKind::NilNode) {}

    static std::shared_ptr<NilNode> create();
    void accept(AstVisitor& p_Visitor) override;
};
