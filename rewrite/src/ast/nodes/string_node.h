#pragma once
#include <string>
#include "ast_node.h"

class StringNode final : public AstNode
{
private:
    std::string m_Content;
    std::string m_String;

public:
    explicit StringNode() : AstNode(AstKind::StringNode) {}

    static std::shared_ptr<StringNode> create(const std::string& p_Value);
    static std::shared_ptr<StringNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;

    std::string getContent() const;
    std::string getString() const;
    std::size_t getLength() const;
    bool isLongString() const;
};
