#include "if_stat_node.h"
#include "visitor/ast_visitor.h"

void IfStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void IfStatNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
