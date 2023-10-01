#ifndef LUA_GENERATION_H
#define LUA_GENERATION_H

#include <format>
#include <map>
// #include <pair>
#include "parser.h"

#define NEW_LINE "\n"

#define RENAME_VARIABLES

#pragma region MACRO_FUNCTIONS
    #define double_cast(class_1, class_2, var, ptr, field)            \
    do {                                                              \
        if (auto new_ptr = dynamic_cast<class class_1*>(ptr.get())) { \
            var = dynamic_cast<class_2*>(new_ptr->field.get());       \
        }                                                             \
        else {                                                        \
            var = dynamic_cast<class class_2*>(ptr.get());            \
        }                                                             \
    } while (false)
#pragma endregion


class generator {
private:
    std::map<std::string, std::pair<std::size_t, std::string>> memory;
    std::vector<char> variable_chars;
    unsigned int variable_count = 0;

    std::string create_variable(unsigned int id) {
        std::string str = "";

        while(id > 0) {
            id--;
            str = variable_chars[id % variable_chars.size()] + str;
            id /= variable_chars.size();
        }
        return str;
    }

    std::string get_variable(const std::string& variable) {
        if (memory.find(variable) != memory.end()) {
            return memory[variable].second;
        }
        return variable;
    }

    void add_variable(base_ptr name, std::size_t depth) {
        // auto it = memory.begin();
        // while (it != memory.end()) {
        //     if ((*it).second.first > depth) {
        //         variable_count--;
        //         it = memory.erase(it);
        //         // continue;
        //     }
        //     else {
        //         it++;
        //     }
        // }

        COUT("TOSTR: " << depth << " " << tostring(name));
        memory[tostring(name)] = {depth, create_variable(++variable_count)};
    }

    void add_variable(base_ptr_arr ptr_arr, std::size_t depth) {
        for (auto name : ptr_arr) {
            add_variable(name, depth);
        }
    }
public:
    generator() {
        for (int i = 'a'; i < 'z'; i++) {
            variable_chars.push_back(i);
        }
        for (int i = 'A'; i < 'Z'; i++) {
            variable_chars.push_back(i);
        }
    }

    std::string generate(const std::string& source) {
        parser parser;
        auto chunk = parser.parse(source);
        auto generated = tostring(chunk, 0);

        if (!generated.empty() && generated.back() == '\n') {
            generated.pop_back();
        }
        return generated;
    }

    std::string concat(base_ptr_arr array, const std::string& separator, std::size_t depth, bool skip_last = true) {
        std::string merged_string;
        auto it = array.begin();

        while (it != array.end()) {
            merged_string += tostring(*it, depth);
            it++;
            if (!(skip_last && it == array.end())) {
                merged_string += separator;
            }
        }
        return merged_string;
    }

    std::string space(std::size_t depth) {
        return std::string(depth * 4, ' ');
    }

    std::string tostring(const base_ptr& ast, std::size_t depth = 0) {
        if (!ast) {
            return "";
        }

        switch (ast->kind) {
            case base::kind::table_constructor_expr: {
                auto expr = dynamic_cast<table_constructor_expr*>(ast.get());

                if (!expr->field_list) {
                    return "{}";
                }
                return std::format("{{{1}{0}{1}{2}}}", tostring(expr->field_list, depth + 1), NEW_LINE, space(depth));
            }
            case base::kind::binary_operator_expr: {
                auto expr = dynamic_cast<binary_operator_expr*>(ast.get());

                std::string str;

                auto bin_lhs = dynamic_cast<binary_operator_expr*>(expr->lhs.get());
                auto bin_rhs = dynamic_cast<binary_operator_expr*>(expr->rhs.get());

                if (bin_lhs) {
                    str += std::format("({})", tostring(expr->lhs, depth));
                }
                else {
                    str += tostring(expr->lhs, depth);
                }

                str += " " + expr->binary_operator + " ";

                if (bin_rhs) {
                    str += std::format("({})", tostring(expr->rhs, depth));
                }
                else {
                    str += tostring(expr->rhs, depth);
                }

                return str;
            }
            case base::kind::unary_operator_expr: {
                auto expr = dynamic_cast<unary_operator_expr*>(ast.get());
                return expr->unary_operator + (expr->unary_operator == "not" ? " " : "") + tostring(expr->expr, depth);
            }

            case base::kind::numeric_literal_expr: {
                auto expr = dynamic_cast<numeric_literal_expr*>(ast.get());
                return expr->value;
            }
            case base::kind::identifier_expr: {
                auto expr = dynamic_cast<identifier_expr*>(ast.get());
                return get_variable(expr->value);
            }
            case base::kind::boolean_expr: {
                auto expr = dynamic_cast<boolean_expr*>(ast.get());
                return expr->boolean;
            }
            case base::kind::varargs_expr: {
                auto expr = dynamic_cast<varargs_expr*>(ast.get());
                return expr->value;
            }
            case base::kind::string_expr: {
                auto expr = dynamic_cast<string_expr*>(ast.get());
                return expr->value;
            }
            case base::kind::null_expr: {
                auto expr = dynamic_cast<null_expr*>(ast.get());
                return expr->value;
            }

            case base::kind::attrib_expr: {
                auto attribute = dynamic_cast<attrib_expr*>(ast.get());
                return std::format("{0}<{1}>", tostring(attribute->name, depth), tostring(attribute->attrib, depth));
            }
            case base::kind::member_expr: {
                auto expr = dynamic_cast<member_expr*>(ast.get());
                return std::format("{0}.{1}", tostring(expr->root, depth), tostring(expr->index, depth));
            }
            case base::kind::method_expr: {
                auto expr = dynamic_cast<method_expr*>(ast.get());
                return std::format("{0}:{1}", tostring(expr->root, depth), tostring(expr->index, depth));
            }
            case base::kind::index_expr: {
                auto expr = dynamic_cast<index_expr*>(ast.get());
                return std::format("{0}[{1}]", tostring(expr->root, depth), tostring(expr->index, depth));
            }

            case base::kind::table_index_value_expr: {
                auto expr = dynamic_cast<table_index_value_expr*>(ast.get());
                return std::format("{2}[{0}] = {1}", tostring(expr->index, depth), tostring(expr->value, depth), space(depth));
            }
            case base::kind::table_name_value_expr: {
                auto expr = dynamic_cast<table_name_value_expr*>(ast.get());
                return std::format("{2}{0} = {1}", tostring(expr->index, depth), tostring(expr->value, depth), space(depth));
            }
            case base::kind::table_value_expr: {
                auto expr = dynamic_cast<table_value_expr*>(ast.get());
                return std::format("{1}{0}", tostring(expr->value, depth), space(depth));
            }

            case base::kind::attnamelist: {
                auto list = dynamic_cast<attnamelist*>(ast.get());
                return concat(list->value, ", ", depth);
            }
            case base::kind::retstat: {
                auto stat = dynamic_cast<retstat*>(ast.get());
                return std::format("return {0}", tostring(stat->value, depth));
            }
            case base::kind::explist: {
                auto list = dynamic_cast<explist*>(ast.get());
                return concat(list->value, ", ", depth);
            }
            case base::kind::parlist: {
                auto list = dynamic_cast<parlist*>(ast.get());
                return concat(list->value, ", ", depth);
            }
            case base::kind::varlist: {
                auto list = dynamic_cast<class varlist*>(ast.get());
                return concat(list->value, ", ", depth);
            }
            case base::kind::namelist: {
                auto list = dynamic_cast<namelist*>(ast.get());
                return concat(list->value, ", ", depth);
            }
            case base::kind::fieldlist: {
                auto list = dynamic_cast<fieldlist*>(ast.get());
                return concat(list->value, ",\n", depth);
            }

            case base::kind::functioncall: {
                auto call = dynamic_cast<functioncall*>(ast.get());
                return tostring(call->root, depth) + tostring(call->args, depth);
            }
            case base::kind::functiondef: {
                auto func = dynamic_cast<functiondef*>(ast.get());
                return "function" + (!func->name ? "" : " " + tostring(func->name, depth)) + tostring(func->body, depth);
            }
            case base::kind::funcname: {
                auto name = dynamic_cast<funcname*>(ast.get());
                return tostring(name->value, depth);
            }
            case base::kind::funcbody: {
                auto func = dynamic_cast<funcbody*>(ast.get());

                #ifdef RENAME_VARIABLES
                    if (func->parameters) {
                        auto list = dynamic_cast<parlist*>(func->parameters.get());
                        add_variable(list->value, depth + 1);
                    }
                #endif

                return std::format("({0})\n{1}{2}end", tostring(func->parameters, depth), tostring(func->block, depth + 1), space(depth));
            }
            case base::kind::label: {
                auto label = dynamic_cast<class label*>(ast.get());
                return std::format("::{0}::", tostring(label->value, depth));
            }
            case base::kind::args: {
                auto args = dynamic_cast<class args*>(ast.get());
                return std::format("({0})", tostring(args->value, depth));
            }
            case base::kind::block: {
                auto block = dynamic_cast<class block*>(ast.get());

                std::string merged_string;
                auto it = block->statements.begin();

                while (it != block->statements.end()) {
                    std::string stringified = tostring(*it++, depth);

                    if (stringified == ";" && !merged_string.empty() && merged_string.back() == '\n') {
                        merged_string.pop_back();
                    }
                    else {
                        merged_string += space(depth);
                    }
                    merged_string += stringified;
                    merged_string += "\n";
                }
                return merged_string;
            }
            case base::kind::semicolon: {
                return ";";
            }

            case base::kind::generic_for_stat: {
                auto stat = dynamic_cast<generic_for_stat*>(ast.get());

                #ifdef RENAME_VARIABLES
                    auto list = dynamic_cast<namelist*>(stat->name_list.get());
                    add_variable(list->value, depth + 1);
                #endif

                return std::format("for {0} in {1} do\n{2}{3}end", tostring(stat->name_list, depth), tostring(stat->expr_list, depth), tostring(stat->block, depth + 1), space(depth));
            }
            case base::kind::numeric_for_stat: {
                auto stat = dynamic_cast<numeric_for_stat*>(ast.get());
                std::string str;


                #ifdef RENAME_VARIABLES
                    add_variable(stat->name, depth + 1);
                #endif

                str += std::format("for {0} = {1}, {2}", tostring(stat->name, 0), tostring(stat->init, 0), tostring(stat->goal, depth));

                if (stat->step) {
                    str += std::format(", {0}", tostring(stat->step, depth));
                }

                str += std::format(" do\n{0}{1}end", tostring(stat->block, depth + 1), space(depth));
                return str;
            }
            case base::kind::repeat_stat: {
                auto stat = dynamic_cast<repeat_stat*>(ast.get());
                auto cond = dynamic_cast<block_conditional*>(stat->statement.get());
                return std::format("repeat\n{0}{2}until {1}", tostring(cond->block, depth + 1), tostring(cond->condition, depth), space(depth));
            }
            case base::kind::while_stat: {
                auto stat = dynamic_cast<while_stat*>(ast.get());
                auto cond = dynamic_cast<block_conditional*>(stat->statement.get());
                return std::format("while {0} do\n{1}{2}end", tostring(cond->condition, depth), tostring(cond->block, depth + 1), space(depth));
            }
            case base::kind::if_stat: {
                auto stat = dynamic_cast<if_stat*>(ast.get());
                std::string str;

                for (int i = 0; i < stat->statements.size(); i++) {
                    auto cond = dynamic_cast<block_conditional*>(stat->statements[i].get());

                    if (cond->condition) {
                        str += (i == 0 ? "if " : space(depth) + "elseif ") + tostring(cond->condition, depth) + " then\n";
                        str += tostring(cond->block, depth + 1);
                    }
                    else {
                        str += space(depth) + "else\n";
                        str += tostring(cond->block, depth + 1);
                    }
                }

                str += space(depth) + "end";
                return str;
            }
            case base::kind::do_stat: {
                auto stat = dynamic_cast<do_stat*>(ast.get());
                auto cond = dynamic_cast<block_conditional*>(stat->block.get());
                return std::format("do\n{0}{1}end", tostring(cond->block, depth + 1), space(depth));
            }
            case base::kind::goto_stat: {
                auto stat = dynamic_cast<goto_stat*>(ast.get());
                return std::format("goto {0}", tostring(stat->label, depth));
            }
            case base::kind::break_stat: {
                return "break";
            }
            case base::kind::local_stat: {
                auto stat = dynamic_cast<local_stat*>(ast.get());

                #ifdef RENAME_VARIABLES
                    attnamelist* attribute_list = nullptr;
                    double_cast(assignment_stat, attnamelist, attribute_list, stat->declaration, lhs);

                    add_variable(attribute_list->value, depth);
                #endif

                return std::format("local {0}", tostring(stat->declaration, depth));
            }
            case base::kind::assignment_stat: {
                auto stat = dynamic_cast<assignment_stat*>(ast.get());
                return std::format("{0} = {1}", tostring(stat->lhs, depth), tostring(stat->rhs, depth));
            }
        }
        return "";
    }
};





#endif