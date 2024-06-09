#pragma once
#include "ast_node.h"

class ArgumentListNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::ArgumentListNode;

public:
    std::shared_ptr<AstNode> list;

    explicit ArgumentListNode() : AstNode(AstKind::ArgumentListNode) {}

    static std::shared_ptr<ArgumentListNode> create(const std::shared_ptr<AstNode>& p_List);
    void accept(AstVisitor& p_Visitor) override;
};
