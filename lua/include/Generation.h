#ifndef LUA_GENERATION_H
#define LUA_GENERATION_H

#include <string_view>
#include <fmt/core.h>
#include <Parser.h>

#define NEW_LINE "\n"

class Generator
{
private:
    std::vector<char> variableChars;
    unsigned int variableCount = 0;

    std::string createVariable(unsigned int id)
    {
        std::string str = "";

        while (id > 0)
        {
            id--;
            str = variableChars[id % variableChars.size()] + str;
            id /= variableChars.size();
        }
        return str;
    }

public:
    std::string generate(const std::string& source)
    {
        Parser parser;
        auto chunk = parser.parse(source);

        auto generatedString = toString(chunk, 0);

        if (!generatedString.empty() && generatedString.back() == '\n')
        {
            generatedString.pop_back();
        }
        return generatedString;
    }

    std::string concat(p_BaseArray array, const std::string& separator, std::size_t depth, bool skip_last = true)
    {
        std::string merged_string;
        auto it = array.begin();

        while (it != array.end())
        {
            merged_string += toString(*it, depth);
            it++;
            if (!(skip_last && it == array.end()))
            {
                merged_string += separator;
            }
        }
        return merged_string;
    }

    template <typename... Args>
    std::string format(std::string_view fmtString, Args&& ... args)
    {
        return fmt::vformat(fmtString, fmt::make_format_args(args...));
    }

    static std::string space(const std::size_t& depth)
    {
        return std::string(depth * 4, ' ');
    }

    std::string toString(const p_Base& base, std::size_t depth = 0)
    {
        if (!base)
        {
            return "";
        }

        auto node = Node::get(base);

        switch (base->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto binaryOperator = node->getChild<std::string>(0);
                auto lhs = node->getChild<p_Base>(1);
                auto rhs = node->getChild<p_Base>(2);

                std::string lhsFmt = "{0}";
                std::string rhsFmt = "{0}";

                if (lhs && lhs->getKind() == Kind::BinaryOperation)
                {
                    lhsFmt = "({0})";
                }
                if (rhs && rhs->getKind() == Kind::BinaryOperation)
                {
                    rhsFmt = "({0})";
                }

                return format(
                    "{0} {1} {2}",
                    format(
                        lhsFmt,
                        toString(lhs, depth)
                    ),
                    binaryOperator,
                    format(
                        rhsFmt,
                        toString(rhs, depth)
                    )
                );
            }
            case Kind::UnaryOperation:
            {
                auto unaryOperator = node->getChild<std::string>(0);
                auto expression = node->getChild<p_Base>(1);

                std::string fmt = "{0}{1}{2}";

                if (expression->getKind() == Kind::BinaryOperation)
                {
                    fmt = "{0}{1}({2})";
                }
                return format(
                    fmt,
                    unaryOperator,
                    unaryOperator == "not" ? " " : "",
                    toString(expression, depth)
                );
            }

            case Kind::Identifier:
            {
                // std::cout << "VARIABLE: " << node->getChild<std::string>(0) << std::endl;
                // auto curr = node;
                // for (int i = 0; curr != nullptr; i++) {
                //     std::cout << i << ": " << getKindName(curr->getKind()) << std::endl;
                //     curr = curr->getParent();
                // }
                //
                // std::cout << node->getChildren().size() << std::endl;
                //
                // std::cout << std::endl;

                if (auto parent = node->getParent())
                {
                    switch (parent->getKind())
                    {
                        case Kind::Member:
                        case Kind::Method:
                        case Kind::Index:
                        {
                            auto lhsChild = parent->getChild<p_Base>(0);
                            auto rhsChild = parent->getChild<p_Base>(1);

                            if (lhsChild->getKind() == Kind::Identifier && rhsChild->getKind() == Kind::Identifier) {
                                // return "LOL";
                                if (Node::get(lhsChild) == node) {
                                    return "FIRST_VAR";
                                }
                            }
                            break;
                        }
                        default:
                        {
                            return "ALSO_FIRST";
                        }
                    }
                }
            }
            case Kind::Numeric:
            case Kind::Boolean:
            case Kind::Varargs:
            case Kind::String:
            case Kind::Null:
            {
                return node->getChild<std::string>(0);
            }


            case Kind::Attribute:
            {
                auto name = node->getChild<p_Base>(0);
                auto attribute = node->getChild<p_Base>(1);
                return format(
                    "{0}<{1}>",
                    toString(name, depth),
                    toString(attribute, depth)
                );
            }
            case Kind::Member:
            {
                auto root = node->getChild<p_Base>(0);
                auto index = node->getChild<p_Base>(1);
                return format(
                    "{0}.{1}",
                    toString(root, depth),
                    toString(index, depth)
                );
            }
            case Kind::Method:
            {
                auto root = node->getChild<p_Base>(0);
                auto index = node->getChild<p_Base>(1);
                return format(
                    "{0}:{1}",
                    toString(root, depth),
                    toString(index, depth)
                );
            }
            case Kind::Index:
            {
                auto root = node->getChild<p_Base>(0);
                auto index = node->getChild<p_Base>(1);
                return format(
                    "{0}[{1}]",
                    toString(root, depth),
                    toString(index, depth)
                );
            }

            case Kind::TableIndexValue:
            {
                auto index = node->getChild<p_Base>(0);
                auto value = node->getChild<p_Base>(1);
                return format(
                    "{0}[{1}] = {2}",
                    space(depth),
                    toString(index, depth),
                    toString(value, depth)
                );
            }
            case Kind::TableNameValue:
            {
                auto index = node->getChild<p_Base>(0);
                auto value = node->getChild<p_Base>(1);
                return format(
                    "{0}{1} = {2}",
                    space(depth),
                    toString(index, depth),
                    toString(value, depth)
                );
            }
            case Kind::TableValue:
            {
                auto value = node->getChild<p_Base>(0);
                return format(
                    "{0}{1}",
                    space(depth),
                    toString(value, depth)
                );
            }
            case Kind::TableConstructor:
            {
                if (auto child = node->getChild<p_Base>(0))
                {
                    return format(
                        "{{{0}{1}{2}{3}}}",
                        NEW_LINE,
                        toString(child, depth + 1),
                        NEW_LINE,
                        space(depth)
                    );
                }
                return "{}";
            }

            case Kind::ExpressionList:
            case Kind::AttributeList:
            case Kind::ParameterList:
            case Kind::VariableList:
            case Kind::NameList:
            {
                auto list = node->getChild<p_BaseArray>(0);
                return concat(list, ", ", depth);
            }
            case Kind::FieldList:
            {
                auto list = node->getChild<p_BaseArray>(0);
                return concat(list, ",\n", depth);
            }
            case Kind::ArgumentList:
            {
                auto arguments = node->getChild<p_Base>(0);
                return format(
                    "({0})",
                    toString(arguments, depth)
                );
            }

            case Kind::Block:
            {
                auto statements = node->getChild<p_BaseArray>(0);

                std::string statementString;

                for (auto& statement: statements)
                {
                    std::string string = toString(statement, depth);

                    if (string == ";" && !statementString.empty() && statementString.back() == '\n')
                    {
                        statementString.pop_back();
                    }
                    else
                    {
                        statementString += space(depth);
                    }
                    statementString += string;
                    statementString += "\n";
                }
                return statementString;
            }
            case Kind::Chunk:
            {
                auto block = node->getChild<p_Base>(0);
                return toString(block);
            }

            case Kind::FunctionCall:
            {
                auto root = node->getChild<p_Base>(0);
                auto args = node->getChild<p_Base>(1);
                return toString(root, depth) + toString(args, depth);
            }
            case Kind::FunctionDefinition:
            {
                auto name = node->getChild<p_Base>(0);
                auto body = node->getChild<p_Base>(1);
                return format(
                    "function{0}{1}{2}",
                    !name ? "" : " ",
                    toString(name, depth),
                    toString(body, depth)
                );
            }
            case Kind::FunctionName:
            {
                auto name = node->getChild<p_Base>(0);
                return toString(name, depth);
            }
            case Kind::FunctionBody:
            {
                auto parameters = node->getChild<p_Base>(0);
                auto block = node->getChild<p_Base>(1);
                return format(
                    "({0}){1}{2}{3}end",
                    toString(parameters, depth),
                    NEW_LINE,
                    toString(block, depth + 1),
                    space(depth)
                );
            }
            case Kind::Label:
            {
                auto name = node->getChild<p_Base>(0);
                return format(
                    "::{0}::",
                    toString(name, depth)
                );
            }
            case Kind::Semicolon:
            {
                return ";";
            }

            case Kind::ForStatement:
            {
                if (node->getSize() == 3)
                {
                    auto names = node->getChild<p_Base>(0);
                    auto expressions = node->getChild<p_Base>(1);
                    auto block = node->getChild<p_Base>(2);

                    return format(
                        "for {0} in {1} do{2}{3}{4}end",
                        toString(names, depth),
                        toString(expressions, depth),
                        NEW_LINE,
                        toString(block, depth + 1),
                        space(depth)
                    );
                }
                else
                {
                    auto name = node->getChild<p_Base>(0);
                    auto init = node->getChild<p_Base>(1);
                    auto goal = node->getChild<p_Base>(2);
                    auto step = node->getChild<p_Base>(3);
                    auto block = node->getChild<p_Base>(4);

                    std::string fmt = "for {0} = {1}, {2}, {3} do{4}{5}{6}end";

                    if (!step)
                    {
                        fmt = "for {0} = {1}, {2} do{4}{5}{6}end";
                    }

                    return format(
                        fmt,
                        toString(name, 0),
                        toString(init, depth),
                        toString(goal, depth),
                        toString(step, depth),
                        NEW_LINE,
                        toString(block, depth + 1),
                        space(depth)
                    );
                }
            }
            case Kind::ReturnStatement:
            {
                auto expressions = node->getChild<p_Base>(0);
                return format(
                    "return {0}",
                    toString(expressions, depth)
                );
            }
            case Kind::RepeatStatement:
            {
                auto conditionalBlock = Node::get(node->getChild<p_Base>(0));
                auto condition = conditionalBlock->getChild<p_Base>(0);
                auto block = conditionalBlock->getChild<p_Base>(1);

                return format(
                    "repeat{0}{1}{2}until {3}",
                    NEW_LINE,
                    toString(block, depth + 1),
                    space(depth),
                    toString(condition, depth)
                );
            }
            case Kind::WhileStatement:
            {
                auto conditionalBlock = Node::get(node->getChild<p_Base>(0));
                auto condition = conditionalBlock->getChild<p_Base>(0);
                auto block = conditionalBlock->getChild<p_Base>(1);

                return format(
                    "while {0} do{1}{2}{3}end",
                    toString(condition, depth),
                    NEW_LINE,
                    toString(block, depth + 1),
                    space(depth)
                );
            }
            case Kind::IfStatement:
            {
                auto statements = node->getChild<p_BaseArray>(0);

                std::string ifString;
                for (int i = 0; i < statements.size(); i++)
                {
                    auto conditionalBlock = Node::get(statements[i]);
                    auto condition = conditionalBlock->getChild<p_Base>(0);
                    auto block = conditionalBlock->getChild<p_Base>(1);

                    std::string fmt = "if {1} then{2}{3}";

                    if (!condition)
                    {
                        fmt = "{0}else{2}{3}";
                    }
                    else if (i > 0)
                    {
                        fmt = "{0}elseif {1} then{2}{3}";
                    }

                    ifString += format(
                        fmt,
                        space(depth),
                        toString(condition, depth),
                        NEW_LINE,
                        toString(block, depth + 1)
                    );
                }

                ifString += format("{0}end", space(depth));
                return ifString;
            }
            case Kind::DoStatement:
            {
                auto block = node->getChild<p_Base>(0);
                return format(
                    "do{0}{1}{2}end",
                    NEW_LINE,
                    toString(block, depth + 1),
                    space(depth)
                );
            }
            case Kind::GotoStatement:
            {
                auto name = node->getChild<p_Base>(0);
                return format(
                    "goto {0}",
                    toString(name, depth)
                );
            }
            case Kind::BreakStatement:
            {
                return "break";
            }
            case Kind::LocalStatement:
            {
                auto statement = node->getChild<p_Base>(0);
                return format(
                    "local {0}",
                    toString(statement, depth)
                );
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = node->getChild<p_Base>(0);
                auto rhs = node->getChild<p_Base>(1);
                return format(
                    "{0} = {1}",
                    toString(lhs, depth),
                    toString(rhs, depth)
                );
            }

            default:
            {
                return "";
            }
        }
    }
};


#endif