#include "BinaryOpNode.h"
#include "ASTVisitor.h"

void BinaryOpNode::accept(ASTVisitor& visitor) {
    visitor.visit(*this);
}
