#pragma once
#include "ast_node.h"

class IndexNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> index;

    explicit IndexNode() : AstNode(AstKind::IndexNode) {}

    static std::shared_ptr<IndexNode> create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Index);
    static std::shared_ptr<IndexNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
