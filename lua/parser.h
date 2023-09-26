// #pragma clang diagnostic push
// #pragma ide diagnostic ignored "OCDFAInspection"

#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include "tokenizer.h"
#include <iostream>
#include <memory>

#pragma region MACROS
    #define COUT(A) std::cout << A << std::endl
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
            str += FIELD->tostring(depth);                  \
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
    #define BASE_TYPE_CLASS(CLASS_NAME, TYPE, FIELD_NAME) \
    class CLASS_NAME : public base {                      \
    public:                                               \
        TYPE FIELD_NAME;                                  \
        explicit CLASS_NAME(TYPE FIELD_NAME) :            \
        base(kind::CLASS_NAME),                           \
        FIELD_NAME(std::move(FIELD_NAME)) {}              \
        std::string tostring(std::size_t depth) const override; \
    };

    #define BASE_TYPE_TOSTRING(CLASS_NAME, FIELD_NAME) \
    std::string CLASS_NAME::tostring(std::size_t depth) const { \
        std::string str;                               \
        PRINT_NAME_SPACE(#CLASS_NAME, {                \
            HELPER_PRINT(#FIELD_NAME, FIELD_NAME, str, depth);  \
        });                                            \
        return str;                                    \
    }

    #define BASE_TYPE_CLASS_2(CLASS_NAME, TYPE_1, FIELD_NAME_1, TYPE_2, FIELD_NAME_2) \
    class CLASS_NAME : public base {                                                  \
    public:                                                                           \
        TYPE_1 FIELD_NAME_1;                                                          \
        TYPE_2 FIELD_NAME_2;                                                          \
        explicit CLASS_NAME(                                                          \
            TYPE_1 FIELD_NAME_1,                                                      \
            TYPE_2 FIELD_NAME_2                                                       \
        ) :                                                                           \
            base(kind::CLASS_NAME),                                                   \
            FIELD_NAME_1(std::move(FIELD_NAME_1)),                                    \
            FIELD_NAME_2(std::move(FIELD_NAME_2)) {}                                  \
                                                                                      \
        std::string tostring(std::size_t depth) const override;                       \
    };

    #define BASE_TYPE_TOSTRING_2(CLASS_NAME, FIELD_NAME_1, FIELD_NAME_2) \
    std::string CLASS_NAME::tostring(std::size_t depth) const {          \
        std::string str;                                                 \
        PRINT_NAME_SPACE(#CLASS_NAME, {                                  \
            HELPER_PRINT(#FIELD_NAME_1, FIELD_NAME_1, str, depth);       \
            HELPER_PRINT(#FIELD_NAME_2, FIELD_NAME_2, str, depth);       \
        });                                                              \
        return str;                                                      \
    }

    #define RETURN_UNOP(TOKEN) \
    do {                       \
        consume();             \
        if (auto expr = parse_next(get_precedence(TOKEN, true))) { \
            return std::make_unique<unary_operator_expr>(TOKEN.literal, std::move(expr)); \
        }                      \
        throw std::invalid_argument("expected expression after " + TOKEN.literal); \
    } while (false)

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
        var,
        functioncall,
        prefixexp,
        
        
        block,


        block_conditional,

        assignment_stat,
        call_stat,
        label_stat,
        break_stat,
        goto_stat,
        do_stat,
        while_stat,
        repeat_stat,
        if_stat,
        for_stat,
        generic_for_stat,
        function_stat,
        local_stat,
    };

    kind kind;
    explicit base(enum kind kind) : kind(kind) {}
    [[nodiscard]] virtual std::string tostring(std::size_t depth = 0) const { return ""; }
};

class binary_operator_expr : public base {
public:
    std::string binary_operator;
    std::shared_ptr<base> lhs;
    std::shared_ptr<base> rhs;

    binary_operator_expr(
        std::string binary_operator,
        std::shared_ptr<base> lhs,
        std::shared_ptr<base> rhs
    ) :
        base(kind::binary_operator_expr),
        binary_operator(std::move(binary_operator)),
        lhs(std::move(lhs)),
        rhs(std::move(rhs)) {}

    TOSTRING({
        PRINT_NAME_SPACE("binary_operator_expr", {
            PRINT_FIELD("binary_operator", "\'" + binary_operator + "\'");
            PRINT_PTR_FIELD("lhs", lhs);
            PRINT_PTR_FIELD("rhs", rhs);
        });
    })
};

class unary_operator_expr : public base {
public:
    std::string unary_operator;
    std::shared_ptr<base> expr;

    unary_operator_expr(
        std::string unary_operator,
        std::shared_ptr<base> expr
    ) :
        base(kind::unary_operator_expr),
        unary_operator(std::move(unary_operator)),
        expr(std::move(expr)) {}

    TOSTRING({
        PRINT_NAME_SPACE("unary_operator_expr", {
            PRINT_FIELD("unary_operator", "\'" + unary_operator + "\'");
            PRINT_PTR_FIELD("expr", expr);
        });
    })
};

class attrib_expr : public base {
public:
    std::shared_ptr<base> name;
    std::shared_ptr<base> attrib;

    attrib_expr(
            std::shared_ptr<base> name,
            std::shared_ptr<base> attrib
    ) :
        base(kind::attrib_expr),
        name(std::move(name)),
        attrib(std::move(attrib)) {}

    TOSTRING({
         PRINT_NAME_SPACE("attrib_expr", {
             PRINT_PTR_FIELD("name", name);
             PRINT_PTR_FIELD("attrib", attrib);
         });
    })
};

class table_index_value_expr : public base {
public:
    std::shared_ptr<base> index;
    std::shared_ptr<base> value;

    table_index_value_expr(
        std::shared_ptr<base> index,
        std::shared_ptr<base> value
    ) :
        base(kind::table_index_value_expr),
        index(std::move(index)),
        value(std::move(value)) {}

    TOSTRING({
        PRINT_NAME_SPACE("table_index_value_expr", {
            PRINT_PTR_FIELD("index", index);
            PRINT_PTR_FIELD("value", value);
        });
    })
};

class table_name_value_expr : public base {
public:
    std::shared_ptr<base> index;
    std::shared_ptr<base> value;

    table_name_value_expr(
        std::shared_ptr<base> index,
        std::shared_ptr<base> value
    ) :
        base(kind::table_name_value_expr),
        index(std::move(index)),
        value(std::move(value)) {}

    TOSTRING({
        PRINT_NAME_SPACE("table_name_value_expr", {
            PRINT_PTR_FIELD("index", index);
            PRINT_PTR_FIELD("value", value);
        });
    })
};

class member_expr : public base {
public:
    std::shared_ptr<base> root;
    std::shared_ptr<base> index;

    member_expr(
        std::shared_ptr<base> root,
        std::shared_ptr<base> index
    ) :
    base(kind::member_expr),
    root(std::move(root)),
    index(std::move(index)) {}

    TOSTRING({
        PRINT_NAME_SPACE("member_expr", {
            PRINT_PTR_FIELD("root", root);
            PRINT_PTR_FIELD("index", index);
        });
    })
};

class method_expr : public base {
public:
    std::shared_ptr<base> root;
    std::shared_ptr<base> index;

    method_expr(
        std::shared_ptr<base> root,
        std::shared_ptr<base> index
    ) :
        base(kind::method_expr),
        root(std::move(root)),
        index(std::move(index)) {}

    TOSTRING({
        PRINT_NAME_SPACE("method_expr", {
            PRINT_PTR_FIELD("root", root);
            PRINT_PTR_FIELD("index", index);
        });
    })
};

class index_expr : public base {
public:
    std::shared_ptr<base> root;
    std::shared_ptr<base> index;

    index_expr(
        std::shared_ptr<base> root,
        std::shared_ptr<base> index
    ) :
        base(kind::index_expr),
        root(std::move(root)),
        index(std::move(index)) {}

    TOSTRING({
        PRINT_NAME_SPACE("index_expr", {
            PRINT_PTR_FIELD("root", root);
            PRINT_PTR_FIELD("index", index);
        });
    })
};

class functioncall : public base {
public:
    std::shared_ptr<base> root;
    std::shared_ptr<base> args;

    functioncall(
        std::shared_ptr<base> root,
        std::shared_ptr<base> args
    ) :
        base(kind::functioncall),
        root(std::move(root)),
        args(std::move(args)) {}

    TOSTRING({
        PRINT_NAME_SPACE("functioncall", {
            PRINT_PTR_FIELD("root", root);
            PRINT_PTR_FIELD("args", args);
        });
    })
};

BASE_TYPE_CLASS(table_constructor_expr,              std::shared_ptr<base>,  field_list)
BASE_TYPE_CLASS(  numeric_literal_expr,                        std::string,       value)
BASE_TYPE_CLASS(      conditional_expr,                        std::string, conditional)
BASE_TYPE_CLASS(          boolean_expr,                        std::string,     boolean)
BASE_TYPE_CLASS(             null_expr,                        std::string,       value)
BASE_TYPE_CLASS(           string_expr,                        std::string,       value)
BASE_TYPE_CLASS(          varargs_expr,                        std::string,       value)
BASE_TYPE_CLASS(       identifier_expr,                        std::string,       value)
BASE_TYPE_CLASS(      table_value_expr,              std::shared_ptr<base>,       value)

BASE_TYPE_CLASS(           attnamelist, std::vector<std::shared_ptr<base>>,       value)
BASE_TYPE_CLASS(              namelist, std::vector<std::shared_ptr<base>>,       value)
BASE_TYPE_CLASS(               explist, std::vector<std::shared_ptr<base>>,       value)
BASE_TYPE_CLASS(               parlist, std::vector<std::shared_ptr<base>>,       value)
BASE_TYPE_CLASS(               varlist, std::vector<std::shared_ptr<base>>,       value)
BASE_TYPE_CLASS(             fieldlist, std::vector<std::shared_ptr<base>>,       value)
BASE_TYPE_CLASS(               retstat,              std::shared_ptr<base>,       value)
BASE_TYPE_CLASS(                 label,              std::shared_ptr<base>,       value)
BASE_TYPE_CLASS(                  args,              std::shared_ptr<base>,       value)
BASE_TYPE_CLASS(              funcname,              std::shared_ptr<base>,       value)
BASE_TYPE_CLASS(                   var,              std::shared_ptr<base>,       value)

BASE_TYPE_CLASS( label_stat,              std::shared_ptr<base>,       value)
BASE_TYPE_CLASS(  goto_stat,              std::shared_ptr<base>,       label)
BASE_TYPE_CLASS(    do_stat,              std::shared_ptr<base>,       block)
BASE_TYPE_CLASS(repeat_stat,              std::shared_ptr<base>,   statement)
BASE_TYPE_CLASS( while_stat,              std::shared_ptr<base>,   statement)
BASE_TYPE_CLASS(    if_stat, std::vector<std::shared_ptr<base>>,  statements)
BASE_TYPE_CLASS( local_stat,              std::shared_ptr<base>, declaration)
BASE_TYPE_CLASS(      block, std::vector<std::shared_ptr<base>>,  statements)

BASE_TYPE_TOSTRING(table_constructor_expr,  field_list)
BASE_TYPE_TOSTRING(  numeric_literal_expr,       value)
BASE_TYPE_TOSTRING(      conditional_expr, conditional)
BASE_TYPE_TOSTRING(          boolean_expr,     boolean)
BASE_TYPE_TOSTRING(             null_expr,       value)
BASE_TYPE_TOSTRING(           string_expr,       value)
BASE_TYPE_TOSTRING(          varargs_expr,       value)
BASE_TYPE_TOSTRING(       identifier_expr,       value)
BASE_TYPE_TOSTRING(      table_value_expr,       value)

BASE_TYPE_TOSTRING(           attnamelist,       value)
BASE_TYPE_TOSTRING(               explist,       value)
BASE_TYPE_TOSTRING(               parlist,       value)
BASE_TYPE_TOSTRING(               varlist,       value)
BASE_TYPE_TOSTRING(             fieldlist,       value)
BASE_TYPE_TOSTRING(              namelist,       value)
BASE_TYPE_TOSTRING(               retstat,       value)
BASE_TYPE_TOSTRING(                 label,       value)
BASE_TYPE_TOSTRING(                  args,       value)
BASE_TYPE_TOSTRING(                   var,       value)
BASE_TYPE_TOSTRING(              funcname,       value)

BASE_TYPE_TOSTRING( label_stat,       value)
BASE_TYPE_TOSTRING(  goto_stat,       label)
BASE_TYPE_TOSTRING(    do_stat,       block)
BASE_TYPE_TOSTRING(repeat_stat,   statement)
BASE_TYPE_TOSTRING( while_stat,   statement)
BASE_TYPE_TOSTRING(    if_stat,  statements)
BASE_TYPE_TOSTRING( local_stat, declaration)
BASE_TYPE_TOSTRING(      block,  statements)

BASE_TYPE_CLASS_2( assignment_stat, std::shared_ptr<base>,       lhs, std::shared_ptr<base>,   rhs)
BASE_TYPE_CLASS_2(   function_stat, std::shared_ptr<base>,      name, std::shared_ptr<base>,  body)
BASE_TYPE_CLASS_2(block_conditional, std::shared_ptr<base>, condition, std::shared_ptr<base>, block)

BASE_TYPE_TOSTRING_2( assignment_stat,       lhs,   rhs)
BASE_TYPE_TOSTRING_2(   function_stat,      name,  body)
BASE_TYPE_TOSTRING_2(block_conditional, condition, block)


class parser {
public:
    std::size_t length = 0;
    std::size_t index = 0;
    std::vector<token> tokens;


    std::shared_ptr<base> get_name() {
        return expect_peek(token_type::IDENTIFIER) ? parse_primary() : nullptr;
    }

    std::shared_ptr<base> get_attrib() {
        auto name = get_name();

        if (!name) {
            return nullptr;
        }

        if (expect_peek("<")) {
            consume();

            auto attribute = get_name();

            if (!attribute) {
                throw std::invalid_argument("expected attribute");
            }

            if (!expect_peek(">")) {
                throw std::invalid_argument("expected > after < in attrib");
            }
            consume();

            return std::make_unique<attrib_expr>(std::move(name), std::move(attribute));
        }
        return name;
    }

    std::shared_ptr<base> get_attnamelist() {
        std::vector<std::shared_ptr<base>> list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            auto attribute = get_attrib();

            if (!attribute) {
                if (first) {
                    return nullptr;
                }
                throw std::invalid_argument("expected attrib");
            }

            list.push_back(std::move(attribute));
            first = false;
        });

        return std::make_unique<attnamelist>(std::move(list));
    }

    std::shared_ptr<base> get_explist() {
        std::vector<std::shared_ptr<base>> list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            auto expr = parse_next();

            if (!expr) {
                if (first) {
                    return nullptr;
                }
                throw std::invalid_argument("expression expected");
            }

            list.push_back(std::move(expr));
            first = false;
        });

        return std::make_unique<explist>(std::move(list));
    }

    std::shared_ptr<base> get_retstat() {
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

    std::shared_ptr<base> get_label() {
        if (!expect_peek("::")) {
            return nullptr;
        }
        consume();

        auto name = get_name();

        if (!expect_peek("::")) {
            throw std::invalid_argument("expected :: after ::");
        }
        consume();

        return std::make_unique<label>(std::move(name));
    }

    std::shared_ptr<base> get_funcname() {
        std::shared_ptr<base> root = nullptr;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek("."), {
            auto name = get_name();

            if (!name) {
                if (first) {
                    return nullptr;
                }
                throw std::invalid_argument("expected name for function");
            }

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

            if (!name) {
                throw std::invalid_argument("expected name for method");
            }

            root = std::make_unique<method_expr>(std::move(root), std::move(name));
        }

        return std::make_unique<funcname>(std::move(root));
    }

    std::shared_ptr<base> get_namelist(bool include_varargs = false) {
        std::vector<std::shared_ptr<base>> list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            if (include_varargs && expect_peek("...")) {
                list.push_back(parse_primary());
                break;
            }

            auto name = get_name();

            if (!name) {
                if (first) {
                    return nullptr;
                }
                throw std::invalid_argument("expected name");
            }

            list.push_back(std::move(name));
            first = false;
        });

        if (include_varargs) {
            return std::make_unique<parlist>(std::move(list));
        }
        return std::make_unique<namelist>(std::move(list));
    }

    std::shared_ptr<base> get_parlist() {
        return get_namelist(true);
    }

    std::shared_ptr<base> get_field() {
        if (expect_peek("[")) {
            consume();

            auto index = parse_next();

            if (!index) {
                throw std::invalid_argument("expected index in field");
            }

            if (!expect_peek("]")) {
                throw std::invalid_argument("expected ] after [ in field");
            }
            consume();

            if (!expect_peek("=")) {
                throw std::invalid_argument("expected = after ] in field");
            }
            consume();

            auto value = parse_next();

            if (!value) {
                throw std::invalid_argument("expected value in field");
            }

            return std::make_unique<table_index_value_expr>(std::move(index), std::move(value));
        }
        else if (expect_peek(token_type::IDENTIFIER) && expect_peek(1, "=")) {
            auto index = get_name();

            if (!expect_peek("=")) {
                throw std::invalid_argument("expected = after name in field");
            }
            consume();

            auto value = parse_next();

            if (!value) {
                throw std::invalid_argument("expected value in field");
            }

            return std::make_unique<table_name_value_expr>(std::move(index), std::move(value));
        }

        auto expr = parse_next();

        if (!expr) {
            return nullptr;
        }
        return std::make_unique<table_value_expr>(std::move(expr));
    }

    std::shared_ptr<base> get_fieldlist() {
        std::vector<std::shared_ptr<base>> list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(",") || expect_peek(";"), {
            auto field = get_field();

            if (!field) {
                if (first) {
                    return nullptr;
                }
                throw std::invalid_argument("expected field in fieldlist");
            }

            list.push_back(std::move(field));
            first = false;
        });

        return std::make_unique<fieldlist>(std::move(list));
    }

    std::shared_ptr<base> get_args() {
        if (expect_peek("(")) {
            consume();

            auto expr_list = get_explist();

            if (!expect_peek(")")) {
                throw std::invalid_argument("expected ) after ( in args");
            }
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

    std::shared_ptr<base> get_table_contructor() {
        if (!expect_peek("{")) {
            return nullptr;
        }
        consume();

        auto fieldlist = get_fieldlist();

        if (!expect_peek(token_type::PUNCTUATION) || !peek().is("}")) {
            throw std::invalid_argument("expected } after {");
        }
        consume();

        return std::make_unique<table_constructor_expr>(fieldlist);
    }

    std::shared_ptr<base> get_var(bool include_prefix_expr = false) {
        std::shared_ptr<base> root = nullptr;
        auto posn = index;
        bool is_valid_var = true;

        while (true) {
            if (!root) {
                if (auto name = get_name()) {
                    root = std::move(name);
                    is_valid_var = true;
                }
                else if (expect_peek("(")) {
                    consume();

                    root = parse_next();

                    if (!root) {
                        throw std::invalid_argument("expected expression in var");
                    }

                    if (!expect_peek(")")) {
                        throw std::invalid_argument("expected ) after ( in var");
                    }
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

                if (!expr) {
                    throw std::invalid_argument("expected expression in var");
                }

                if (!expect_peek("]")) {
                    throw std::invalid_argument("expected ] after [ in var");
                }
                consume();

                root = std::make_unique<index_expr>(std::move(root), std::move(expr));
                is_valid_var = true;
            }
            else if (expect_peek(".")) {
                consume();

                auto name = get_name();

                if (!name) {
                    throw std::invalid_argument("expected name in var");
                }

                root = std::make_unique<member_expr>(std::move(root), std::move(name));
                is_valid_var = true;
            }
            else if (expect_peek(":")) {
                consume();

                auto name = get_name();

                if (!name) {
                    throw std::invalid_argument("expected name in var");
                }
                root = std::make_unique<method_expr>(std::move(root), std::move(name));

                auto args = get_args();

                if (!args) {
                    throw std::invalid_argument("expected args in var");
                }
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

        auto diff = index - posn;

        if (!include_prefix_expr and !is_valid_var) {
            revert(diff);
            return nullptr;
        }

        COUT("VALID: " << is_valid_var);
        return std::move(root);
    }

    std::shared_ptr<base> get_prefixexp() {
        return get_var(true);
    }

    std::shared_ptr<base> get_functioncall() {
        auto posn = index;
        auto expr = get_prefixexp();
        auto diff = index - posn;

        COUT("DIFF: " << diff);

        if (!expr || expr->kind != base::kind::functioncall) {
            revert(diff);
            return nullptr;
        }
        return expr;
    }

    std::shared_ptr<base> get_varlist() {
        std::vector<std::shared_ptr<base>> list;

        bool first = true;
        DO_WHILE_CONSUME(expect_peek(","), {
            auto expr = get_var();

            if (!expr) {
                if (first) {
                    return nullptr;
                }
                throw std::invalid_argument("expression expected");
            }

            list.push_back(std::move(expr));
            first = false;
        });

        return std::make_unique<varlist>(std::move(list));
    }
    
    
    std::shared_ptr<base> get_stat() {
        if (expect_peek("if")) {
            std::vector<std::shared_ptr<base>> list;
            consume();
            
            auto expr = parse_next();

            if (!expr) {
                throw std::invalid_argument("expected expression in if stat");
            }
            
            if (!expect_peek("then")) {
                throw std::invalid_argument("expected then in if stat");
            }
            consume();

            auto block = get_block();

            list.push_back(std::make_unique<block_conditional>(std::move(expr), std::move(block)));

            while (expect_peek("elseif")) {
                consume();

                expr = parse_next();

                if (!expr) {
                    throw std::invalid_argument("expected expression in elseif stat");
                }

                if (!expect_peek("then")) {
                    throw std::invalid_argument("expected then in elseif stat");
                }
                consume();

                block = get_block();

                list.push_back(std::make_unique<block_conditional>(std::move(expr), std::move(block)));
            }

            if (expect_peek("else")) {
                consume();

                block = get_block();

                list.push_back(std::make_unique<block_conditional>(nullptr, std::move(block)));
            }

            if (!expect_peek("end")) {
                throw std::invalid_argument("expected end after if stat");
            }
            consume();

            return std::make_unique<if_stat>(std::move(list));
        }
        return nullptr;
    }

    std::shared_ptr<base> get_block() {
        std::vector<std::shared_ptr<base>> list;

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










    void parse(const std::string& source) {
        token_stream stream;
        stream.tokenize(source);
        tokens = stream.tokens;
        length = tokens.size();

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


        // COUT(parse_next()->tostring(0));

        COUT(get_stat()->tostring());
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

    std::shared_ptr<base> parse_primary() {
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
                    RETURN_UNOP(curr_token);
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

                    if (!expect_peek(token_type::PUNCTUATION) || !peek().is(")")) {
                        throw std::invalid_argument("expected ) after (");
                    }
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
                    RETURN_UNOP(curr_token);
                }
                break;
            }
        }

        // throw std::invalid_argument("unknown: " + curr_token.literal);
        return nullptr;
    }

    std::shared_ptr<base> parse_rhs(int min_precedence, std::shared_ptr<base> lhs) {
        while (next()) {
            token curr_token = peek();
            int curr_precedence = get_precedence(curr_token);

            if (curr_precedence < min_precedence) {
                return lhs;
            }

            consume();

            auto rhs = parse_primary();
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

    std::shared_ptr<base> parse_next(int precedence = 0) {
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

    token consume() {
        return tokens.at(index++);
    }

    void revert(std::size_t amount = 0) {
        index -= amount;
    }

    bool expect_peek(token_type type) {
        return next() && peek().type == type;
    }

    bool expect_peek(std::size_t offset, token_type type) {
        return next(offset) && peek(offset).type == type;
    }

    bool expect_peek(const std::string& match) {
        return next() && peek().literal == match;
    }

    bool expect_peek(std::size_t offset, const std::string& match) {
        return next(offset) && peek(offset).literal == match;
    }
};






#endif