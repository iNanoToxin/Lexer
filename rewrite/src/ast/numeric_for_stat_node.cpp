#include "numeric_for_stat_node.h"
#include "visitor/ast_visitor.h"

void NumericForStatNode::accept(AstVisitor* p_Visitor)
{
    p_Visitor->visit(this);
}

void NumericForStatNode::destroy()
{
    if (name) name->destroy();
    if (init) init->destroy();
    if (goal) goal->destroy();
    if (step) step->destroy();
    if (block) block->destroy();
    delete this;
}
