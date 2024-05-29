#include "argument_list_node.h"
#include "visitor/ast_visitor.h"

void ArgumentListNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void ArgumentListNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
