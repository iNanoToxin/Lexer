#include "number_node.h"
#include "ast_visitor.h"

void NumberNode::accept(ASTVisitor& visitor) {
    visitor.visit(*this);
}
