#ifndef LUA_UTIL_H
#define LUA_UTIL_H

#include <Node.h>
#include <optional>
#include <codecvt>

#define assert(condition, message)                            \
    do {                                                      \
        if (!(condition))                                     \
        {                                                     \
            std::cerr << "Assertion `" #condition "` failed." \
                      << "\n\tFile: " << __FILE__             \
                      << "\n\tFunc: " << __FUNCTION__         \
                      << "\n\tLine: " << __LINE__             \
                      << "\n\tMessage: " << message           \
                      << std::endl;                           \
            abort();                                          \
        }                                                     \
    }                                                         \
    while (false)


static const std::vector<std::string> operators{
    "+",
    "-",
    "*",
    "/",
    "//",
    "%",
    "^",
    "-",
    "&",
    "|",
    "~",
    "~",
    "<<",
    ">>",
    "..",
    "#",
    "<",
    "<=",
    ">",
    ">=",
    "==",
    "~=",
    "not",
    "and",
    "or"};

namespace Util
{
    static OperatorKind get_operator(const std::string& p_OpStr)
    {
        for (int i = 0; i < operators.size(); i++)
        {
            if (operators[i] == p_OpStr)
            {
                return static_cast<OperatorKind>(i);
            }
        }
        throw std::invalid_argument("operator not found");
    }

    static std::string get_operator(OperatorKind p_OpKind)
    {
        return operators[static_cast<int>(p_OpKind)];
    }

    std::optional<std::string> get_sequence(char p_Char);
    bool is_sequence(char p_Char);

    std::optional<double> to_number(const std::string& p_Number);
    std::optional<double> to_number(const NodePointer& p_Node);

    std::string to_raw_string(const std::string& p_String, bool p_IsRawString);

    std::string quote(const std::string& p_String);

    std::string unquote(const std::string& p_String);

    std::optional<std::string> to_string(const NodePointer& p_Node);
    std::optional<std::string> to_string(const std::string& p_String);
}

namespace Operation
{
    using Add = std::plus<>;
    using Sub = std::minus<>;
    using Mul = std::multiplies<>;
    using Div = std::divides<>;

    struct Idiv
    {
        constexpr double operator()(double p_Lhs, double p_Rhs) const
        {
            return std::floor(p_Lhs / p_Rhs);
        }
    };
    struct Pow
    {
        constexpr double operator()(double p_Lhs, double p_Rhs) const
        {
            return std::pow(p_Lhs, p_Rhs);
        }
    };
    struct Mod
    {
        constexpr double operator()(double p_Lhs, double p_Rhs) const
        {
            return std::fmod(p_Lhs, p_Rhs);
        }
    };

    using Band = std::bit_and<>;
    using Bor = std::bit_or<>;
    using Bxor = std::bit_xor<>;

    struct Shl
    {
        constexpr double operator()(int p_Lhs, int p_Rhs) const
        {
            return p_Lhs << p_Rhs;
        }
    };
    struct Shr
    {
        constexpr double operator()(int p_Lhs, int p_Rhs) const
        {
            return p_Lhs >> p_Rhs;
        }
    };

    template <typename T>
    std::optional<double> arithmetic(const NodePointer& p_Lhs, const NodePointer& p_Rhs, T&& p_Func)
    {
        auto n = Util::to_number(p_Lhs);
        auto m = Util::to_number(p_Rhs);

        if (n && m)
        {
            return p_Func(*n, *m);
        }
        return std::nullopt;
    }

    template <typename T>
    std::optional<double> bitwise(const NodePointer& p_Lhs, const NodePointer& p_Rhs, T&& p_Func)
    {
        int n, m;

        if (p_Lhs->isKind(Kind::Numeric) && std::fmod(p_Lhs->getChild<Number>(0).value, 1.0) == 0.0)
        {
            n = static_cast<int>(p_Lhs->getChild<Number>(0).value);
        }
        else
        {
            return std::nullopt;
        }

        if (p_Rhs->isKind(Kind::Numeric) && std::fmod(p_Rhs->getChild<Number>(0).value, 1.0) == 0.0)
        {
            m = static_cast<int>(p_Rhs->getChild<Number>(0).value);
        }
        else
        {
            return std::nullopt;
        }
        return p_Func(n, m);
    }

    template <typename T>
    std::optional<double> unary_arithmetic(const NodePointer& p_Lhs, T&& p_Func)
    {
        if (auto value = Util::to_number(p_Lhs))
        {
            return p_Func(*value);
        }
        return std::nullopt;
    }

    template <typename T>
    std::optional<double> unary_bitwise(const NodePointer& p_Lhs, T&& p_Func)
    {
        if (p_Lhs->isKind(Kind::Numeric) && std::fmod(p_Lhs->getChild<Number>(0).value, 1.0) == 0.0)
        {
            return p_Func(static_cast<int>(p_Lhs->getChild<Number>(0).value));
        }
        return std::nullopt;
    }

    template <typename T>
    std::optional<bool> compare(const NodePointer& p_Lhs, const NodePointer& p_Rhs, T&& p_Func)
    {
        if (p_Lhs->isKind(Kind::Numeric) && p_Rhs->isKind(Kind::Numeric))
        {
            return p_Func(p_Lhs->getChild<Number>(0).value, p_Rhs->getChild<Number>(0).value);
        }
        return std::nullopt;
    }
}


#endif
