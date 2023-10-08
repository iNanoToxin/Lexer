#ifndef LUA_GENERATION_H
#define LUA_GENERATION_H

#include "Parser.h"

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
    std::string generate(const std::string& source) {
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

        auto node = Node::getNode(base);

        switch (base->getKind())
        {
            case Kind::TableConstructor:
            {
                if (auto child = node->getChild<p_Base>(0))
                {
                    return std::format(
                        "{{{0}{1}{2}{3}}}",
                        NEW_LINE,
                        toString(child, depth + 1),
                        NEW_LINE,
                        space(depth)
                    );
                }
                return "{}";
            }
            case Kind::BinaryOperation:
            {
                std::string operationString;

                auto binaryOperator = node->getChild<std::string>(0);
                auto lhs = node->getChild<p_Base>(1);
                auto rhs = node->getChild<p_Base>(2);

                if (lhs && lhs->getKind() == Kind::BinaryOperation)
                {
                    operationString += std::format(
                        "({0})",
                        toString(lhs, depth)
                    );
                }
                else
                {
                    operationString += toString(lhs, depth);
                }

                operationString += " " + binaryOperator + " ";

                if (rhs && rhs->getKind() == Kind::BinaryOperation)
                {
                    operationString += std::format(
                        "({0})",
                        toString(rhs, depth)
                    );
                }
                else
                {
                    operationString += toString(rhs, depth);
                }
                return operationString;
            }
            case Kind::UnaryOperation:
            {
                auto unaryOperator = node->getChild<std::string>(0);
                auto expression = node->getChild<p_Base>(1);

                return std::format(
                    "{0}{1}{2}",
                    unaryOperator,
                    unaryOperator == "not" ? " " : "",
                    toString(expression, depth)
                );
            }

            case Kind::Numeric:
            case Kind::Identifier:
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
                return std::format(
                    "{0}<{1}>",
                    toString(name, depth),
                    toString(attribute, depth)
                );
            }
            case Kind::Member:
            {
                auto root = node->getChild<p_Base>(0);
                auto index = node->getChild<p_Base>(1);
                return std::format(
                    "{0}.{1}",
                    toString(root, depth),
                    toString(index, depth)
                );
            }
            case Kind::Method:
            {
                auto root = node->getChild<p_Base>(0);
                auto index = node->getChild<p_Base>(1);
                return std::format(
                    "{0}:{1}",
                    toString(root, depth),
                    toString(index, depth)
                );
            }
            case Kind::Index:
            {
                auto root = node->getChild<p_Base>(0);
                auto index = node->getChild<p_Base>(1);
                return std::format(
                    "{0}[{1}]",
                    toString(root, depth),
                    toString(index, depth)
                );
            }

            case Kind::TableIndexValue:
            {
                auto index = node->getChild<p_Base>(0);
                auto value = node->getChild<p_Base>(1);
                return std::format(
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
                return std::format(
                    "{0}{1} = {2}",
                    space(depth),
                    toString(index, depth),
                    toString(value, depth)
                );
            }
            case Kind::TableValue:
            {
                auto value = node->getChild<p_Base>(0);
                return std::format(
                    "{0}{1}",
                    space(depth),
                    toString(value, depth)
                );
            }

            case Kind::AttributeList:
            case Kind::ExpressionList:
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
            case Kind::Chunk: {
                auto block = node->getChild<p_Base>(0);
                return block ? toString(block) : "";
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
                return std::format(
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
                return std::format(
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
                return std::format(
                    "::{0}::",
                    toString(name, depth)
                );
            }
            case Kind::ArgumentList:
            {
                auto arguments = node->getChild<p_Base>(0);
                return std::format(
                    "({0})",
                    toString(arguments, depth)
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

                    return std::format(
                        "for {0} in {1} do\n{2}{3}end",
                        toString(names, depth),
                        toString(expressions, depth),
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

                    if (step)
                    {
                        return std::format(
                            "for {0} = {1}, {2}, {3} do{4}{5}{6}end",
                            toString(name, 0),
                            toString(init, depth),
                            toString(goal, depth),
                            toString(step, depth),
                            NEW_LINE,
                            toString(block, depth + 1),
                            space(depth)
                        );
                    }
                    return std::format(
                        "for {0} = {1}, {2} do{3}{4}{5}end",
                        toString(name, 0),
                        toString(init, depth),
                        toString(goal, depth),
                        NEW_LINE,
                        toString(block, depth + 1),
                        space(depth)
                    );
                }
            }
            case Kind::ReturnStatement:
            {
                auto expressions = node->getChild<p_Base>(0);
                return std::format(
                    "return {0}",
                    toString(expressions, depth)
                );
            }
            case Kind::RepeatStatement:
            {
                auto conditionalBlock = Node::getNode(node->getChild<p_Base>(0));
                auto condition = conditionalBlock->getChild<p_Base>(0);
                auto block = conditionalBlock->getChild<p_Base>(1);

                return std::format(
                    "repeat{0}{1}{2}until {3}",
                    NEW_LINE,
                    toString(block, depth + 1),
                    space(depth),
                    toString(condition, depth)
                );
            }
            case Kind::WhileStatement:
            {
                auto conditionalBlock = Node::getNode(node->getChild<p_Base>(0));
                auto condition = conditionalBlock->getChild<p_Base>(0);
                auto block = conditionalBlock->getChild<p_Base>(1);

                return std::format(
                    "while {0} do\n{1}{2}end",
                    toString(condition, depth),
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
                    auto conditionalBlock = Node::getNode(statements[i]);
                    auto condition = conditionalBlock->getChild<p_Base>(0);
                    auto block = conditionalBlock->getChild<p_Base>(1);

                    if (i == 0) {
                        ifString += std::format(
                            "if {0} then{1}{2}",
                            toString(condition, depth),
                            NEW_LINE,
                            toString(block, depth + 1)
                        );
                    }
                    else if (condition)
                    {
                        ifString += std::format(
                            "{0}elseif {1} then{2}{3}",
                            space(depth),
                            toString(condition, depth),
                            NEW_LINE,
                            toString(block, depth + 1)
                        );
                    }
                    else
                    {
                        ifString += std::format(
                            "{0}else{1}{2}",
                            space(depth),
                            NEW_LINE,
                            toString(block, depth + 1)
                        );
                    }
                }

                ifString += std::format("{0}end", space(depth));
                return ifString;
            }
            case Kind::DoStatement:
            {
                auto block = node->getChild<p_Base>(0);
                return std::format(
                    "do{0}{1}{2}end",
                    NEW_LINE,
                    toString(block, depth + 1),
                    space(depth)
                );
            }
            case Kind::GotoStatement:
            {
                auto name = node->getChild<p_Base>(0);
                return std::format(
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
                return std::format(
                    "local {0}",
                    toString(statement, depth)
                );
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = node->getChild<p_Base>(0);
                auto rhs = node->getChild<p_Base>(1);
                return std::format(
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
