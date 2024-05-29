#include "string_node.h"
#include "visitor/ast_visitor.h"

void StringNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}
