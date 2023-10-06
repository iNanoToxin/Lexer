#ifndef LUA_KIND_H
#define LUA_KIND_H

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

    Identifier,
    String,
    Numeric,
    Boolean,
    Unknown,
    UnaryOperator,
    Null,
    Varargs
};

#endif