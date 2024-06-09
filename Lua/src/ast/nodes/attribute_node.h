#pragma once
#include "ast_node.h"

class AttributeNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::AttributeNode;

public:
    std::shared_ptr<AstNode> value;
    std::shared_ptr<AstNode> attribute;

    explicit AttributeNode() : AstNode(AstKind::AttributeNode) {}

    static std::shared_ptr<AttributeNode> create(const std::shared_ptr<AstNode>& p_Value, const std::shared_ptr<AstNode>& p_Attribute);
    void accept(AstVisitor& p_Visitor) override;
};
