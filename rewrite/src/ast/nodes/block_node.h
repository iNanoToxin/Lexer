#pragma once
#include <vector>
#include "ast_node.h"

class BlockNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> statements;

    explicit BlockNode() : AstNode(AstKind::BlockNode) {}

    static std::shared_ptr<BlockNode> create(std::vector<std::shared_ptr<AstNode>> p_Statements);
    static std::shared_ptr<BlockNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
