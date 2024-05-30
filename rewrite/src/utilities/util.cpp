#include "util.h"

#include <fstream>
#include <sstream>
#include "./assert.h"

std::string Util::read_file(const char* p_Path)
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
        LL_failure("Failed to read file.", err.what(), p_Path);
    }
    return stream.str();
}

void Util::write_file(const char* p_Path, const std::string& p_Source)
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
        LL_failure("Failed to write file.", err.what(), p_Path);
    }
}
