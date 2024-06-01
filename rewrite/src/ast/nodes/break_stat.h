#pragma once
#include "ast_node.h"

class BreakStat final : public AstNode
{
public:

    explicit BreakStat() : AstNode(AstKind::BreakStat) {}

    static std::shared_ptr<BreakStat> create();
    static std::shared_ptr<BreakStat> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
