#pragma once
#include <string>
#include "ast_node.h"

class StringNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::StringNode;

private:
    std::string m_Content;
    std::string m_String;

public:
    explicit StringNode() : AstNode(AstKind::StringNode) {}

    static std::shared_ptr<StringNode> create(const std::string& p_Value);
    void accept(AstVisitor& p_Visitor) override;

    std::string getContent() const;
    std::string getString() const;
    std::size_t getLength() const;
    bool isLongString() const;
};
