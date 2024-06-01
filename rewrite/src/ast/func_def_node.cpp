#include "func_def_node.h"
#include "visitor/ast_visitor.h"

void FuncDefNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
