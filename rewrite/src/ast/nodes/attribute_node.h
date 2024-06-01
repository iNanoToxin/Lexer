#pragma once
#include "ast_node.h"

class AttributeNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> value;
    std::shared_ptr<AstNode> attribute;

    explicit AttributeNode() : AstNode(AstKind::AttributeNode) {}

    static std::shared_ptr<AttributeNode> create(std::shared_ptr<AstNode> p_Value, std::shared_ptr<AstNode> p_Attribute);
    static std::shared_ptr<AttributeNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
