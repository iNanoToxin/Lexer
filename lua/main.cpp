#include <iostream>
#include <ostream>
#include <fstream>
#include <sstream>
#include <string>
#include "Parser.h"

#define f_assert(condition, message)                        \
do {                                                      \
    if (!(condition)) {                                   \
        std::cerr << "Assertion `" #condition "` failed." \
        << "\n\tFile: " << __FILE__                       \
        << "\n\tFunc: " << __FUNCTION__                   \
        << "\n\tLine: " << __LINE__                       \
        << "\n\tMessage: " << message                     \
        << std::endl;                                     \
        abort();                                          \
    }                                                     \
} while (false)

int main() {


    std::string source;
    {
        std::ifstream file("../tests/test_2.lua");
        f_assert(file.is_open(), "failed to open file");

        std::stringstream stream;
        stream << file.rdbuf();
        source = stream.str();
        file.close();
    }
    //
    // generator generator;
    // std::string generated = generator.generate(m_Source);
    //
    // {
    //     std::ofstream file("../tests/output.lua");
    //     assert(file.is_open(), "Failed to open the file.");
    //     file << generated;
    //     file.close();
    // }
    // std::cout << generated;

    Parser p;
    p.parse(source);

    return 0;
}