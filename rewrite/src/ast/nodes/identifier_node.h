#pragma once
#include <string>
#include "ast_node.h"

class IdentifierNode final : public AstNode
{
private:
    std::string m_Name;
public:

    explicit IdentifierNode() : AstNode(AstKind::IdentifierNode) {}

    static std::shared_ptr<IdentifierNode> create(const std::string& p_Name);
    static std::shared_ptr<IdentifierNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;

    void setName(const std::string& p_Name);
    std::string getName() const;
};
