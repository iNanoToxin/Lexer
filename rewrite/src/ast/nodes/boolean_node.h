#pragma once
#include "ast_node.h"

class BooleanNode final : public AstNode
{
public:
    bool value{};

    explicit BooleanNode() : AstNode(AstKind::BooleanNode) {}

    static std::shared_ptr<BooleanNode> create(bool p_Value);
    static std::shared_ptr<BooleanNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
