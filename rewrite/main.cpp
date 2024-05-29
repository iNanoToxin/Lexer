#include <iostream>
#include "ast/visitor/eval_visitor.h"

int main() {
    // Create an AST for the expression (5 + 3) * 2
    ExpressionNode* left = new BinaryOpNode(new NumberNode(5), '+', new NumberNode(3));
    ExpressionNode* root = new BinaryOpNode(left, '*', new NumberNode(2));

    // Evaluate the expression
    EvalVisitor* evaluator = new EvalVisitor();
    root->accept(evaluator);
    std::cout << "Result: " << std::get<int>(evaluator->getResult()) << std::endl;

    root->destroy();
    evaluator->destroy();



    return 0;
}
