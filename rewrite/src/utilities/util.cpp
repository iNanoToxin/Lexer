#include "util.h"

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
