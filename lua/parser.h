#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include "tokenizer.h"
#include <iostream>
#include <memory>

#pragma region MACROS
    #define SP(A, B) std::string((B) * 4, ' ') + A + "\n"

    #define PRINT_NAME_SPACE(NAME, INSIDE)                  \
    do {                                                    \
        str += SP(NAME + " = {", depth);                    \
        depth++;                                            \
        INSIDE                                              \
        depth--;                                            \
        str += SP("}", depth);                              \
    } while (false)

    #define PRINT_PTR_FIELD(NAME, FIELD)                    \
    do {                                                    \
        if (FIELD != nullptr) {                             \
            str += SP(NAME, depth);                         \
            str.erase(str.end() - 1);                       \
            str += ": <";                                   \
            std::size_t pos = str.size();                   \
            str += FIELD->to_string(depth);                 \
            str.erase(pos, depth * 4);                      \
            while (pos < str.size()) {                      \
                if (str[pos] == ' ') {                      \
                    str.insert(str.begin() + pos, '>');     \
                    break;                                  \
                }                                           \
                pos++;                                      \
            }                                               \
        }                                                   \
        else {                                              \
            str += SP(NAME + " = nullptr", depth);          \
        }                                                   \
    } while (false)

    #define PRINT_FIELD(NAME, FIELD)                        \
    do {                                                    \
        str += SP(NAME + " = " + FIELD, depth);             \
    } while (false)

    #define PRINT_VECTOR_FIELD(NAME, VECTOR_FIELD)          \
    do {                                                    \
        if (!VECTOR_FIELD.empty()) {                        \
            PRINT_NAME_SPACE(NAME, {                        \
                int i = 0;                                  \
                for (auto& field : VECTOR_FIELD) {          \
                    char c = static_cast<char>(++i + '0');  \
                    PRINT_PTR_FIELD("[" + c + "]", field);  \
                }                                           \
            });                                             \
        }                                                   \
        else {                                              \
            str += SP(NAME + " = {}", depth);               \
        }                                                   \
    } while (false)
#pragma endregion

bool is_binop(const token& token) {
    return token.is("+") 
    || token.is("-")
    || token.is("*")
    || token.is("/")
    || token.is("//")
    || token.is("^")
    || token.is("%")
    || token.is("&")
    || token.is("~")
    || token.is("|")
    || token.is(">>")
    || token.is("<<")
    || token.is("..")
    || token.is("<")
    || token.is("<=")
    || token.is(">")
    || token.is(">=")
    || token.is("==")
    || token.is("~=")
    || token.is("and")
    || token.is("or");
}

bool is_fieldsep(const token& token) {
    return token.is(",") || token.is(";");
}

bool is_unop(const token& token) {
    return token.is("-")
    || token.is("not")
    || token.is("#")
    || token.is("~");
}

namespace lua {
    enum class kind {
        CHUNK,
        BLOCK,
        STAT,
        ATTNAMELIST,
        ATTRIB,
        RETSTAT,
        LABEL,
        FUNCNAME,
        VARLIST,
        VAR,
        NAMELIST,
        EXPLIST,
        EXP,
        PREFIXEXP,
        FUNCTIONCALL,
        ARGS,
        FUNCTIONDEF,
        FUNCBODY,
        PARLIST,
        TABLECONSTRUCTOR,
        FIELDLIST,
        FIELD,
        FIELDSEP,
        BINOP,
        UNOP,


        binary_operator_expr,
        unary_operator_expr,
        table_constructor_expr,
    };
}



class base {
public:
    lua::kind kind;
    explicit base(lua::kind kind) : kind(kind) {}
    std::string tostring(std::size_t depth = 0) { return ""; }
};


class binary_operator_expr : public base {
public:
    std::string binary_operator;
    std::unique_ptr<base> lhs;
    std::unique_ptr<base> rhs;

    binary_operator_expr(
        std::string binary_operator,
        std::unique_ptr<base> lhs,
        std::unique_ptr<base> rhs
    ) : base(lua::kind::binary_operator_expr), binary_operator(std::move(binary_operator)), lhs(std::move(lhs)), rhs(std::move(rhs)) {}
};

class unary_operator_expr : public base {
public:
    std::string unary_operator;
    std::unique_ptr<base> exp;

    unary_operator_expr(
        std::string unary_operator,
        std::unique_ptr<base> exp
    ) : base(lua::kind::unary_operator_expr), unary_operator(std::move(unary_operator)), exp(std::move(exp)) {}
};

class table_constructor_expr : public base {
public:
    std::unique_ptr<base> field_list;

    table_constructor_expr(
        std::unique_ptr<base> field_list
    ) : base(lua::kind::table_constructor_expr), field_list(std::move(field_list)) {}
};

#define ADD_CLASS(CLASS_NAME, A, B) \
class CLASS_NAME : public base { \
public: \
    B; \
    CLASS_NAME( \
        B \
    ) : base(A), B(std::move(B)) {} \
};




class parser {
public:
    std::size_t length = 0;
    std::size_t index = 0;
    std::vector<token> tokens;

    void parse(const std::string& source) {
        token_stream stream;
        stream.tokenize(source);
        tokens = stream.tokens;

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
    }

    std::unique_ptr<base> parse_primary() {
        if (!next()) {
            return nullptr;
        }

        switch (peek().type) {
            case token_type::IDENTIFIER: {
                break;
            }
            case token_type::STRING_RAW: {
                break;
            }
            case token_type::STRING: {
                break;
            }
            case token_type::COMMENT_RAW: {
                break;
            }
            case token_type::COMMENT: {
                break;
            }
            case token_type::NUMBER_HEXADECIMAL: {
                break;
            }
            case token_type::NUMBER_BINARY: {
                break;
            }
            case token_type::NUMBER: {
                break;
            }
            case token_type::KEYWORD: {
                break;
            }
            case token_type::PUNCTUATION: {
                break;
            }
        }
        return nullptr;
    }


    bool next(std::size_t offset = 0) const {
        return index + offset < length;
    }

    token peek(std::size_t offset = 0) {
        return tokens.at(index + offset);
    }

    token consume() {
        return tokens.at(index++);
    }

    bool expect_peek(token_type type) {
        return next() && peek().type == type;
    }

    bool expect_peek(std::size_t offset, token_type type) {
        return next(offset) && peek(offset).type == type;
    }
};







#endif