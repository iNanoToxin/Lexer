#include <iostream>
#include "ast/visitors/eval_visitor.h"
#include "ast/visitors/format_visitor.h"
#include "parser/parser.h"
#include "utilities/util.h"

#define INPUT_FILE R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\test_3.lua)"
#define OUTPUT_FILE R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\output.lua)"
#define OUTPUT_AST_FILE R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\output_ast.lua)"

int main()
{
    Parser parser;
    const std::shared_ptr<AstNode> chunk = parser.parse(Util::read_file(INPUT_FILE));


    FormatVisitor formatter;
    chunk->accept(formatter);

    std::cout << "Finished formatting." << std::endl;
    Util::write_file(OUTPUT_FILE, formatter.getResult());
    return 0;
}
