#include "func_def_node.h"
#include "visitor/ast_visitor.h"

void FuncDefNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void FuncDefNode::destroy()
{
    name->destroy();
    body->destroy();
    delete this;
}
