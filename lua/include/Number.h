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

    explicit Number(double value) : value(value) {}

    std::string toHexadecimal() const
    {
        if (std::floor(value) != value)
        {
            return toString();
        }

        static const char* hex = "0123456789ABCDEF";
        std::string hexString;

        auto n = std::abs(value);

        if (n == 0)
        {
            hexString += '0';
        }
        while (n != 0)
        {
            hexString += hex[(int) std::fmod(n, 16.0)];
            n /= 16.0;
            n = std::trunc(n);
        }

        hexString.push_back('x');
        hexString.push_back('0');

        if (value < 0)
        {
            hexString.push_back('-');
        }

        std::reverse(hexString.begin(), hexString.end());
        return hexString;
    }

    std::string toString() const
    {
        auto str = std::to_string(value);
        auto sep = str.find_first_of('.');

        if (sep != std::string::npos)
        {
            while (str.size() > sep && str.back() == '0')
            {
                str.pop_back();
            }
            str.pop_back();
        }
        return str;
    }
};


#endif
