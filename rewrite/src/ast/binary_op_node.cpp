#include "binary_op_node.h"
#include "visitor/ast_visitor.h"

void BinaryOpNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void BinaryOpNode::destroy()
{
    lhs->destroy();
    rhs->destroy();
    delete this;
}
