#include "boolean_node.h"
#include "visitor/ast_visitor.h"

void BooleanNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}
