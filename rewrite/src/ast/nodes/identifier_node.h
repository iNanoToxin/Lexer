#pragma once
#include <string>
#include "ast_node.h"

class IdentifierNode final : public AstNode
{
public:
    std::string value;

    explicit IdentifierNode() : AstNode(AstKind::IdentifierNode) {}

    static std::shared_ptr<IdentifierNode> create(const std::string& p_Value);
    static std::shared_ptr<IdentifierNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
