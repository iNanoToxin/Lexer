#include "func_call_node.h"
#include "visitor/ast_visitor.h"

void FuncCallNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void FuncCallNode::destroy()
{
    root->destroy();
    args->destroy();
    delete this;
}
