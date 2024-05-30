#include "for_stat_node.h"
#include "visitor/ast_visitor.h"

void ForStatNode::accept(AstVisitor* p_Visitor)
{
    p_Visitor->visit(this);
}

void ForStatNode::destroy()
{
    if (name) name->destroy();
    if (init) init->destroy();
    if (goal) goal->destroy();
    if (step) step->destroy();
    if (block) block->destroy();

    if (nameList) nameList->destroy();
    if (expressionList) expressionList->destroy();
    delete this;
}
