#pragma once
#include "ast_node.h"

class ContinueStat final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::ContinueStat;

public:
    explicit ContinueStat() : AstNode(AstKind::ContinueStat) {}

    static std::shared_ptr<ContinueStat> create();
    void accept(AstVisitor& p_Visitor) override;
};
