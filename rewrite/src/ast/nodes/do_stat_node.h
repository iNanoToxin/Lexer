#pragma once
#include "ast_node.h"

class DoStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> block;

    explicit DoStatNode() : AstNode(AstKind::DoStatNode) {}

    static std::shared_ptr<DoStatNode> create(std::shared_ptr<AstNode> p_Block);
    static std::shared_ptr<DoStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
