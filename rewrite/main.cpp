#include <fstream>
#include <iostream>
#include "ast/visitor/eval_visitor.h"
#include "ast/visitor/format_visitor.h"
#include "tokenizer/token_stream.h"
#include "utilities/util.h"

int main()
{
    ExpressionNode* condition = new BinaryOpNode(new IdentifierNode("a"), ">=", new NumberNode(5));
    ExpressionNode* block = new BlockNode({
        new AssignmentStatNode(
            new VariableListNode({new IdentifierNode("b")}),
            new ExpressionListNode({new BinaryOpNode(new IdentifierNode("b"), "+", new NumberNode(1))})
        ),
        new AssignmentStatNode(
            new VariableListNode({new IdentifierNode("c")}),
            new ExpressionListNode({new BinaryOpNode(new IdentifierNode("c"), "+", new NumberNode(1))})
        ),
        new AssignmentStatNode(
            new VariableListNode({new IdentifierNode("d")}),
            new ExpressionListNode({new BinaryOpNode(new IdentifierNode("d"), "+", new NumberNode(1))})
        )
    });

    ExpressionNode* while_stat = new WhileStatNode(condition, block);
    // while_stat = new WhileStatNode(condition, new BlockNode({while_stat}));
    // while_stat = new WhileStatNode(condition, new BlockNode({while_stat}));
    // while_stat = new WhileStatNode(condition, new BlockNode({while_stat}));

    FormatVisitor* formatter = new FormatVisitor();
    while_stat->accept(formatter);
    std::cout << formatter->getResult() << std::endl;



    TokenStream stream;
    stream.tokenize(Util::read_file(R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\test_2.lua)"));


    while_stat->destroy();


    return 0;
}
