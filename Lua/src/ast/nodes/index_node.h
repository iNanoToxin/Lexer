#pragma once
#include "ast_node.h"

class IndexNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::IndexNode;

public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> index;

    explicit IndexNode() : AstNode(AstKind::IndexNode) {}

    static std::shared_ptr<IndexNode> create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Index);
    void accept(AstVisitor& p_Visitor) override;
};
