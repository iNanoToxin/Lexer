#pragma once
#include "ast_node.h"

class ContinueStat final : public AstNode
{
public:
    explicit ContinueStat() : AstNode(AstKind::ContinueStat) {}

    static std::shared_ptr<ContinueStat> create();
    static std::shared_ptr<ContinueStat> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
