#pragma once
#include "ast_node.h"

class ReturnStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> args;

    explicit ReturnStatNode() : AstNode(AstKind::ReturnStatNode) {}

    static std::shared_ptr<ReturnStatNode> create(const std::shared_ptr<AstNode>& p_Args);
    static std::shared_ptr<ReturnStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
