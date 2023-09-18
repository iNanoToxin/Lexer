#include <iostream>
#include <ostream>
#include <fstream>
#include <sstream>
#include <string>
#include "tokenizer.h"

int main() {

    std::string path = "../test_1.txt";
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
                        case token_type::DECL_FUNCTION: {
                            type = "DECL_FUNCTION";
                            break;
                        }
                        case token_type::DECL_LOCAL: {
                            type = "DECL_LOCAL";
                            break;
                        }
                        case token_type::BOOL_FALSE: {
                            type = "BOOL_FALSE";
                            break;
                        }
                        case token_type::BOOL_TRUE: {
                            type = "BOOL_TRUE";
                            break;
                        }
                        case token_type::COND_AND: {
                            type = "COND_AND";
                            break;
                        }
                        case token_type::COND_NOT: {
                            type = "COND_NOT";
                            break;
                        }
                        case token_type::COND_OR: {
                            type = "COND_OR";
                            break;
                        }
                        case token_type::STAT_ELSE_IF: {
                            type = "STAT_ELSE_IF";
                            break;
                        }
                        case token_type::STAT_ELSE: {
                            type = "STAT_ELSE";
                            break;
                        }
                        case token_type::STAT_FOR: {
                            type = "STAT_FOR";
                            break;
                        }
                        case token_type::STAT_DO: {
                            type = "STAT_DO";
                            break;
                        }
                        case token_type::STAT_IF: {
                            type = "STAT_IF";
                            break;
                        }
                        case token_type::STAT_WHILE: {
                            type = "STAT_WHILE";
                            break;
                        }
                        case token_type::STAT_REPEAT: {
                            type = "STAT_REPEAT";
                            break;
                        }
                        case token_type::STAT_RETURN: {
                            type = "STAT_RETURN";
                            break;
                        }
                        case token_type::STAT_GOTO: {
                            type = "STAT_GOTO";
                            break;
                        }
                        case token_type::LOOP_BREAK: {
                            type = "LOOP_BREAK";
                            break;
                        }
                        case token_type::LOOP_CONTINUE: {
                            type = "LOOP_CONTINUE";
                            break;
                        }
                        case token_type::KEYWORD_UNTIL: {
                            type = "KEYWORD_UNTIL";
                            break;
                        }
                        case token_type::KEYWORD_THEN: {
                            type = "KEYWORD_THEN";
                            break;
                        }
                        case token_type::KEYWORD_NIL: {
                            type = "KEYWORD_NIL";
                            break;
                        }
                        case token_type::KEYWORD_IN: {
                            type = "KEYWORD_IN";
                            break;
                        }
                        case token_type::KEYWORD_END: {
                            type = "KEYWORD_END";
                            break;
                        }
                        case token_type::OP_EQ: {
                            type = "OP_EQ";
                            break;
                        }
                        case token_type::OP_NOT_EQ: {
                            type = "OP_NOT_EQ";
                            break;
                        }
                        case token_type::OP_LE: {
                            type = "OP_LE";
                            break;
                        }
                        case token_type::OP_GE: {
                            type = "OP_GE";
                            break;
                        }
                        case token_type::OP_LT: {
                            type = "OP_LT";
                            break;
                        }
                        case token_type::OP_GT: {
                            type = "OP_GT";
                            break;
                        }
                        case token_type::OP_ADD: {
                            type = "OP_ADD";
                            break;
                        }
                        case token_type::OP_SUB: {
                            type = "OP_SUB";
                            break;
                        }
                        case token_type::OP_MUL: {
                            type = "OP_MUL";
                            break;
                        }
                        case token_type::OP_DIV: {
                            type = "OP_DIV";
                            break;
                        }
                        case token_type::OP_MOD: {
                            type = "OP_MOD";
                            break;
                        }
                        case token_type::OP_POW: {
                            type = "OP_POW";
                            break;
                        }
                        case token_type::OP_IDIV: {
                            type = "OP_IDIV";
                            break;
                        }
                        case token_type::OP_CONCAT: {
                            type = "OP_CONCAT";
                            break;
                        }
                        case token_type::OP_BIT_AND: {
                            type = "OP_BIT_AND";
                            break;
                        }
                        case token_type::OP_BIT_NOT: {
                            type = "OP_BIT_NOT";
                            break;
                        }
                        case token_type::OP_BIT_XOR: {
                            type = "OP_BIT_XOR";
                            break;
                        }
                        case token_type::OP_BIT_LSHIFT: {
                            type = "OP_BIT_LSHIFT";
                            break;
                        }
                        case token_type::OP_BIT_RSHIFT: {
                            type = "OP_BIT_RSHIFT";
                            break;
                        }
                        case token_type::OP_LEN: {
                            type = "OP_LEN";
                            break;
                        }
                        case token_type::OP_INDEX: {
                            type = "OP_INDEX";
                            break;
                        }
                        case token_type::OP_INDEX_SYNTACTIC: {
                            type = "OP_INDEX_SYNTACTIC";
                            break;
                        }
                        case token_type::OP_ASSIGN: {
                            type = "OP_ASSIGN";
                            break;
                        }
                        case token_type::OP_ASSIGN_ADD: {
                            type = "OP_ASSIGN_ADD";
                            break;
                        }
                        case token_type::OP_ASSIGN_SUB: {
                            type = "OP_ASSIGN_SUB";
                            break;
                        }
                        case token_type::OP_ASSIGN_MUL: {
                            type = "OP_ASSIGN_MUL";
                            break;
                        }
                        case token_type::OP_ASSIGN_DIV: {
                            type = "OP_ASSIGN_DIV";
                            break;
                        }
                        case token_type::OP_ASSIGN_MOD: {
                            type = "OP_ASSIGN_MOD";
                            break;
                        }
                        case token_type::OP_ASSIGN_POW: {
                            type = "OP_ASSIGN_POW";
                            break;
                        }
                        case token_type::OP_ASSIGN_CONCAT: {
                            type = "OP_ASSIGN_CONCAT";
                            break;
                        }
                        case token_type::PUNC_LPAREN: {
                            type = "PUNC_LPAREN";
                            break;
                        }
                        case token_type::PUNC_RPAREN: {
                            type = "PUNC_RPAREN";
                            break;
                        }
                        case token_type::PUNC_LBRACE: {
                            type = "PUNC_LBRACE";
                            break;
                        }
                        case token_type::PUNC_RBRACE: {
                            type = "PUNC_RBRACE";
                            break;
                        }
                        case token_type::PUNC_LBRACKET: {
                            type = "PUNC_LBRACKET";
                            break;
                        }
                        case token_type::PUNC_RBRACKET: {
                            type = "PUNC_RBRACKET";
                            break;
                        }
                        case token_type::PUNC_VARARGS: {
                            type = "PUNC_VARARGS";
                            break;
                        }
                        case token_type::PUNC_SEMICOLON: {
                            type = "PUNC_SEMICOLON";
                            break;
                        }
                        case token_type::PUNC_COMMA: {
                            type = "PUNC_COMMA";
                            break;
                        }
                        case token_type::PUNC_LABEL: {
                            type = "PUNC_LABEL";
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