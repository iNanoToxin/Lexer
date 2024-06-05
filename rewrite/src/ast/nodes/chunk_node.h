#pragma once
#include "ast_node.h"

class ChunkNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> block;

    explicit ChunkNode() : AstNode(AstKind::ChunkNode) {}

    static std::shared_ptr<ChunkNode> create(const std::shared_ptr<AstNode>& p_Block);
    static std::shared_ptr<ChunkNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
