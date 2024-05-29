#include "goto_stat_node.h"
#include "visitor/ast_visitor.h"

void GotoStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void GotoStatNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
