#include <iostream>
#include <cstring>

#include "ast/visitors/eval_visitor.h"
#include "ast/visitors/format_visitor.h"
#include "ast/visitors/refactor_visitor.h"
#include "ast/visitors/json_visitor.h"
#include "parser/parser.h"
#include "utilities/util.h"

#include "lua.h"
#include "luacode.h"
#include "lualib.h"

#define PATH(FILE) "C:\\Users\\dylan\\JetBrains\\CLionProjects\\Lexer\\Lua\\tests\\"#FILE
#define CODE PATH(test_3.lua)

int compile_lua(const std::string& p_Source);

int main()
{
    RefactorVisitor refactor;
    EvalVisitor evaluator;
    FormatVisitor formatter;
    JsonVisitor encoder;

    Parser parser;
    const std::shared_ptr<AstNode> chunk = parser.parse(Util::read_file(CODE));

    chunk->accept(refactor);
    evaluator.setVariables(refactor.getVariables());
    chunk->accept(evaluator);
    chunk->accept(formatter);
    // chunk->accept(encoder);

    std::cout << "Finished formatting." << std::endl;
    Util::write_file(PATH(output.lua), formatter.getResult());
    Util::write_file(PATH(output_ast.json), encoder.getResult());

    return compile_lua(formatter.getResult());
}

int compile_lua(const std::string& p_Source)
{
    const char* source = p_Source.c_str();
    const char* chunk_name = "main";

    lua_State* state = luaL_newstate();
    if (state == nullptr)
    {
        printf("Failed to create Lua state.\n");
        return 1;
    }

    luaL_openlibs(state);

    size_t byte_code_size = 0;
    char* byte_code = luau_compile(source, strlen(source), nullptr, &byte_code_size);
    if (byte_code == nullptr)
    {
        printf("Failed to compile Lua source.\n");
        lua_close(state);
        return 1;
    }

    const int result = luau_load(state, chunk_name, byte_code, byte_code_size, 0);
    free(byte_code);

    if (result == 0)
    {
        lua_call(state, 0, 0);
    }
    else
    {
        const char* error = lua_tostring(state, -1);
        printf("Error: %s\n", error);
        lua_pop(state, 1);
    }
    lua_close(state);
    return result;
}
