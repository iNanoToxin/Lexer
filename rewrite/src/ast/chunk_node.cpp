#include "chunk_node.h"
#include "visitor/ast_visitor.h"

void ChunkNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void ChunkNode::destroy()
{
    block->destroy();
    delete this;
}
