#include "EvalVisitor.h"
#include "BinaryOpNode.h"
#include "NumberNode.h"

void EvalVisitor::visit(BinaryOpNode& node) {
    node.left->accept(*this);
    int leftValue = result;
    node.right->accept(*this);
    int rightValue = result;

    switch (node.op) {
        case '+':
            result = leftValue + rightValue;
        break;
        case '-':
            result = leftValue - rightValue;
        break;
        case '*':
            result = leftValue * rightValue;
        break;
        case '/':
            result = leftValue / rightValue;
        break;
        default:
            throw std::runtime_error("Unknown operator");
    }
}

void EvalVisitor::visit(NumberNode& node) {
    result = node.value;
}
