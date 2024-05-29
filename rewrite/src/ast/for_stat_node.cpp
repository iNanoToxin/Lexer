#include "for_stat_node.h"
#include "visitor/ast_visitor.h"

void ForStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void ForStatNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
