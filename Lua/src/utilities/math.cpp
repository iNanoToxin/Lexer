#include "math.h"
#include <limits>
#include "./assert.h"

LuaDouble BitwiseOp::bit_and(const LuaDouble p_X, const LuaDouble p_Y)
{
    LL_assert(Math::is_convertible_to_int(p_X), "`p_X` should be an integer.");
    LL_assert(Math::is_convertible_to_int(p_Y), "`p_Y` should be an integer.");
    return static_cast<LuaInteger>(p_X) & static_cast<LuaInteger>(p_Y);
}
LuaDouble BitwiseOp::bit_or(const LuaDouble p_X, const LuaDouble p_Y)
{
    LL_assert(Math::is_convertible_to_int(p_X), "`p_X` should be an integer.");
    LL_assert(Math::is_convertible_to_int(p_Y), "`p_Y` should be an integer.");
    return static_cast<LuaInteger>(p_X) | static_cast<LuaInteger>(p_Y);
}
LuaDouble BitwiseOp::bit_xor(const LuaDouble p_X, const LuaDouble p_Y)
{
    LL_assert(Math::is_convertible_to_int(p_X), "`p_X` should be an integer.");
    LL_assert(Math::is_convertible_to_int(p_Y), "`p_Y` should be an integer.");
    return static_cast<LuaInteger>(p_X) ^ static_cast<LuaInteger>(p_Y);
}
LuaDouble BitwiseOp::bit_shift_left(const LuaDouble p_X, const LuaDouble p_Y)
{
    LL_assert(Math::is_convertible_to_int(p_X), "`p_X` should be an integer.");
    LL_assert(Math::is_convertible_to_int(p_Y), "`p_Y` should be an integer.");
    return static_cast<LuaInteger>(p_X) << static_cast<LuaInteger>(p_Y);
}
LuaDouble BitwiseOp::bit_shift_right(const LuaDouble p_X, const LuaDouble p_Y)
{
    LL_assert(Math::is_convertible_to_int(p_X), "`p_X` should be an integer.");
    LL_assert(Math::is_convertible_to_int(p_Y), "`p_Y` should be an integer.");
    return static_cast<LuaInteger>(p_X) >> static_cast<LuaInteger>(p_Y);
}

LuaDouble ArithmeticOp::plus(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X + p_Y;
}
LuaDouble ArithmeticOp::minus(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X - p_Y;
}
LuaDouble ArithmeticOp::multiply(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X * p_Y;
}
LuaDouble ArithmeticOp::float_divide(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X / p_Y;
}
LuaDouble ArithmeticOp::floor_division(const LuaDouble p_X, const LuaDouble p_Y)
{
    return std::floor(p_X / p_Y);
}
LuaDouble ArithmeticOp::pow(const LuaDouble p_X, const LuaDouble p_Y)
{
    return std::pow(p_X, p_Y);
}
LuaDouble ArithmeticOp::mod(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X - std::floor(p_X / p_Y) * p_Y;
}

bool EqualityOp::less_than(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X < p_Y;
}
bool EqualityOp::less_then_or_equal(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X <= p_Y;
}
bool EqualityOp::greater_than(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X > p_Y;
}
bool EqualityOp::greater_then_or_equal(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X >= p_Y;
}
bool EqualityOp::equal(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X == p_Y;
}
bool EqualityOp::not_equal(const LuaDouble p_X, const LuaDouble p_Y)
{
    return p_X != p_Y;
}


bool Math::string_to_integer(LuaInteger* p_Out, const std::string& p_Number)
{
    try
    {
        std::size_t position;
        if (p_Number.size() > 1 && p_Number[0] == '0' && std::tolower(p_Number[1]) == 'x')
        {
            *p_Out = std::stoll(p_Number, &position, 16);
            return position == p_Number.size();
        }
        *p_Out = std::stoll(p_Number, &position);
        return position == p_Number.size();
    }
    catch (...) {}
    return false;
}
bool Math::string_to_double(LuaDouble* p_Out, const std::string& p_Number)
{
    try
    {
        std::size_t position;
        *p_Out = std::stod(p_Number, &position);
        return position == p_Number.size();
    }
    catch (std::out_of_range&)
    {
        *p_Out = std::numeric_limits<LuaDouble>::infinity();
    }
    catch (std::invalid_argument&)
    {
        return false;
    }
    return true;
}

bool Math::is_convertible_to_int(const LuaDouble p_Double)
{
    if (p_Double < std::numeric_limits<LuaInteger>::min() || p_Double > std::numeric_limits<LuaInteger>::max())
    {
        return false;
    }
    return std::floor(p_Double) == p_Double;
}