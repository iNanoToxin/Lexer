#pragma once
#include <string>
#include "ast_node.h"

class StringNode final : public AstNode
{
public:
    std::string value;

    explicit StringNode() : AstNode(AstKind::StringNode) {}

    static std::shared_ptr<StringNode> create(std::string p_Value);
    static std::shared_ptr<StringNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;

    std::string unquote() const;
};
