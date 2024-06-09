#pragma once
#include "ast_node.h"

class BooleanNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::BooleanNode;

public:
    bool value{};

    explicit BooleanNode() : AstNode(AstKind::BooleanNode) {}

    static std::shared_ptr<BooleanNode> create(bool p_Value);
    void accept(AstVisitor& p_Visitor) override;

    void flip();
};
