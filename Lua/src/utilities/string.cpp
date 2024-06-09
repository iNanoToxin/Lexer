#include "string.h"

namespace String
{
    int unquote(std::string& p_Result, const std::string& p_String)
    {
        if (p_String.starts_with("["))
        {
            std::size_t i = 0;
            while (i < p_String.size() && p_String[i] == '=')
            {
                i++;
            }
            p_Result = std::string{p_String.begin() + 2 + i, p_String.end() - 2 - i};
            return i;
        }
        p_Result = std::string{p_String.begin() + 1, p_String.end() - 1};
        return 0;
    }

    std::string parse_escape_string(const std::string& p_String) {
        std::string string;
        for (const char c : p_String)
        {
            switch (c)
            {
                case '\"':
                {
                    string.append("\\\"");
                    break;
                }
                case '\\':
                {
                    string.append("\\\\");
                    break;
                }
                case '\a':
                {
                    string.append("\\a");
                    break;
                }
                case '\b':
                {
                    string.append("\\b");
                    break;
                }
                case '\t':
                {
                    string.append("\\t");
                    break;
                }
                case '\n':
                {
                    string.append("\\n");
                    break;
                }
                case '\v':
                {
                    string.append("\\n");
                    break;
                }
                case '\f':
                {
                    string.append("\\n");
                    break;
                }
                case '\r':
                {
                    string.append("\\n");
                    break;
                }
                default:
                {
                    if (c < 32 || c >= 127)
                    {
                        string += '\\';
                        string += std::to_string(c);
                    }
                    else
                    {
                        string += c;
                    }
                    break;
                }
            }
        }
        return string;
    }
}
