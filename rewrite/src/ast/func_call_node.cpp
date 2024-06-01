#include "func_call_node.h"
#include "visitor/ast_visitor.h"

void FuncCallNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
