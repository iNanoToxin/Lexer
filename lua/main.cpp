#include <iostream>
#include <ostream>
#include <fstream>
#include <sstream>
#include <string>
#include "tokenizer.h"

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

    token_stream stream;
    stream.tokenize(source);

    #define PRINT_TOKENS
    // #define RETURN_EARLY

    #ifdef PRINT_TOKENS
    {
                std::clog << "VIEW TOKENS: " << stream.tokens.size() << "\n";

                std::size_t max_length = 0;
                for (token& token: stream.tokens) {
                    if (token.literal.length() <= 15) {
                        max_length = std::max(max_length, token.literal.length());
                    }
                }

                for (token& token: stream.tokens) {
                    std::string type;

                    switch (token.type) {
                        case token_type::IDENTIFIER: {
                            type = "IDENTIFIER";
                            break;
                        }
                        case token_type::STRING_RAW: {
                            type = "STRING_RAW";
                            break;
                        }
                        case token_type::STRING: {
                            type = "STRING";
                            break;
                        }
                        case token_type::COMMENT_RAW: {
                            type = "COMMENT_RAW";
                            break;
                        }
                        case token_type::COMMENT: {
                            type = "COMMENT";
                            break;
                        }
                        case token_type::NUMBER_HEXADECIMAL: {
                            type = "NUMBER_HEXADECIMAL";
                            break;
                        }
                        case token_type::NUMBER_BINARY: {
                            type = "NUMBER_BINARY";
                            break;
                        }
                        case token_type::NUMBER: {
                            type = "NUMBER";
                            break;
                        }
                        case token_type::KEYWORD: {
                            type = "KEYWORD";
                            break;
                        }
                        case token_type::PUNCTUATION: {
                            type = "PUNCTUATION";
                            break;
                        }
                    }

                    // if (!(token.type == token_type::STRING)) {
                    //     continue;
                    // }

                    if (token.literal.length() <= 15) {
                        std::cout << token.literal << std::string(
                            max_length - token.literal.length(),
                            ' '
                        ) << " -> " << (type) << "\n";
                    }
                    else {
                        std::cout << token.literal << " -> " << (type) << "\n";
                    }
                }

                std::cout << "\n";
            }
    #endif

    #ifdef RETURN_EARLY
    return;
    #endif

    return 0;
}