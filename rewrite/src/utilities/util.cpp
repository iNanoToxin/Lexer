#include "util.h"

#include <cmath>
#include <fstream>
#include <sstream>
#include <fmt/format.h>
#include "./assert.h"

std::string Util::read_file(const std::string& p_Path)
{
    std::stringstream stream;

    try
    {
        std::ifstream file;
        file.exceptions(std::ifstream::failbit | std::ifstream::badbit);
        file.open(p_Path);
        stream << file.rdbuf();
        file.close();
    }
    catch (std::ifstream::failure& err)
    {
        LL_failure("Failed to read file.", err.what(), p_Path.c_str());
    }
    return stream.str();
}

void Util::write_file(const std::string& p_Path, const std::string& p_Source)
{
    try
    {
        std::ofstream file;
        file.exceptions(std::ifstream::failbit | std::ifstream::badbit);
        file.open(p_Path);
        file << p_Source;
        file.close();
    }
    catch (std::ofstream::failure& err)
    {
        LL_failure("Failed to write file.", err.what(), p_Path.c_str());
    }
}

std::string Util::string_wrap(const char p_LWrap, const std::string& p_String, const char p_RWrap)
{
    return fmt::format("{}{}{}", p_LWrap, p_String, p_RWrap);
}

std::string Util::string_wrap(const std::string& p_String, const char p_Wrap)
{
    return string_wrap(p_Wrap, p_String, p_Wrap);
}

int Util::get_precedence(const bool p_IsUnaryOp)
{
    (void) p_IsUnaryOp;
    return 11;
}

int Util::get_precedence(const std::string& p_Op) {
    if (p_Op == "or")
    {
        return 1;
    }
    if (p_Op == "and")
    {
        return 2;
    }
    if (p_Op == "<" || p_Op == ">" || p_Op == "<=" || p_Op == ">=" || p_Op == "~=" || p_Op == "==")
    {
        return 3;
    }
    if (p_Op == "|")
    {
        return 4;
    }
    if (p_Op == "~")
    {
        return 5;
    }
    if (p_Op == "&")
    {
        return 6;
    }
    if (p_Op == "<<" || p_Op == ">>")
    {
        return 7;
    }
    if (p_Op == "..")
    {
        return 8;
    }
    if (p_Op == "+" || p_Op == "-")
    {
        return 9;
    }
    if (p_Op == "*" || p_Op == "/" || p_Op == "//" || p_Op == "%")
    {
        return 10;
    }
    // not, #, -, ~
    // if (p_IsUnaryOp)
    // {
    //     return 11;
    // }
    if (p_Op == "^")
    {
        return 12;
    }
    return -1;
}

std::optional<double> Util::to_number(const std::string& p_Number) {
    double integer = 0;
    double fractional = 0;
    double exponential = 1;

    bool is_fractional = false;
    bool is_base_16 = false;

    int base = 10;
    int i = 0;
    int j = 0;
    int n = p_Number.size() - 1;

    while (i < n && isspace(p_Number[i]))
    {
        i++;
    }

    while (n >= 0 && isspace(p_Number[n]))
    {
        n--;
    }

    if (i + 1 <= n && p_Number[i] == '0' && (p_Number[i + 1] == 'x' || p_Number[i + 1] == 'X'))
    {
        is_base_16 = true;
        base = 16;
        i += 2;
    }

    while (i <= n)
    {
        char c = p_Number[i++];

        if (c == '.')
        {
            if (is_fractional)
            {
                return std::nullopt;
            }
            is_fractional = true;
            continue;
        }

        int num = c - '0';

        if (is_base_16)
        {
            if (c == 'p' || c == 'P')
            {
                int exp = 0;
                while (i <= n && isdigit(p_Number[i]))
                {
                    exp *= 10;
                    exp += p_Number[i++] - '0';
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
                while (i <= n && isdigit(p_Number[i]))
                {
                    exp *= 10;
                    exp += p_Number[i++] - '0';
                }
                exponential = std::pow(10, exp);
                break;
            }

            if (!isdigit(c))
            {
                return std::nullopt;
            }
        }

        if (is_fractional)
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

    fractional /= std::pow(is_base_16 ? 16 : 10, j);
    return (integer + fractional) * exponential;
}
