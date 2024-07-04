#pragma once
#include <string>
#include "luacode.h"
#include "lualib.h"


namespace Compiler
{
    inline int compile(const std::string& p_Source)
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
        char* byte_code = luau_compile(source, p_Source.size(), nullptr, &byte_code_size);
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
}
