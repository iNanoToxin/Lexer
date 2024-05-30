#include "semicolon_node.h"
#include "visitor/ast_visitor.h"

void SemicolonNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}
