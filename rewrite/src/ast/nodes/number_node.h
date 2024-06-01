#pragma once
#include "ast_node.h"

class NumberNode final : public AstNode {
public:
    int value{};

    explicit NumberNode() : AstNode(AstKind::NumberNode) {}

    static std::shared_ptr<NumberNode> create(int p_Value);
    static std::shared_ptr<NumberNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
