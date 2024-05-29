#include "func_name_node.h"
#include "visitor/ast_visitor.h"

void FuncNameNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void FuncNameNode::destroy()
{
    name->destroy();
    delete this;
}
