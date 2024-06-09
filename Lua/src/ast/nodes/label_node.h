#pragma once
#include "ast_node.h"

class LabelNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::LabelNode;

public:
    std::shared_ptr<AstNode> label;

    explicit LabelNode() : AstNode(AstKind::LabelNode) {}

    static std::shared_ptr<LabelNode> create(const std::shared_ptr<AstNode>& p_Label);
    void accept(AstVisitor& p_Visitor) override;
};
