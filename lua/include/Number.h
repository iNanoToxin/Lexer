#ifndef LUA_NUMBER_H
#define LUA_NUMBER_H

#include <string>
#include <cmath>
#include <iomanip>
#include <algorithm>

class Number
{
public:
    double value = 0;

    explicit Number(double p_Value) : value(p_Value) {}

    std::string toHexadecimal() const
    {
        if (std::floor(value) != value)
        {
            return toString();
        }

        static const char* hex = "0123456789ABCDEF";
        std::string hex_string;

        double n = std::abs(value);

        if (n == 0)
        {
            hex_string += '0';
        }
        while (n != 0)
        {
            hex_string += hex[(int) std::fmod(n, 16.0)];
            n /= 16.0;
            n = std::trunc(n);
        }

        hex_string.push_back('x');
        hex_string.push_back('0');

        if (value < 0)
        {
            hex_string.push_back('-');
        }

        std::reverse(hex_string.begin(), hex_string.end());
        return hex_string;
    }

    std::string toString() const
    {
        std::string str = std::to_string(value);
        std::size_t sep = str.find_first_of('.');

        if (sep != std::string::npos)
        {
            while (str.size() > sep && str.back() == '0')
            {
                str.pop_back();
            }
            if (str.back() == '.')
            {
                str.pop_back();
            }
        }
        return str;
    }

    constexpr bool operator<(const Number& p_Other) const
    {
        return value < p_Other.value;
    }
    constexpr bool operator>(const Number& p_Other) const
    {
        return value > p_Other.value;
    }

    constexpr bool operator<=(const Number& p_Other) const
    {
        return value <= p_Other.value;
    }
    constexpr bool operator>=(const Number& p_Other) const
    {
        return value >= p_Other.value;
    }
    constexpr bool operator==(const Number& p_Other) const
    {
        return value == p_Other.value;
    }
    constexpr bool operator!=(const Number& p_Other) const
    {
        return value != p_Other.value;
    }
};


#endif
