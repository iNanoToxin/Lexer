#ifndef CHUNK_NODE_H
#define CHUNK_NODE_H

#include <utility>

#include "expression_node.h"

class ChunkNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> block;

    explicit ChunkNode() : ExpressionNode(AstKind::ChunkNode) {}

    static std::shared_ptr<ChunkNode> create(std::shared_ptr<ExpressionNode> p_Block)
    {
        std::shared_ptr<ChunkNode> node = std::make_shared<ChunkNode>();
        node->block = std::move(p_Block);

        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        return node;
    }
    static std::shared_ptr<ChunkNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ChunkNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //CHUNK_NODE_H
