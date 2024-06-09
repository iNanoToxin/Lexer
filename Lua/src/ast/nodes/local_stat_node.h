#pragma once
#include "ast_node.h"

class LocalStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::LocalStatNode;

public:
    std::shared_ptr<AstNode> statement;

    explicit LocalStatNode() : AstNode(AstKind::LocalStatNode) {}

    static std::shared_ptr<LocalStatNode> create(const std::shared_ptr<AstNode>& p_Statement);
    void accept(AstVisitor& p_Visitor) override;
};
