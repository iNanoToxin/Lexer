#pragma once
#include "ast_node.h"

class SemicolonNode final : public AstNode
{
public:
    explicit SemicolonNode() : AstNode(AstKind::SemicolonNode) {}

    static std::shared_ptr<SemicolonNode> create();
    static std::shared_ptr<SemicolonNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
