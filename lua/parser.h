#ifndef LUA_PARSER_H
#define LUA_PARSER_H

// #include <cassert>
#include "tokenizer.h"
#include <iostream>
#include <memory>

#pragma region MACROS
    #define COUT(A) std::cout << A << std::endl
    #define SP(A, B) std::string((B) * 2, ' ') + A + "\n"

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
            str += FIELD->tostring(depth);                  \
            str.erase(pos, depth * 2);                      \
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
                    std::string idx;                        \
                    idx += "[";                             \
                    idx += std::to_string(++i);             \
                    idx += "]";                             \
                    PRINT_PTR_FIELD(idx.c_str(), field);    \
                }                                           \
            });                                             \
        }                                                   \
        else {                                              \
            str += SP(NAME + " = {}", depth);               \
        }                                                   \
    } while (false)

    #define TOSTRING(BODY) \
    [[nodiscard]] std::string tostring(std::size_t depth) const override { \
        std::string str;   \
        BODY               \
        return str;        \
    }

    template <typename T>
    void HELPER_PRINT(const std::string& name, std::shared_ptr<T> field, std::string& str, std::size_t depth) {
        PRINT_PTR_FIELD(name, field);
    }

    template <typename T>
    void HELPER_PRINT(const std::string& name, std::vector<std::shared_ptr<T>> fields, std::string& str, std::size_t depth) {
        PRINT_VECTOR_FIELD(name, fields);
    }

    template <typename T>
    void HELPER_PRINT(const std::string& name, T field, std::string& str, std::size_t depth) {
        PRINT_FIELD(name, field);
    }
#pragma endregion

#pragma region MACROS_2
    #define CREATE_CLASS_1(CLASS_NAME, TYPE_1, FIELD_NAME_1)           \
    class CLASS_NAME : public base {                                   \
    public:                                                            \
        TYPE_1 FIELD_NAME_1;                                           \
                                                                       \
        explicit CLASS_NAME(                                           \
            TYPE_1 FIELD_NAME_1                                        \
        ) :                                                            \
            base(kind::CLASS_NAME),                                    \
            FIELD_NAME_1(std::move(FIELD_NAME_1))                      \
        {}                                                             \
                                                                       \
        std::string tostring(std::size_t depth) const {                \
            std::string str;                                           \
            PRINT_NAME_SPACE(#CLASS_NAME, {                            \
                HELPER_PRINT(#FIELD_NAME_1, FIELD_NAME_1, str, depth); \
            });                                                        \
            return str;                                                \
        }                                                              \
    };

    #define CREATE_CLASS_2(CLASS_NAME, TYPE_1, FIELD_NAME_1, TYPE_2, FIELD_NAME_2) \
    class CLASS_NAME : public base {                                               \
    public:                                                                        \
        TYPE_1 FIELD_NAME_1;                                                       \
        TYPE_2 FIELD_NAME_2;                                                       \
                                                                                   \
        explicit CLASS_NAME(                                                       \
            TYPE_1 FIELD_NAME_1,                                                   \
            TYPE_2 FIELD_NAME_2                                                    \
        ) :                                                                        \
            base(kind::CLASS_NAME),                                                \
            FIELD_NAME_1(std::move(FIELD_NAME_1)),                                 \
            FIELD_NAME_2(std::move(FIELD_NAME_2))                                  \
        {}                                                                         \
                                                                                   \
        std::string tostring(std::size_t depth) const {                            \
            std::string str;                                                       \
            PRINT_NAME_SPACE(#CLASS_NAME, {                                        \
                HELPER_PRINT(#FIELD_NAME_1, FIELD_NAME_1, str, depth);             \
                HELPER_PRINT(#FIELD_NAME_2, FIELD_NAME_2, str, depth);             \
            });                                                                    \
            return str;                                                            \
        }                                                                          \
    };

    #define CREATE_CLASS_3(CLASS_NAME, TYPE_1, FIELD_NAME_1, TYPE_2, FIELD_NAME_2, TYPE_3, FIELD_NAME_3) \
    class CLASS_NAME : public base {                                                                     \
    public:                                                                                              \
        TYPE_1 FIELD_NAME_1;                                                                             \
        TYPE_2 FIELD_NAME_2;                                                                             \
        TYPE_3 FIELD_NAME_3;                                                                             \
                                                                                                         \
        explicit CLASS_NAME(                                                                             \
            TYPE_1 FIELD_NAME_1,                                                                         \
            TYPE_2 FIELD_NAME_2,                                                                         \
            TYPE_3 FIELD_NAME_3                                                                          \
        ) :                                                                                              \
            base(kind::CLASS_NAME),                                                                      \
            FIELD_NAME_1(std::move(FIELD_NAME_1)),                                                       \
            FIELD_NAME_2(std::move(FIELD_NAME_2)),                                                       \
            FIELD_NAME_3(std::move(FIELD_NAME_3))                                                        \
        {}                                                                                               \
                                                                                                         \
        std::string tostring(std::size_t depth) const {                                                  \
            std::string str;                                                                             \
            PRINT_NAME_SPACE(#CLASS_NAME, {                                                              \
                HELPER_PRINT(#FIELD_NAME_1, FIELD_NAME_1, str, depth);                                   \
                HELPER_PRINT(#FIELD_NAME_2, FIELD_NAME_2, str, depth);                                   \
                HELPER_PRINT(#FIELD_NAME_3, FIELD_NAME_3, str, depth);                                   \
            });                                                                                          \
            return str;                                                                                  \
        }                                                                                                \
    };

    #define DO_WHILE_CONSUME(CONDITION, BODY) \
    bool can_consume = false;                 \
    do {                                      \
        if (can_consume) {                    \
            consume();                        \
        }                                     \
        BODY                                  \
        can_consume = true;                   \
    } while (CONDITION)
#pragma endregion



#define assert(condition, message)                        \
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

bool is_boolean(const token& token) {
    return token.is("true") || token.is("false");
}

bool is_conditional(const token& token) {
    return token.is("and") || token.is("or");
}

bool is_null(const token& token) {
    return token.is("nil");
}

class base {
public:
    enum class kind {
        binary_operator_expr,
        unary_operator_expr,
        table_constructor_expr,
        numeric_literal_expr,
        conditional_expr,
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
        retstat,
        explist,
        parlist,
        varlist,
        namelist,
        fieldlist,
        label,
        args,
        funcname,
        functioncall,
        prefixexp,
        funcbody,

        semicolon,


        block,

        functiondef,
        functiondef_anon,


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

    kind kind;
    explicit base(enum kind kind) : kind(kind) {}
    [[nodiscard]] virtual std::string tostring(std::size_t depth = 0) const { return ""; }
};

using base_ptr_arr = std::vector<std::shared_ptr<base>>;
using base_ptr = std::shared_ptr<base>;






class semicolon : public base {
public:
    semicolon() : base(kind::semicolon) {}

    TOSTRING({
        str += SP("semicolon = ';'", depth);
    });
};

class numeric_for_stat : public base {
public:
    base_ptr name;
    base_ptr init;
    base_ptr goal;
    base_ptr step;
    base_ptr block;

    numeric_for_stat(
        base_ptr name,
        base_ptr init,
        base_ptr goal,
        base_ptr step,
        base_ptr block
    ) :
        base(kind::numeric_for_stat),
        name(std::move(name)),
        init(std::move(init)),
        goal(std::move(goal)),
        step(std::move(step)),
        block(std::move(block)) {
    }

    TOSTRING({
                 PRINT_NAME_SPACE("numeric_for_stat", {
                     PRINT_PTR_FIELD("name", name);
                     PRINT_PTR_FIELD("init", init);
                     PRINT_PTR_FIELD("goal", goal);
                     PRINT_PTR_FIELD("step", step);
                 });
             })
};

class break_stat : public base {
public:
    break_stat() : base(kind::break_stat) {}

    TOSTRING({
        str += SP("break_stat = 'break'", depth);
    });
};





CREATE_CLASS_1(table_constructor_expr,     base_ptr,      field_list)
CREATE_CLASS_1(  numeric_literal_expr,  std::string,           value)
CREATE_CLASS_1(      conditional_expr,  std::string,     conditional)
CREATE_CLASS_1(          boolean_expr,  std::string,         boolean)
CREATE_CLASS_1(             null_expr,  std::string,           value)
CREATE_CLASS_1(           string_expr,  std::string,           value)
CREATE_CLASS_1(          varargs_expr,  std::string,           value)
CREATE_CLASS_1(       identifier_expr,  std::string,           value)
CREATE_CLASS_1(      table_value_expr,     base_ptr,           value)
CREATE_CLASS_1(           attnamelist, base_ptr_arr,           value)
CREATE_CLASS_1(              namelist, base_ptr_arr,           value)
CREATE_CLASS_1(               explist, base_ptr_arr,           value)
CREATE_CLASS_1(               parlist, base_ptr_arr,           value)
CREATE_CLASS_1(               varlist, base_ptr_arr,           value)
CREATE_CLASS_1(             fieldlist, base_ptr_arr,           value)
CREATE_CLASS_1(               retstat,     base_ptr,           value)
CREATE_CLASS_1(                 label,     base_ptr,           value)
CREATE_CLASS_1(                  args,     base_ptr,           value)
CREATE_CLASS_1(              funcname,     base_ptr,           value)
CREATE_CLASS_1(             goto_stat,     base_ptr,           label)
CREATE_CLASS_1(               do_stat,     base_ptr,           block)
CREATE_CLASS_1(           repeat_stat,     base_ptr,       statement)
CREATE_CLASS_1(            while_stat,     base_ptr,       statement)
CREATE_CLASS_1(               if_stat, base_ptr_arr,      statements)
CREATE_CLASS_1(            local_stat,     base_ptr,     declaration)
CREATE_CLASS_1(                 block, base_ptr_arr,      statements)
CREATE_CLASS_1(      functiondef_anon,     base_ptr,            body)

CREATE_CLASS_2(              funcbody,     base_ptr,      parameters, base_ptr,     block)
CREATE_CLASS_2(       assignment_stat,     base_ptr,             lhs, base_ptr,       rhs)
CREATE_CLASS_2(     block_conditional,     base_ptr,       condition, base_ptr,     block)
CREATE_CLASS_2(           functiondef,     base_ptr,            name, base_ptr,      body)
CREATE_CLASS_2(   unary_operator_expr,  std::string,  unary_operator, base_ptr,      expr)
CREATE_CLASS_2(           attrib_expr,     base_ptr,            name, base_ptr,    attrib)
CREATE_CLASS_2(table_index_value_expr,     base_ptr,           index, base_ptr,     value)
CREATE_CLASS_2( table_name_value_expr,     base_ptr,           index, base_ptr,     value)
CREATE_CLASS_2(           member_expr,     base_ptr,            root, base_ptr,     index)
CREATE_CLASS_2(           method_expr,     base_ptr,            root, base_ptr,     index)
CREATE_CLASS_2(            index_expr,     base_ptr,            root, base_ptr,     index)
CREATE_CLASS_2(          functioncall,     base_ptr,            root, base_ptr,      args)

CREATE_CLASS_3(  binary_operator_expr,  std::string, binary_operator, base_ptr,       lhs, base_ptr,   rhs)
CREATE_CLASS_3(      generic_for_stat,     base_ptr,       name_list, base_ptr, expr_list, base_ptr, block)








class parser {
public:
    std::size_t length = 0;
    std::size_t index = 0;
    std::vector<token> tokens;


    base_ptr get_name() {
        return expect_peek(token_type::IDENTIFIER) ? parse_primary() : nullptr;
    }

    base_ptr get_attrib() {
        auto name = get_name();

        if (!name) {
            return nullptr;
        }

        if (expect_peek("<")) {
            consume();

            auto attribute = get_name();

            assert(attribute, "expected attribute");
            assert(expect_peek(">"), "expected > after < in attrib");
            consume();

            return std::make_unique<attrib_expr>(std::move(name), std::move(attribute));
        }
        return name;
    }

    base_ptr get_attnamelist() {
        base_ptr_arr list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            auto attribute = get_attrib();

            if (!attribute && first) {
                return nullptr;
            }
            assert(attribute, "expected attrib");

            list.push_back(std::move(attribute));
            first = false;
        });

        return std::make_unique<attnamelist>(std::move(list));
    }

    base_ptr get_explist() {
        base_ptr_arr list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            auto expr = parse_next();

            if (!expr && first) {
                return nullptr;
            }
            assert(expr, "expression expected");

            list.push_back(std::move(expr));
            first = false;
        });

        return std::make_unique<explist>(std::move(list));
    }

    base_ptr get_retstat() {
        if (!expect_peek("return")) {
            return nullptr;
        }
        consume();

        auto explist = get_explist();

        if (expect_peek(";")) {
            consume();
        }

        return std::make_unique<retstat>(std::move(explist));
    }

    base_ptr get_funcname() {
        base_ptr root = nullptr;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek("."), {
            auto name = get_name();

            if (!name && first) {
                return nullptr;
            }
            assert(name, "expected name for function");

            if (first) {
                root = std::move(name);
            }
            else {
                root = std::make_unique<member_expr>(std::move(root), std::move(name));
            }
            first = false;
        });

        if (expect_peek(":")) {
            consume();
            auto name = get_name();

            assert(name, "expected name for method");

            root = std::make_unique<method_expr>(std::move(root), std::move(name));
        }

        return std::make_unique<funcname>(std::move(root));
    }

    base_ptr get_namelist(bool include_varargs = false) {
        base_ptr_arr list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            if (include_varargs && expect_peek("...")) {
                list.push_back(parse_primary());
                break;
            }

            auto name = get_name();

            if (!name && first) {
                return nullptr;
            }
            assert(name, "expected name");

            list.push_back(std::move(name));
            first = false;
        });

        if (include_varargs) {
            return std::make_unique<parlist>(std::move(list));
        }
        return std::make_unique<namelist>(std::move(list));
    }

    base_ptr get_parlist() {
        return get_namelist(true);
    }

    base_ptr get_field() {
        if (expect_peek("[")) {
            consume();

            auto expr = parse_next();

            assert(expr, "expected index in field");

            assert(expect_peek("]"), "expected ] after [ in field");
            consume();
            assert(expect_peek("="), "expected = after ] in field");
            consume();

            auto value = parse_next();

            assert(value, "expected value in field");

            return std::make_unique<table_index_value_expr>(std::move(expr), std::move(value));
        }
        else if (expect_peek(token_type::IDENTIFIER) && expect_peek("=", 1)) {
            auto name = get_name();

            assert(expect_peek("="), "expected = after name in field");
            consume();

            auto value = parse_next();
            assert(value, "expected value in field");

            return std::make_unique<table_name_value_expr>(std::move(name), std::move(value));
        }
        else if (auto expr = parse_next()) {
            return std::make_unique<table_value_expr>(std::move(expr));
        }
        return nullptr;
    }

    base_ptr get_fieldlist() {
        base_ptr_arr list;

        while (auto field = get_field()) {
            list.push_back(std::move(field));

            if (expect_peek(",") || expect_peek(";")) {
                consume();
            }
        }

        if (list.empty()) {
            return nullptr;
        }
        return std::make_unique<fieldlist>(std::move(list));
    }

    base_ptr get_args() {
        if (expect_peek("(")) {
            consume();

            auto expr_list = get_explist();

            assert(expect_peek(")"), "expected ) after ( in args");
            consume();
            return std::make_unique<args>(std::move(expr_list));
        }
        else if (expect_peek(token_type::STRING) || expect_peek(token_type::STRING_RAW)) {
            return std::make_unique<args>(parse_primary());
        }
        else if (auto table_constructor = get_table_contructor()) {
            return std::make_unique<args>(std::move(table_constructor));
        }
        return nullptr;
    }

    base_ptr get_table_contructor() {
        if (!expect_peek("{")) {
            return nullptr;
        }
        consume();

        auto fieldlist = get_fieldlist();

        assert(expect_peek("}"), "expected } after { in table constructor");
        consume();

        return std::make_unique<table_constructor_expr>(std::move(fieldlist));
    }

    base_ptr get_var(bool is_prefix_expr = false) {
        base_ptr root = nullptr;
        bool is_valid_var = true;
        auto marked = mark();

        while (true) {
            if (!root) {
                if (auto name = get_name()) {
                    root = std::move(name);
                    is_valid_var = true;
                }
                else if (expect_peek("(")) {
                    consume();

                    root = parse_next();
                    assert(root, "expected expression in var");

                    assert(expect_peek(")"), "expected ) after ( in var");
                    consume();
                    is_valid_var = false;
                }
                else {
                    break;
                }
            }
            else if (expect_peek("[")) {
                consume();

                auto expr = parse_next();
                assert(expr, "expected expression in var");

                assert(expect_peek("]"), "expected ] after [ in var");
                consume();

                root = std::make_unique<index_expr>(std::move(root), std::move(expr));
                is_valid_var = true;
            }
            else if (expect_peek(".")) {
                consume();

                auto name = get_name();
                assert(name, "expected name in var");

                root = std::make_unique<member_expr>(std::move(root), std::move(name));
                is_valid_var = true;
            }
            else if (expect_peek(":")) {
                consume();

                auto name = get_name();
                assert(name, "expected name in var");

                root = std::make_unique<method_expr>(std::move(root), std::move(name));

                auto args = get_args();
                assert(args, "expected args in var");

                root = std::make_unique<functioncall>(std::move(root), std::move(args));
                is_valid_var = false;
            }
            else if (auto args = get_args()) {
                root = std::make_unique<functioncall>(std::move(root), std::move(args));
                is_valid_var = false;
            }
            else {
                break;
            }
        }

        if (!is_prefix_expr and !is_valid_var) {
            revert(marked);
            COUT("REVERTED");
            return nullptr;
        }
        return std::move(root);
    }

    base_ptr get_prefixexp() {
        return get_var(true);
    }

    base_ptr get_functioncall() {
        auto marked = mark();
        auto expr = get_prefixexp();

        if (!expr || expr->kind != base::kind::functioncall) {
            revert(marked);
            return nullptr;
        }
        return expr;
    }

    base_ptr get_varlist() {
        base_ptr_arr list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            auto expr = get_var();

            if (!expr && first) {
                return nullptr;
            }
            assert(expr, "expression expected in var list");

            list.push_back(std::move(expr));
            first = false;
        });

        return std::make_unique<varlist>(std::move(list));
    }

    base_ptr get_funcbody() {
        if (!expect_peek("(")) {
            return nullptr;
        }
        consume();

        auto par_list = get_parlist();

        assert(expect_peek(")"), "expected ) after ( in funcbody");
        consume();

        auto block = get_block();

        assert(expect_peek("end"), "expected end in funcbody");
        consume();

        return std::make_unique<funcbody>(std::move(par_list), std::move(block));
    }

    base_ptr get_functiondef() {
        if (!expect_peek("function")) {
            return nullptr;
        }
        consume();

        auto function_body = get_funcbody();

        assert(function_body, "expected function body in function definition");
        return std::make_unique<functiondef_anon>(std::move(function_body));
    }

    base_ptr get_stat() {
        if (expect_peek(";")) {
            consume();
            return std::make_unique<semicolon>();
        }
        else if (expect_peek("break")) {
            consume();
            return std::make_unique<break_stat>();
        }
        else if (expect_peek("if")) {
            base_ptr_arr list;
            consume();

            auto expr = parse_next();
            assert(expr, "expected expression in if stat");

            assert(expect_peek("then"), "expected then in if stat");
            consume();

            auto block = get_block();

            list.push_back(std::make_unique<block_conditional>(std::move(expr), std::move(block)));

            while (expect_peek("elseif")) {
                consume();

                expr = parse_next();
                assert(expr, "expected expression in elseif stat");

                assert(expect_peek("then"), "expected then in elseif stat");
                consume();

                block = get_block();

                list.push_back(std::make_unique<block_conditional>(std::move(expr), std::move(block)));
            }

            if (expect_peek("else")) {
                consume();

                block = get_block();

                list.push_back(std::make_unique<block_conditional>(nullptr, std::move(block)));
            }

            assert(expect_peek("end"), "expected end after if stat");
            consume();

            return std::make_unique<if_stat>(std::move(list));
        }
        else if (expect_peek("while")) {
            consume();

            auto expr = parse_next();
            assert(expr, "expected expression in while stat");

            assert(expect_peek("do"), "expected do in while stat");
            consume();

            auto block = get_block();

            assert(expect_peek("end"), "expected end in while stat");
            consume();
            return std::make_unique<while_stat>(std::make_unique<block_conditional>(std::move(expr), std::move(block)));
        }
        else if (expect_peek("repeat")) {
            consume();

            auto block = get_block();

            assert(expect_peek("until"), "expected until in repeat stat");
            consume();

            auto expr = parse_next();
            assert(expr, "expected expression in repeat stat");

            return std::make_unique<repeat_stat>(std::make_unique<block_conditional>(std::move(expr), std::move(block)));
        }
        else if (expect_peek("do")) {
            consume();

            auto block = get_block();

            assert(expect_peek("end"), "expected end in do stat");
            consume();
            return std::make_unique<do_stat>(std::make_unique<block_conditional>(nullptr, std::move(block)));
        }
        else if (expect_peek("local")) {
            consume();

            if (expect_peek("function")) {
                consume();

                auto name = get_name();
                assert(name, "expected name in local function");

                auto body = get_funcbody();
                assert(body, "expected function body in local function");

                return std::make_unique<local_stat>(std::make_unique<functiondef>(std::move(name), std::move(body)));
            }
            else {
                auto attribute_name_list = get_attnamelist();
                assert(attribute_name_list, "expected attribute name list in local stat");

                if (expect_peek("=")) {
                    consume();

                    auto expr_list = get_explist();
                    assert(expr_list, "expected expression list in local stat");

                    return std::make_unique<local_stat>(std::make_unique<assignment_stat>(std::move(attribute_name_list), std::move(expr_list)));
                }


                return std::make_unique<local_stat>(std::move(attribute_name_list));
            }
        }
        else if (expect_peek("function")) {
            consume();

            auto name = get_funcname();
            assert(name, "expected name in function");

            auto body = get_funcbody();
            assert(body, "expected function body in function");

            return std::make_unique<functiondef>(std::move(name), std::move(body));
        }
        else if (expect_peek("for")) {
            consume();

            if (expect_peek("=", 1)) {
                auto name = get_name();
                assert(name, "expected name in numeric for stat");

                assert(expect_peek("="), "expected = in numeric for stat");
                consume();

                auto init = parse_next();
                assert(init, "expected expression in numeric for stat");

                assert(expect_peek(","), "expected , in numeric for stat");
                consume();

                auto goal = parse_next();
                assert(goal, "expected expression in numeric for stat");

                base_ptr step = nullptr;

                if (expect_peek(",")) {
                    consume();

                    step = parse_next();
                    assert(step, "expected expression in numeric for stat");
                }

                auto block = get_block();

                return std::make_unique<numeric_for_stat>(std::move(name), std::move(init), std::move(goal), std::move(step), std::move(block));
            }
            else {
                auto name_list = get_namelist();
                assert(name_list, "expected name list in generic for loop");

                assert(expect_peek("in"), "expected in after for in generic for stat");
                consume();

                auto expr_list = get_explist();
                assert(expr_list, "expected expression list in generic for stat");

                assert(expect_peek("do"), "expected do in generic for stat");
                consume();

                auto block = get_block();

                assert(expect_peek("end"), "expected end in generic for stat");
                consume();

                return std::make_unique<generic_for_stat>(std::move(name_list), std::move(expr_list), std::move(block));
            }
        }
        else if (expect_peek("goto")) {
            consume();

            auto name = get_name();
            assert(name, "expected name in goto stat");

            return std::make_unique<goto_stat>(std::move(name));
        }
        else if (expect_peek("::")) {
            consume();

            auto name = get_name();
            assert(name, "expected name in label");

            assert(expect_peek("::"), "expected :: after :: in label");
            consume();

            return std::make_unique<label>(std::move(name));
        }

        if (auto var_list = get_varlist()) {
            assert(expect_peek("="), "expected = in assignment stat");
            consume();

            auto expr_list = get_explist();
            assert(expr_list, "expected expression list in assignment stat");

            return std::make_unique<assignment_stat>(std::move(var_list), std::move(expr_list));
        }
        else if (auto function_call = get_functioncall()) {
            return function_call;
        }

        return nullptr;
    }

    base_ptr get_block() {
        base_ptr_arr list;

        while (auto stat = get_stat()) {
            list.push_back(std::move(stat));
        }

        if (auto stat = get_retstat()) {
            list.push_back(std::move(stat));
        }

        if (list.empty()) {
            return nullptr;
        }
        return std::make_unique<block>(std::move(list));
    }










    base_ptr parse(const std::string& source) {
        token_stream stream;
        stream.tokenize(source);
        tokens = stream.tokens;
        length = tokens.size();

        // #define PRINT_TOKENS
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

        std::string path = "../tests/output.lua";
        auto ptr = get_block();
        assert(ptr, "failed to parse");

        // {
        //     std::ofstream file(path);
        //     assert(file.is_open(), "Failed to open the file.");
        //     file << ptr->tostring();
        //     file.close();
        // }
        // COUT(ptr->tostring());
        return ptr;
    }

    int get_precedence(const token& token, bool is_unop = false) {
        static const std::vector<std::vector<std::string>> priority = {
            {"or"},
            {"and"},
            {"<", ">", "<=", ">=", "~=", "=="},
            {"|"},
            {"~"},
            {"&"},
            {"<<", ">>"},
            {".."},
            {"+", "-"},
            {"*", "/", "//", "%"},
            {"not", "#", "-", "~"},
            {"^"}
        };

        if (is_unop) {
            return priority.size() - 1;
        }

        for (int i = 0; i < priority.size(); i++) {
            for (auto& e : priority[i]) {
                if (token.is(e)) {
                    return i + 1;
                }
            }
        }
        return -1;
    }

    base_ptr parse_primary() {
        if (!next()) {
            return nullptr;
        }

        token curr_token = peek();

        switch (curr_token.type) {
            case token_type::IDENTIFIER: {
                return std::make_unique<identifier_expr>(consume().literal);
            }
            case token_type::STRING_RAW:
            case token_type::STRING: {
                return std::make_unique<string_expr>(consume().literal);
            }
            case token_type::COMMENT_RAW: {
                break;
            }
            case token_type::COMMENT: {
                break;
            }
            case token_type::NUMBER_HEXADECIMAL:
            case token_type::NUMBER_BINARY:
            case token_type::NUMBER: {
                return std::make_unique<numeric_literal_expr>(consume().literal);
            }
            case token_type::KEYWORD: {
                if (is_conditional(curr_token)) {
                    return std::make_unique<conditional_expr>(consume().literal);
                }
                else if (is_boolean(curr_token)) {
                    return std::make_unique<boolean_expr>(consume().literal);
                }
                else if (is_unop(curr_token)) {
                    consume();
                    auto expr = parse_next(get_precedence(curr_token, true));
                    assert(expr, "expected expression after " + curr_token.literal);
                    return std::make_unique<unary_operator_expr>(curr_token.literal, std::move(expr));
                }
                else if (is_null(curr_token)) {
                    return std::make_unique<null_expr>(consume().literal);
                }
                break;
            }
            case token_type::PUNCTUATION: {
                if (curr_token.is("...")) {
                    return std::make_unique<varargs_expr>(consume().literal);
                }
                else if (curr_token.is("(")) {
                    consume();

                    auto expr = parse_next();
                    assert(expr, "expected expression");

                    assert(expect_peek(")"), "expected ) after (");
                    consume();

                    return expr;
                }
                else if (curr_token.is("{")) {
                    return get_table_contructor();
                }
                else if (curr_token.is("...")) {
                    return std::make_unique<varargs_expr>(consume().literal);
                }
                else if (is_unop(curr_token)) {
                    consume();
                    auto expr = parse_next(get_precedence(curr_token, true));
                    assert(expr, "expected expression after " + curr_token.literal);
                    return std::make_unique<unary_operator_expr>(curr_token.literal, std::move(expr));
                }
                break;
            }
        }
        return nullptr;
    }

    base_ptr parse_rhs(int min_precedence, base_ptr lhs) {
        while (next()) {
            token curr_token = peek();
            int curr_precedence = get_precedence(curr_token);

            if (curr_precedence < min_precedence) {
                return lhs;
            }

            consume();

            base_ptr rhs = nullptr;

            if (!rhs) {
                rhs = get_functiondef();
            }
            if (!rhs) {
                rhs = get_prefixexp();
            }
            if (!rhs) {
                rhs = parse_primary();
            }

            if (rhs == nullptr) {
                return rhs;
            }

            if (next()) {
                int next_precedence = get_precedence(peek());
                if (curr_precedence < next_precedence) {
                    rhs = parse_rhs(curr_precedence + 1, std::move(rhs));
                    if (rhs == nullptr) {
                        return rhs;
                    }
                }
            }

            if (is_binop(curr_token)) {
                lhs = std::make_unique<binary_operator_expr>(curr_token.literal, std::move(lhs), std::move(rhs));
            }
        }
        return lhs;
    }

    base_ptr parse_next(int precedence = 0) {
        if (auto lhs_expr = get_functiondef()) {
            return parse_rhs(precedence, std::move(lhs_expr));
        }

        if (auto lhs_expr = get_prefixexp()) {
            return parse_rhs(precedence, std::move(lhs_expr));
        }

        if (auto lhs_expr = parse_primary()) {
            return parse_rhs(precedence, std::move(lhs_expr));
        }
        return nullptr;
    }

    bool next(std::size_t offset = 0) const {
        return index + offset < length;
    }

    token peek(std::size_t offset = 0) {
        return tokens.at(index + offset);
    }

    std::size_t mark() {
        return index;
    }

    token consume() {
        return tokens.at(index++);
    }

    void revert(std::size_t marked) {
        index = marked;
    }

    bool expect_peek(token_type type, std::size_t offset = 0) {
        return next(offset) && peek(offset).type == type;
    }

    bool expect_peek(const std::string& match, std::size_t offset = 0) {
        return next(offset) && peek(offset).literal == match;
    }
};






#endif