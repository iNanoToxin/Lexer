#pragma once
#include "ast_node.h"

class FuncCallNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> args;

    explicit FuncCallNode() : AstNode(AstKind::FuncCallNode) {}

    static std::shared_ptr<FuncCallNode> create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Args);
    static std::shared_ptr<FuncCallNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
