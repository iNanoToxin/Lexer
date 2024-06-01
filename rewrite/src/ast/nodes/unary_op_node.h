#pragma once
#include <string>
#include "ast_node.h"

class UnaryOpNode final : public AstNode
{
public:
    std::string op;
    std::shared_ptr<AstNode> value;

    explicit UnaryOpNode() : AstNode(AstKind::UnaryOpNode) {}

    static std::shared_ptr<UnaryOpNode> create(std::string p_Operation, std::shared_ptr<AstNode> p_Value);
    static std::shared_ptr<UnaryOpNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
