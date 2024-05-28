#include "Util.h"
#include <map>
#include <sstream>

std::optional<double> Util::to_number(const std::string& p_Number)
{
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

std::optional<double> Util::to_number(const NodePointer& p_Node)
{
    if (p_Node->isKind(Kind::Numeric))
    {
        return p_Node->getChild<Number>(0).value;
    }
    else if (p_Node->isKind(Kind::String))
    {
        return to_number(unquote(*to_string(p_Node)));
    }
    return std::nullopt;
}

std::optional<std::string> Util::to_string(const std::string& p_String)
{
    return "\"" + to_raw_string(p_String, false) + "\"";
}

std::optional<std::string> Util::to_string(const NodePointer& p_Node)
{
    if (p_Node->isKind(Kind::Numeric))
    {
        return quote(p_Node->getChild<Number>(0).toString());
    }
    else if (p_Node->isKind(Kind::String))
    {
        std::string string = p_Node->getChild<std::string>(0);
        std::size_t is_raw_string = string.starts_with('[');

        return quote(to_raw_string(unquote(string), is_raw_string));
    }
    return std::nullopt;
}

std::string Util::to_raw_string(const std::string& p_String, bool p_IsRawString)
{
    std::stringstream result;

    std::wstring_convert<std::codecvt_utf8<char32_t>, char32_t> converter;
    std::u32string utf = converter.from_bytes(p_String);

    for (int i = 0; i < utf.size(); i++)
    {
        char32_t curr = utf[i];

        if (p_IsRawString)
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



std::string Util::quote(const std::string& p_String)
{
    return "\"" + p_String + "\"";
}

std::string Util::unquote(const std::string& p_String)
{
    std::size_t i = 1;

    if (p_String.starts_with("["))
    {
        while (i < p_String.size() && p_String[i] == '=')
        {
            i++;
        }
        i++;
    }
    return {p_String.begin() + i, p_String.end() - i};
}

bool Util::is_allowed_comparison(const NodePointer& p_Node)
{
    switch (p_Node->getKind())
    {
        case Kind::FunctionDefinition:
        case Kind::TableConstructor:
        case Kind::String:
        case Kind::Numeric:
        case Kind::Boolean:
        case Kind::Null:
        {
            return true;
        }
        default:
        {
            return false;
        }
    }
}
