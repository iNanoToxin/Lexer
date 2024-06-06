#include <iostream>
#include <cstring>

#include "ast/visitors/eval_visitor.h"
#include "ast/visitors/format_visitor.h"
#include "ast/visitors/refactor_visitor.h"
#include "parser/parser.h"
#include "utilities/util.h"

#include "lua.h"
#include "luacode.h"
#include "lualib.h"

#define FILE(a) "C:\\Users\\dylan\\JetBrains\\CLionProjects\\Lexer\\rewrite\\tests\\"#a".lua"
#define CODE FILE(test_1)


int main()
{
    RefactorVisitor refactor;
    EvalVisitor evaluator;
    FormatVisitor formatter;

    Parser parser;
    const std::shared_ptr<AstNode> chunk = parser.parse(Util::read_file(CODE));

    chunk->accept(refactor);
    evaluator.setVariables(refactor.getVariables());
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


    {
        const std::string& src = formatter.getResult();
        const char* source = src.c_str();
        const char* chunkname = "main";

        lua_State* L = luaL_newstate();
        if (L == nullptr)
        {
            printf("Failed to create Lua state\n");
            return 1;
        }

        luaL_openlibs(L); // Load standard Lua libraries

        size_t bytecodeSize = 0;
        char* bytecode = luau_compile(source, strlen(source), nullptr, &bytecodeSize);
        if (bytecode == nullptr)
        {
            printf("Failed to compile Lua source\n");
            lua_close(L);
            return 1;
        }

        const int result = luau_load(L, chunkname, bytecode, bytecodeSize, 0);
        free(bytecode);

        if (result == 0)
        {
            lua_call(L, 0, 0);
        }
        else
        {
            const char* error = lua_tostring(L, -1);
            printf("Error: %s\n", error);
            lua_pop(L, 1);
        }

        lua_close(L);
    }
    return 0;
}
