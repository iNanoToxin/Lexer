#include "conditional_block_node.h"
#include "visitor/ast_visitor.h"

void ConditionalBlockNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void ConditionalBlockNode::destroy()
{
    condition->destroy();
    block->destroy();
    delete this;
}
