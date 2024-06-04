#include "string.h"

namespace String
{
    std::string unquote(const std::string& p_String)
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
        return std::string{p_String.begin() + i, p_String.end() - i};
    }
}