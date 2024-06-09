#pragma once
#include <string>
#include "ast_node.h"

class IdentifierNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::IdentifierNode;

private:
    std::string m_Name;
public:

    explicit IdentifierNode() : AstNode(AstKind::IdentifierNode) {}

    static std::shared_ptr<IdentifierNode> create(const std::string& p_Name);
    void accept(AstVisitor& p_Visitor) override;

    void setName(const std::string& p_Name);
    std::string getName() const;
};
