#include <iostream>
#include "ast/binary_op_node.h"
#include "ast/number_node.h"
#include "ast/eval_visitor.h"

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
