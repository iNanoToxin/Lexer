#pragma once
#include "ast_node.h"

class BreakStat final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::BreakStat;

public:

    explicit BreakStat() : AstNode(AstKind::BreakStat) {}

    static std::shared_ptr<BreakStat> create();
    void accept(AstVisitor& p_Visitor) override;
};
