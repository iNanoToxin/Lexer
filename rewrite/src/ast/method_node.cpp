#include "method_node.h"
#include "visitor/ast_visitor.h"

void MethodNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void MethodNode::destroy()
{
    root->destroy();
    method->destroy();
    delete this;
}
