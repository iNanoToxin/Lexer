#include "binary_op_node.h"
#include "ast_visitor.h"

void BinaryOpNode::accept(ASTVisitor& visitor) {
    visitor.visit(*this);
}
