#include "do_stat_node.h"
#include "visitor/ast_visitor.h"

void DoStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void DoStatNode::destroy()
{
    block->destroy();
    delete this;
}
