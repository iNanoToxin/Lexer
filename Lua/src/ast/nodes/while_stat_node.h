#pragma once
#include "ast_node.h"

class WhileStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::WhileStatNode;

public:
    std::shared_ptr<AstNode> condition;
    std::shared_ptr<AstNode> block;

    explicit WhileStatNode() : AstNode(AstKind::WhileStatNode) {}

    static std::shared_ptr<WhileStatNode> create(const std::shared_ptr<AstNode>& p_Condition, const std::shared_ptr<AstNode>& p_Block);
    void accept(AstVisitor& p_Visitor) override;
};
