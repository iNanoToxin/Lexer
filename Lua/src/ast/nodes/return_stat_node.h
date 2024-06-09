#pragma once
#include "ast_node.h"

class ReturnStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::ReturnStatNode;

public:
    std::shared_ptr<AstNode> args;

    explicit ReturnStatNode() : AstNode(AstKind::ReturnStatNode) {}

    static std::shared_ptr<ReturnStatNode> create(const std::shared_ptr<AstNode>& p_Args);
    void accept(AstVisitor& p_Visitor) override;
};
