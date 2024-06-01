#pragma once
#include "ast_node.h"

class LabelNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> label;

    explicit LabelNode() : AstNode(AstKind::LabelNode) {}

    static std::shared_ptr<LabelNode> create(std::shared_ptr<AstNode> p_Label);
    static std::shared_ptr<LabelNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
