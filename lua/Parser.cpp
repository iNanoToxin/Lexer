//
// Created by Dylan Daniel on 10/5/23.
//

#include "Parser.h"

Base::Base(Base::Kind kind) : mKind(kind)
{
}

std::string Base::toString(std::size_t depth) const
{
    return "";
}

template <typename ...T>
auto Base::get(Kind kind) -> Node<T...>*
{
    switch (kind)
    {
        case Kind::binary_operator_expr: {
            return dynamic_cast<Node<int, int>*>(this);
        }
        case Kind::unary_operator_expr: {
            return dynamic_cast<Node<int, int>*>(this);
        }
        case Kind::table_constructor_expr: {
            break;
        }
        case Kind::numeric_literal_expr: {
            break;
        }
        case Kind::boolean_expr: {
            break;
        }
        case Kind::null_expr: {
            break;
        }
        case Kind::string_expr: {
            break;
        }
        case Kind::varargs_expr: {
            break;
        }
        case Kind::identifier_expr: {
            break;
        }
        case Kind::member_expr: {
            break;
        }
        case Kind::method_expr: {
            break;
        }
        case Kind::index_expr: {
            break;
        }
        case Kind::attrib_expr: {
            break;
        }
        case Kind::table_index_value_expr: {
            break;
        }
        case Kind::table_name_value_expr: {
            break;
        }
        case Kind::table_value_expr: {
            break;
        }
        case Kind::attnamelist: {
            break;
        }
        case Kind::return_stat: {
            break;
        }
        case Kind::explist: {
            break;
        }
        case Kind::parlist: {
            break;
        }
        case Kind::varlist: {
            break;
        }
        case Kind::namelist: {
            break;
        }
        case Kind::fieldlist: {
            break;
        }
        case Kind::label: {
            break;
        }
        case Kind::args: {
            break;
        }
        case Kind::funcname: {
            break;
        }
        case Kind::functioncall: {
            break;
        }
        case Kind::funcbody: {
            break;
        }
        case Kind::semicolon: {
            break;
        }
        case Kind::block: {
            break;
        }
        case Kind::functiondef: {
            break;
        }
        case Kind::block_conditional: {
            break;
        }
        case Kind::assignment_stat: {
            break;
        }
        case Kind::break_stat: {
            break;
        }
        case Kind::goto_stat: {
            break;
        }
        case Kind::do_stat: {
            break;
        }
        case Kind::while_stat: {
            break;
        }
        case Kind::repeat_stat: {
            break;
        }
        case Kind::if_stat: {
            break;
        }
        case Kind::generic_for_stat: {
            break;
        }
        case Kind::numeric_for_stat: {
            break;
        }
        case Kind::local_stat: {
            break;
        }
    }
    return nullptr;
}
