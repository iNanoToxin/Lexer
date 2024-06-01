#include "table_constructor_node.h"
#include "visitor/ast_visitor.h"

void TableConstructorNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
