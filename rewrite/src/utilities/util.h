#ifndef UTIL_H
#define UTIL_H

#include <string>

namespace Util
{
    std::string read_file(const std::string& p_Path);
    void write_file(const std::string& p_Path, const std::string& p_Source);

    std::string string_wrap(char p_LWrap, const std::string& p_String, char p_RWrap);
    std::string string_wrap(const std::string& p_String, char p_Wrap);

    int get_precedence(bool p_IsUnaryOp);
    int get_precedence(const std::string& p_Op);
}

#endif //UTIL_H
