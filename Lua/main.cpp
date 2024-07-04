#include <iostream>

#include "ast/visitors/eval_visitor.h"
#include "ast/visitors/format_visitor.h"
#include "ast/visitors/refactor_visitor.h"
#include "ast/visitors/json_visitor.h"
#include "parser/parser.h"
#include "utilities/compiler.h"
#include "utilities/util.h"

#define PATH(FILE) "C:\\Users\\dylan\\JetBrains\\CLionProjects\\Lexer\\Lua\\tests\\"#FILE
#define CODE PATH(test_2.lua)

#include <iomanip>

#include "Luau/Lexer.h"

int main()
{
    const std::string& source = Util::read_file(CODE);
    constexpr bool compile_source = true;

    RefactorVisitor refactor;
    EvalVisitor evaluator;
    FormatVisitor formatter;
    JsonVisitor encoder;

    Luau::Allocator allocator;
    Luau::AstNameTable names(allocator);
    Luau::Lexer lexer(source.c_str(), source.size(), names);


    /*Parser parser;
    const std::shared_ptr<AstNode> chunk = parser.parse(source);

    chunk->accept(refactor);
    evaluator.setVariables(refactor.getVariables());
    chunk->accept(evaluator);
    chunk->accept(formatter);
    chunk->accept(encoder);*/

    std::cout << "Finished formatting." << std::endl;
    // Util::write_file(PATH(output.lua), formatter.getResult());

    return Compiler::compile(compile_source ? source : formatter.getResult());
}
