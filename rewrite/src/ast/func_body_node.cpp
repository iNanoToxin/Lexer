#include "func_body_node.h"
#include "visitor/ast_visitor.h"

void FuncBodyNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void FuncBodyNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
