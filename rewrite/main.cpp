#include <iostream>
#include "ast/visitors/eval_visitor.h"
#include "ast/visitors/format_visitor.h"
#include "ast/visitors/refactor_visitor.h"
#include "parser/parser.h"
#include "utilities/util.h"

#define FILE(a) "C:\\Users\\dylan\\JetBrains\\CLionProjects\\Lexer\\rewrite\\tests\\"#a".lua"
#define CODE FILE(test_2)

int main()
{
    RefactorVisitor refactor;
    EvalVisitor evaluator;
    FormatVisitor formatter;

    Parser parser;
    const std::shared_ptr<AstNode> chunk = parser.parse(Util::read_file(CODE));

    chunk->accept(refactor);
    chunk->accept(formatter);


    std::cout << "Finished formatting." << std::endl;
    Util::write_file(FILE(output), formatter.getResult());
    return 0;
}
