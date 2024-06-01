#include "chunk_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ChunkNode> ChunkNode::create(std::shared_ptr<AstNode> p_Block)
{
    std::shared_ptr<ChunkNode> node = std::make_shared<ChunkNode>();
    node->block = std::move(p_Block);

    if (node->block != nullptr)
    {
        node->block->parent = node;
    }
    return node;
}

std::shared_ptr<ChunkNode> ChunkNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<ChunkNode>(p_Node);
}

void ChunkNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
