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

    explicit Base() = default;
    explicit Base(enum Kind kind);

    template <typename ...T>
    auto get(Kind kind) -> Node<T...>*;

    virtual std::string toString(std::size_t depth = 0) const;
};


class Parser {
    std::size_t index = 0;
    std::size_t length = 0;
    std::vector<tokens>

    bool next(std::size_t offset = 0) const
    {
        return index + offset < length;
    }

    token peek(std::size_t offset = 0)
    {
        return tokens.at(index + offset);
    }

    std::size_t mark()
    {
        return index;
    }

    token consume()
    {
        return tokens.at(index++);
    }

    void revert(std::size_t marked)
    {
        index = marked;
    }

    bool expect_peek(token_type type, std::size_t offset = 0)
    {
        return next(offset) && peek(offset).type == type;
    }

    bool expect_peek(const std::string& match, std::size_t offset = 0)
    {
        return next(offset) && peek(offset).literal == match;
    }
};


#endif //LUA_PARSER_H
