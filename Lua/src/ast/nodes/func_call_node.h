#pragma once
#include "ast_node.h"

class FuncCallNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::FuncCallNode;

public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> args;

    explicit FuncCallNode() : AstNode(AstKind::FuncCallNode) {}

    static std::shared_ptr<FuncCallNode> create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Args);
    void accept(AstVisitor& p_Visitor) override;
};
