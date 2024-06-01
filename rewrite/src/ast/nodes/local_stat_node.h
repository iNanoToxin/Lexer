#pragma once
#include "ast_node.h"

class LocalStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> statement;

    explicit LocalStatNode() : AstNode(AstKind::LocalStatNode) {}

    static std::shared_ptr<LocalStatNode> create(std::shared_ptr<AstNode> p_Statement);
    static std::shared_ptr<LocalStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
