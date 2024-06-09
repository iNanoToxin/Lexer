#pragma once
#include "ast_node.h"

class RepeatStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::RepeatStatNode;

public:
    std::shared_ptr<AstNode> block;
    std::shared_ptr<AstNode> condition;

    explicit RepeatStatNode() : AstNode(AstKind::RepeatStatNode) {}

    static std::shared_ptr<RepeatStatNode> create(const std::shared_ptr<AstNode>& p_Block, const std::shared_ptr<AstNode>& p_Condition);
    void accept(AstVisitor& p_Visitor) override;
};
