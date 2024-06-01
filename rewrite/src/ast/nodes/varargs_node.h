#pragma once
#include "ast_node.h"

class VarargsNode final : public AstNode
{
public:
    explicit VarargsNode() : AstNode(AstKind::VarargsNode) {}

    static std::shared_ptr<VarargsNode> create();
    static std::shared_ptr<VarargsNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
