#pragma once
#include <iostream>
#include <string>

namespace String
{
    int unquote(std::string& p_Result, const std::string& p_String);

    std::string parse_escape_string(const std::string& p_String);
}
