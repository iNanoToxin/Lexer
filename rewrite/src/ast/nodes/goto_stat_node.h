#pragma once
#include "ast_node.h"

class GotoStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> label;

    explicit GotoStatNode() : AstNode(AstKind::GotoStatNode) {}

    static std::shared_ptr<GotoStatNode> create(std::shared_ptr<AstNode> p_Label);
    static std::shared_ptr<GotoStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
