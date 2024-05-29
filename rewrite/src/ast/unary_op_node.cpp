#include "unary_op_node.h"
#include "visitor/ast_visitor.h"

void UnaryOpNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void UnaryOpNode::destroy()
{
    value->destroy();
    delete this;
}
