#ifndef LUA_PARSER_TEST_H
#define LUA_PARSER_TEST_H

// #include <cassert>
#include "tokenizer.h"
#include <iostream>
#include <memory>
#include <utility>
#include <tuple>



class base;
using pBaseArray = std::vector<std::shared_ptr<base>>;
using pBase = std::shared_ptr<base>;

class Base
{
public:
    enum class kind
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

    pBase parent = nullptr;
    kind kind;

    explicit Base() = default;

    explicit Base(enum kind kind)
    {
        this->kind = kind;
        this->parent = nullptr;
    }

    explicit Base(enum kind kind, base_ptr parent)
    {
        this->kind = kind;
        this->parent = parent;
    }

    [[nodiscard]] virtual std::string toString(std::size_t depth = 0) const
    {
        return "";
    }
};

using base_ptr_arr = std::vector<std::shared_ptr<base>>;
using base_ptr = std::shared_ptr<base>;


template <typename ...T>
class node : public base {
public:
    std::tuple<T...> children;

    explicit node() = default;
};


int main() {
    using x = node<int, int>;
    using y = node<char, float>;

    auto f = std::make_shared<x>();
    auto g = std::make_shared<y>();

    f->parent = g;

    return 0;
}

#endif