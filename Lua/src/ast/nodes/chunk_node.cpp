#include "chunk_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ChunkNode> ChunkNode::create(const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<ChunkNode> node = std::make_shared<ChunkNode>();
    node->block = p_Block;

    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

void ChunkNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<ChunkNode>());
}
