#pragma once
#include "ast_node.h"

class FuncBodyNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> parameters;
    std::shared_ptr<AstNode> block;

    explicit FuncBodyNode() : AstNode(AstKind::FuncBodyNode) {}

    static std::shared_ptr<FuncBodyNode> create(const std::shared_ptr<AstNode>& p_ParameterList, const std::shared_ptr<AstNode>& p_Block);
    static std::shared_ptr<FuncBodyNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
