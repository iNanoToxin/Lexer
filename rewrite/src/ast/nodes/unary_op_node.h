#pragma once
#include <string>
#include "ast_node.h"

enum class UnaryOpKind
{
    Not,
    Length,
    Negate,
    BitNot
};

class UnaryOpNode final : public AstNode
{
public:
    UnaryOpKind opKind;
    std::string op;
    std::shared_ptr<AstNode> value;

    explicit UnaryOpNode() : AstNode(AstKind::UnaryOpNode) {}

    static std::shared_ptr<UnaryOpNode> create(const std::string& p_Operation, const std::shared_ptr<AstNode>& p_Value);
    static std::shared_ptr<UnaryOpNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
