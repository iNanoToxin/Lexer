#include "Util.h"

std::optional<double> Util::toNumber(const std::string& number)
{
    double integer = 0;
    double fractional = 0;
    double exponential = 1;

    bool isFractional = false;
    bool isBase16 = false;

    int base = 10;
    int i = 0;
    int j = 0;
    int n = number.size() - 1;

    while (i < n && isspace(number[i]))
    {
        i++;
    }

    while (n >= 0 && isspace(number[n]))
    {
        n--;
    }

    if (i + 1 <= n && number[i] == '0' && (number[i + 1] == 'x' || number[i + 1] == 'X'))
    {
        isBase16 = true;
        base = 16;
        i += 2;
    }

    while (i <= n)
    {
        char c = number[i++];

        if (c == '.')
        {
            if (isFractional)
            {
                return std::nullopt;
            }
            isFractional = true;
            continue;
        }

        int num = c - '0';

        if (isBase16)
        {
            if (c == 'p' || c == 'P')
            {
                int exp = 0;
                while (i <= n && isdigit(number[i]))
                {
                    exp *= 10;
                    exp += number[i++] - '0';
                }
                exponential = std::pow(2, exp);
                break;
            }

            if (!isxdigit(c))
            {
                return std::nullopt;
            }

            if (c >= 'a' && c <= 'f')
            {
                num = c - 'a' + 10;
            }
            else if (c >= 'A' && c <= 'f')
            {
                num = c - 'A' + 10;
            }
        }
        else
        {
            if (c == 'e' || c == 'E')
            {
                int exp = 0;
                while (i <= n && isdigit(number[i]))
                {
                    exp *= 10;
                    exp += number[i++] - '0';
                }
                exponential = std::pow(10, exp);
                break;
            }

            if (!isdigit(c))
            {
                return std::nullopt;
            }
        }

        if (isFractional)
        {
            j++;
            fractional *= base;
            fractional += num;
        }
        else
        {
            integer *= base;
            integer += num;
        }
    }

    if (i <= n)
    {
        return std::nullopt;
    }

    fractional /= std::pow(isBase16 ? 16 : 10, j);
    return (integer + fractional) * exponential;
}

std::optional<double> Util::toNumber(const p_Node& node)
{
    if (node->isKind(Kind::Numeric))
    {
        return node->getChild<Number>(0).value;
    }
    else if (node->isKind(Kind::String))
    {
        return toNumber(*toString(node));
    }
    return std::nullopt;
}

std::optional<std::string> Util::toString(const p_Node& node)
{
    if (node->isKind(Kind::Numeric))
    {
        return node->getChild<Number>(0).toString();
    }
    else if (node->isKind(Kind::String))
    {
        auto s = node->getChild<std::string>(0);
        auto i = 1;

        if (s.starts_with("["))
        {
            while (i < s.size() && s[i] == '=')
            {
                i++;
            }
            i++;
        }
        return std::string(s.begin() + i, s.end() - i);
    }
    return std::nullopt;
}