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
}