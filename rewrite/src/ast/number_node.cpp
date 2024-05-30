#include "number_node.h"
#include "visitor/ast_visitor.h"

void NumberNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void NumberNode::destroy()
{
    delete this;
}
