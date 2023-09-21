#include <iostream>
#include <ostream>
#include <fstream>
#include <sstream>
#include <string>
#include "parser.h"

int main() {

    std::string path = "../tests/test_2.txt";
    std::string source;

    {
        std::ifstream file;
        std::stringstream stream;

        file.open(path);

        if (!file.is_open()) { // Check if the file is opened successfully
            std::cerr << "Failed to open the file." << "\n";
            return 1; // Exit with an error code
        }

        stream << file.rdbuf();
        source = stream.str();
        file.close();
    }

    parser parser;
    parser.parse(source);



    return 0;
}