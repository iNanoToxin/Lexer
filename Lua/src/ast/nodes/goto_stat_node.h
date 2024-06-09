#pragma once
#include "ast_node.h"

class GotoStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::GotoStatNode;

public:
    std::shared_ptr<AstNode> label;

    explicit GotoStatNode() : AstNode(AstKind::GotoStatNode) {}

    static std::shared_ptr<GotoStatNode> create(const std::shared_ptr<AstNode>& p_Label);
    void accept(AstVisitor& p_Visitor) override;
};
