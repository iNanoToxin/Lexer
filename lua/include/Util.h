#ifndef LUA_UTIL_H
#define LUA_UTIL_H

#include <Node.h>
#include <optional>

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
    static OperatorKind getOperator(const std::string& opStr)
    {
        for (int i = 0; i < operators.size(); i++)
        {
            if (operators[i] == opStr)
            {
                return static_cast<OperatorKind>(i);
            }
        }
        throw std::invalid_argument("operator not found");
    }

    static std::string getOperator(OperatorKind opKind)
    {
        return operators[static_cast<int>(opKind)];
    }

    std::optional<std::string> getSequence(char c);
    bool isSequence(char c);

    std::optional<double> toNumber(const std::string& number);
    std::optional<double> toNumber(const p_Node& node);

    std::string toRawString(const std::string& string, bool isRawString);

    std::string quote(const std::string& string);

    std::string unquote(const std::string& string);

    std::optional<std::string> toString(const p_Node& node);
    std::optional<std::string> toString(const std::string& string);
} // namespace Util

namespace Operation
{
    using Add = std::plus<>;
    using Sub = std::minus<>;
    using Mul = std::multiplies<>;
    using Div = std::divides<>;

    struct Idiv
    {
        constexpr double operator()(double lhs, double rhs) const
        {
            return std::floor(lhs / rhs);
        }
    };
    struct Pow
    {
        constexpr double operator()(double lhs, double rhs) const
        {
            return std::pow(lhs, rhs);
        }
    };
    struct Mod
    {
        constexpr double operator()(double lhs, double rhs) const
        {
            return std::fmod(lhs, rhs);
        }
    };

    using Band = std::bit_and<>;
    using Bor = std::bit_or<>;
    using Bxor = std::bit_xor<>;

    struct Shl
    {
        constexpr double operator()(int lhs, int rhs) const
        {
            return lhs << rhs;
        }
    };
    struct Shr
    {
        constexpr double operator()(int lhs, int rhs) const
        {
            return lhs >> rhs;
        }
    };

    template <typename T>
    std::optional<double> arithmetic(const p_Node& lhs, const p_Node& rhs, T&& func)
    {
        auto n = Util::toNumber(lhs);
        auto m = Util::toNumber(rhs);

        if (n && m)
        {
            return func(*n, *m);
        }
        return std::nullopt;
    }

    template <typename T>
    std::optional<double> bitwise(const p_Node& lhs, const p_Node& rhs, T&& func)
    {
        int n, m;

        if (lhs->isKind(Kind::Numeric) && std::fmod(lhs->getChild<Number>(0).value, 1.0) == 0.0)
        {
            n = static_cast<int>(lhs->getChild<Number>(0).value);
        }
        else
        {
            return std::nullopt;
        }

        if (rhs->isKind(Kind::Numeric) && std::fmod(rhs->getChild<Number>(0).value, 1.0) == 0.0)
        {
            m = static_cast<int>(rhs->getChild<Number>(0).value);
        }
        else
        {
            return std::nullopt;
        }
        return func(n, m);
    }

    template <typename T>
    std::optional<double> unaryArithmetic(const p_Node& lhs, T&& func)
    {
        if (auto value = Util::toNumber(lhs))
        {
            return func(*value);
        }
        return std::nullopt;
    }

    template <typename T>
    std::optional<double> unaryBitwise(const p_Node& lhs, T&& func)
    {
        if (lhs->isKind(Kind::Numeric) && std::fmod(lhs->getChild<Number>(0).value, 1.0) == 0.0)
        {
            return func(static_cast<int>(lhs->getChild<Number>(0).value));
        }
        return std::nullopt;
    }

    template <typename T>
    std::optional<bool> compare(const p_Node& lhs, const p_Node& rhs, T&& func)
    {
        if (lhs->isKind(Kind::Numeric) && rhs->isKind(Kind::Numeric))
        {
            return func(lhs->getChild<Number>(0).value, rhs->getChild<Number>(0).value);
        }
        return std::nullopt;
    }
} // namespace Operation


#endif
