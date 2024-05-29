#include <iostream>
#include <ostream>
#include <fstream>
#include <sstream>
#include <string>
#include <Generation.h>

#define f_assert(condition, message)                      \
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
    std::string luaSource;
    {
        std::ifstream file(R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\test_2.lua)");
        f_assert(file.is_open(), "failed to open file");

        std::stringstream stream;
        stream << file.rdbuf();
        luaSource = stream.str();
        file.close();
    }

    Generator g;
    std::string generated = g.generate(luaSource);
    // Parser p;
    // std::string generated = p.parse(luaSource)->toString(0);

    {
        std::ofstream file(R"(C:\Users\dylan\JetBrains\CLionProjects\Lexer\lua\tests\output.lua)");
        f_assert(file.is_open(), "Failed to open the file.");
        file << generated;
        file.close();
    }
    // std::cout << generated;
    return 0;
}
