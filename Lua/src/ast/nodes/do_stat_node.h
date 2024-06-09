#pragma once
#include "ast_node.h"

class DoStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::DoStatNode;

public:
    std::shared_ptr<AstNode> block;

    explicit DoStatNode() : AstNode(AstKind::DoStatNode) {}

    static std::shared_ptr<DoStatNode> create(const std::shared_ptr<AstNode>& p_Block);
    void accept(AstVisitor& p_Visitor) override;
};
