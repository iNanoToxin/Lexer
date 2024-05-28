#include "NumberNode.h"
#include "ASTVisitor.h"

void NumberNode::accept(ASTVisitor& visitor) {
    visitor.visit(*this);
}
