#ifndef UTIL_H
#define UTIL_H

#include <string>

namespace Util
{
    std::string read_file(const char* p_Path);
    void write_file(const char* p_Path, const std::string& p_Source);
}

#endif //UTIL_H
