#include "Util.h"
#include <map>
#include <sstream>

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
        return toNumber(unquote(*toString(node)));
    }
    return std::nullopt;
}

std::optional<std::string> Util::toString(const std::string& string)
{
    return "\"" + toRawString(string, false) + "\"";
}

std::optional<std::string> Util::toString(const p_Node& node)
{
    if (node->isKind(Kind::Numeric))
    {
        return quote(node->getChild<Number>(0).toString());
    }
    else if (node->isKind(Kind::String))
    {
        auto string = node->getChild<std::string>(0);
        auto isRawString = string.starts_with('[');

        return quote(toRawString(unquote(string), isRawString));
    }
    return std::nullopt;
}

std::string Util::toRawString(const std::string& string, bool isRawString)
{
    std::stringstream result;

    std::wstring_convert<std::codecvt_utf8<char32_t>, char32_t> converter;
    std::u32string utf = converter.from_bytes(string);

    for (int i = 0; i < utf.size(); i++)
    {
        char32_t curr = utf[i];

        if (isRawString)
        {
            switch (curr)
            {
                case '\a':
                {
                    result << "\\a";
                    continue;
                }
                case '\b':
                {
                    result << "\\b";
                    continue;
                }
                case '\f':
                {
                    result << "\\f";
                    continue;
                }
                case '\n':
                {
                    result << "\\n";
                    continue;
                }
                case '\r':
                {
                    result << "\\r";
                    continue;
                }
                case '\t':
                {
                    result << "\\t";
                    continue;
                }
                case '\v':
                {
                    result << "\\v";
                    continue;
                }
                case '\\':
                {
                    result << "\\\\";
                    continue;
                }
                case '\"':
                {
                    result << "\\\"";
                    continue;
                }
                case '\'':
                {
                    result << "\\\'";
                    continue;
                }
                default:
                {
                    break;
                }
            }
        }
        else
        {
            if (curr == '\\' && i + 1 < utf.size())
            {
                char32_t next = utf[++i];

                switch (next)
                {
                    case 'a':
                    case 'b':
                    case 'f':
                    case 'n':
                    case 'r':
                    case 't':
                    case 'v':
                    case '\\':
                    case '\"':
                    case '\'':
                    {
                        result << '\\' << static_cast<char>(next);
                        break;
                    }
                    case 'x':
                    {
                        if (i + 2 < utf.size() && std::isxdigit(utf[i + 1]) && std::isxdigit(utf[i + 2]))
                        {
                            result << "\\x";
                            result << static_cast<char>(utf[++i]);
                            result << static_cast<char>(utf[++i]);
                            break;
                        }
                        throw std::invalid_argument("sequence expects two hex digits");
                    }
                    case 'u':
                    {
                        result << "\\u";

                        if (!(i + 1 < utf.size() && utf[i + 1] == '{'))
                        {
                            throw std::invalid_argument("expected { after utf8");
                        }
                        result << static_cast<char>(utf[++i]);

                        while (i + 1 < utf.size() && std::isxdigit(utf[i + 1]))
                        {
                            result << static_cast<char>(utf[++i]);
                        }

                        if (!(i + 1 < utf.size() && utf[i + 1] == '}'))
                        {
                            throw std::invalid_argument("expected } after utf8");
                        }
                        result << static_cast<char>(utf[++i]);
                        break;
                    }
                    case 'z':
                    {
                        while (i + 1 < utf.size() && utf[i + 1] == ' ')
                        {
                            i++;
                        }
                        break;
                    }
                    case '\n':
                    {
                        result << "\\n";
                        break;
                    }
                    default:
                    {
                        if (std::isdigit(next))
                        {
                            int j = i;
                            int k = 0;
                            while (j - i < 3 && j < utf.size() && std::isdigit(utf[j]))
                            {
                                k *= 10;
                                k += utf[j] - '0';
                                j++;
                            }
                            i = j - 1;

                            if (k >= 32 && k <= 126)
                            {
                                result << static_cast<char>(k);
                                continue;
                            }

                            result << '\\';
                            if (k >= 256)
                            {
                                throw std::invalid_argument("escape sequence too large");
                            }

                            if (i + 1 < utf.size() && std::isdigit(utf[i + 1]))
                            {
                                result << std::setfill('0');
                                result << std::setw(3);
                            }

                            result << k;
                            break;
                        }
                        throw std::invalid_argument("invalid escape sequence");
                    }
                }
                continue;
            }
        }

        if (curr >= 32 && curr <= 126)
        {
            result << static_cast<char>(curr);
        }
        else if (curr >= 0 && curr <= 127)
        {
            result << "\\";

            if (i + 1 < utf.size() && std::isdigit(utf[i + 1]))
            {
                result << std::setfill('0');
                result << std::setw(3);
            }

            result << static_cast<int>(curr);
        }
        else
        {
            result << "\\u{";
            result << std::hex;
            result << std::uppercase;
            result << static_cast<int>(curr);
            result << "}";
        }
    }
    return result.str();
}



std::string Util::quote(const std::string& string)
{
    return "\"" + string + "\"";
}

std::string Util::unquote(const std::string& string)
{
    auto i = 1;

    if (string.starts_with("["))
    {
        while (i < string.size() && string[i] == '=')
        {
            i++;
        }
        i++;
    }
    return {string.begin() + i, string.end() - i};
}
