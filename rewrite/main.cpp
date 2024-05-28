#include <iostream>
#include "BinaryOpNode.h"
#include "NumberNode.h"
#include "EvalVisitor.h"

int main() {
    // Create an AST for the expression (5 + 3) * 2
    ExpressionNodePtr left = std::make_unique<BinaryOpNode>(
        std::make_unique<NumberNode>(5), '+', std::make_unique<NumberNode>(3));
    ExpressionNodePtr root = std::make_unique<BinaryOpNode>(
        std::move(left), '*', std::make_unique<NumberNode>(2));

    // Evaluate the expression
    EvalVisitor evaluator;
    root->accept(evaluator);
    std::cout << "Result: " << evaluator.getResult() << std::endl;

    return 0;
}
