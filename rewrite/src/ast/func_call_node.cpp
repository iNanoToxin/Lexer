#include "func_call_node.h"
#include "visitor/ast_visitor.h"

void FuncCallNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void FuncCallNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
