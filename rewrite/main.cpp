#include <fstream>
#include <iostream>
#include "ast/visitor/eval_visitor.h"
#include "ast/visitor/format_visitor.h"
#include "parser/parser.h"
#include "utilities/util.h"

#define INPUT_FILE R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\test_2.lua)"
#define OUTPUT_FILE R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\output.lua)"
#define OUTPUT_AST_FILE R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\output_ast.lua)"

int main()
{
    // TokenStream stream;
    // stream.tokenize(Util::read_file(INPUT_FILE));

    Parser parser;
    ExpressionNode* chunk = parser.parse(Util::read_file(INPUT_FILE));

    FormatVisitor* formatter = new FormatVisitor();
    chunk->accept(formatter);
    // std::cout << formatter->getResult() << std::endl;
    std::cout << "Finished formatting." << std::endl;

    Util::write_file(OUTPUT_FILE, formatter->getResult());
    return 0;
}
