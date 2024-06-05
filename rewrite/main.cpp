#include <iostream>

#include "ast/visitors/eval_visitor.h"
#include "ast/visitors/format_visitor.h"
#include "ast/visitors/refactor_visitor.h"
#include "parser/parser.h"
#include "utilities/util.h"

#include "lua.h"
#include "lnumutils.h"
#define FILE(a) "C:\\Users\\dylan\\JetBrains\\CLionProjects\\Lexer\\rewrite\\tests\\"#a".lua"
#define CODE FILE(test_3)



int main()
{
    RefactorVisitor refactor;
    EvalVisitor evaluator;
    FormatVisitor formatter;

    Parser parser;
    const std::shared_ptr<AstNode> chunk = parser.parse(Util::read_file(CODE));

    chunk->accept(refactor);
    chunk->accept(evaluator);
    chunk->accept(formatter);

    // char s[LUAI_MAXNUM2STR];
    // char* s2 = luai_num2str(s, 4343.0);
    // std::cout << s << " format: " << (s2[0] == '\0') << std::endl;
    //
    // for (int i = 0; i < LUAI_MAXNUM2STR; i++)
    // {
    //     if (s[i] == '\0')
    //     {
    //         break;
    //     }
    //     std::cout << s[i];
    // }
    // std::cout << std::endl;


    std::cout << "Finished formatting." << std::endl;
    Util::write_file(FILE(output), formatter.getResult());
    return 0;
}
