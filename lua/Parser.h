#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include "tokenizer.h"
#include <iostream>
#include <memory>
#include <utility>
#include <tuple>

#include "Node.h"

class Base;
using pBase = std::shared_ptr<Base>;
using pBaseArray = std::vector<pBase>;

class Base
{
public:
    enum class Kind
    {
        binary_operator_expr,
        unary_operator_expr,
        table_constructor_expr,
        numeric_literal_expr,
        boolean_expr,
        null_expr,
        string_expr,
        varargs_expr,
        identifier_expr,
        member_expr,
        method_expr,
        index_expr,
        attrib_expr,
        table_index_value_expr,
        table_name_value_expr,
        table_value_expr,

        attnamelist,
        return_stat,
        explist,
        parlist,
        varlist,
        namelist,
        fieldlist,
        label,
        args,
        funcname,
        functioncall,
        funcbody,

        semicolon,


        block,

        functiondef,


        block_conditional,

        assignment_stat,
        break_stat,
        goto_stat,
        do_stat,
        while_stat,
        repeat_stat,
        if_stat,
        generic_for_stat,
        numeric_for_stat,
        local_stat,
    };

    pBase mParent = nullptr;
    Kind mKind;

    // explicit Base() = default;
    explicit Base(enum Kind kind);

    template <typename ...T>
    auto get(Kind kind) -> Node<T...>*;

    virtual std::string toString(std::size_t depth = 0) const;
};


class Parser {
    std::size_t m_index = 0;
    std::size_t m_length = 0;
    std::vector<token> m_tokens;



    auto get_primary() {
        if (!next())
        {
            return nullptr;
        }

        token curr_token = peek();

        switch (curr_token.type)
        {
            case token_type::IDENTIFIER:
            {
                Node<std::string>(5, consume().literal);
                return nullptr;
            }
            case token_type::STRING_RAW:
            case token_type::STRING:
            {
                return std::make_shared<string_expr>(consume().literal);
            }
            case token_type::COMMENT_RAW:
            {
                break;
            }
            case token_type::COMMENT:
            {
                break;
            }
            case token_type::NUMBER_HEXADECIMAL:
            case token_type::NUMBER_BINARY:
            case token_type::NUMBER:
            {
                return std::make_shared<numeric_literal_expr>(consume().literal);
            }
            case token_type::KEYWORD:
            {
                if (is_boolean(curr_token))
                {
                    return std::make_shared<boolean_expr>(consume().literal);
                }
                else if (is_unop(curr_token))
                {
                    consume();
                    auto expr = parse_next(get_precedence(curr_token, true));
                    assert(expr, "expected expression after " + curr_token.literal);
                    return std::make_shared<unary_operator_expr>(curr_token.literal, std::move(expr));
                }
                else if (is_null(curr_token))
                {
                    return std::make_shared<null_expr>(consume().literal);
                }
                break;
            }
            case token_type::PUNCTUATION:
            {
                if (curr_token.is("..."))
                {
                    return std::make_shared<varargs_expr>(consume().literal);
                }
                else if (curr_token.is("("))
                {
                    consume();

                    auto expr = parse_next();
                    assert(expr, "expected expression");

                    assert(expect_peek(")"), "expected ) after (");
                    consume();

                    return expr;
                }
                else if (curr_token.is("{"))
                {
                    return get_table_contructor();
                }
                else if (curr_token.is("..."))
                {
                    return std::make_shared<varargs_expr>(consume().literal);
                }
                else if (is_unop(curr_token))
                {
                    consume();
                    auto expr = parse_next(get_precedence(curr_token, true));
                    assert(expr, "expected expression after " + curr_token.literal);
                    return std::make_shared<unary_operator_expr>(curr_token.literal, std::move(expr));
                }
                break;
            }
        }
        return nullptr;
    }

    bool next(std::size_t offset = 0) const;
    token peek(std::size_t offset = 0);
    std::size_t mark() const;
    token consume();
    void revert(std::size_t marked);
    bool expect_peek(token_type type, std::size_t offset = 0);
    bool expect_peek(const std::string& match, std::size_t offset = 0);
};


#endif //LUA_PARSER_H
