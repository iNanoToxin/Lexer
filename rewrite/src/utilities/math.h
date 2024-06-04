#pragma once
#include <cmath>
#include "ast/node_headers.h"

namespace BitwiseOp
{
    LuaDouble bit_and(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble bit_or(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble bit_xor(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble bit_shift_left(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble bit_shift_right(LuaDouble p_X, LuaDouble p_Y);
}



namespace ArithmeticOp
{
    LuaDouble plus(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble minus(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble multiply(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble float_divide(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble floor_division(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble pow(LuaDouble p_X, LuaDouble p_Y);
    LuaDouble mod(LuaDouble p_X, LuaDouble p_Y);
}

namespace Math
{
    bool string_to_integer(LuaInteger* p_Out, const std::string& p_Number);
    bool string_to_double(LuaDouble* p_Out, const std::string& p_Number);

    bool is_convertible_to_int(LuaDouble p_Double);

    bool perform_binary_op(
        std::shared_ptr<AstNode>& p_Result,
        const std::shared_ptr<AstNode>& p_Lhs,
        double (*p_Operation)(double, double),
        const std::shared_ptr<AstNode>& p_Rhs,
        bool p_ForceDouble = false
    );
}
