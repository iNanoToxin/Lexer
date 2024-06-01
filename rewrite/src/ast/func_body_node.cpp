#include "func_body_node.h"
#include "visitor/ast_visitor.h"

void FuncBodyNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
