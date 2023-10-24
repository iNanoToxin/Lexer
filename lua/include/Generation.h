#ifndef LUA_GENERATION_H
#define LUA_GENERATION_H

#include <string_view>
#include <fmt/core.h>
#include <stack>
#include <map>
#include <Parser.h>
#include <cmath>

#define NEW_LINE "\n"


#define w_assert(condition, message)                      \
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

class Scope : std::stack<std::map<std::string, std::pair<std::string, int>>>
{
private:
    std::vector<char> variableChars;
    unsigned int variableCount = 0;
public:
    Scope()
    {
        for (int i = 'a'; i <= 'z'; i++)
        {
            variableChars.push_back(i);
        }
        for (int i = 'A'; i <= 'Z'; i++)
        {
            variableChars.push_back(i);
        }
    }

    bool contains(const std::string& string)
    {
        auto scopes = *this;

        while (!scopes.empty())
        {
            if (scopes.top().contains(string))
            {
                return true;
            }
            scopes.pop();
        }
        return false;
    }

    std::string get(const std::string& string)
    {
        auto scopes = *this;

        while (!scopes.empty())
        {
            if (scopes.top().contains(string))
            {
                return scopes.top()[string].first;
            }
            scopes.pop();
        }
        return std::string{};
    }

    void begin()
    {
        this->push({});
    }

    void end()
    {
        w_assert(!this->empty(), "scope is empty");

        for (auto& var: this->top())
        {
            variableCount -= var.second.second;
        }
        this->pop();
    }

    std::string getVariable(unsigned int id)
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

    std::string nextVariable()
    {
        return getVariable(++variableCount);
        // return "VAR_" + std::to_string(variableCount++);
    }

    void addVariable(const std::string& string)
    {
        auto& map = this->top();
        auto& var = map[string];
        var.first = nextVariable();
        var.second++;
    }
};


class Memory
{
public:
    Scope scope;

    static bool isUsedLocalVariable(const p_Node& node)
    {
        if (!node)
        {
            return false;
        }

        if (auto parent = node->getParent())
        {
            switch (parent->getKind())
            {
                case Kind::Attribute:
                {
                    if (parent->getChild<p_Base>(1) == node)
                    {
                        return false;
                    }
                    break;
                }
                case Kind::Member:
                case Kind::Method:
                {
                    auto lhsChild = parent->getChild<p_Base>(0);
                    auto rhsChild = parent->getChild<p_Base>(1);

                    if (lhsChild->getKind() != Kind::Identifier || rhsChild->getKind() != Kind::Identifier || Node::get(
                        lhsChild
                    ) != node)
                    {
                        break;
                    }
                }
                default:
                {
                    return true;
                }
            }
        }
        return false;
    }

    static bool isLocalVariable(const p_Node& node)
    {
        if (!node)
        {
            return false;
        }

        if (auto parent = node->getParent())
        {
            switch (parent->getKind())
            {
                case Kind::Attribute:
                {
                    if (parent->getChild<p_Base>(0) != node)
                    {
                        return false;
                    }
                    return true;
                }
                case Kind::NameList:
                case Kind::ParameterList:
                case Kind::AttributeList:
                case Kind::VariableList:
                case Kind::FunctionDefinition:
                {
                    return true;
                }

                default:
                {
                    return false;
                }
            }
        }
        return false;
    }

    static void performBinaryOperation(
        const std::string& binaryOperator,
        const p_Node& lhs,
        const p_Node& rhs,
        p_Node& node
    )
    {
        auto lhsN = lhs->getChild<Number>(0);
        auto rhsN = rhs->getChild<Number>(0);

        double value;

        if (binaryOperator == "+")
        {
            value = lhsN.value + rhsN.value;
        }
        else if (binaryOperator == "-")
        {
            value = lhsN.value - rhsN.value;
        }
        else if (binaryOperator == "*")
        {
            value = lhsN.value * rhsN.value;
        }
        else if (binaryOperator == "/")
        {
            value = lhsN.value / rhsN.value;
        }
        else if (binaryOperator == "%")
        {
            value = std::fmod(lhsN.value, rhsN.value);
        }

        node->setKind(Kind::Numeric);
        node->setSize(1);
        node->setChildren({Number(value)});
    }

    static void performUnaryOperation(
        const std::string& binaryOperator,
        const p_Node& expression,
        p_Node& node
    )
    {
        auto n = expression->getChild<Number>(0);

        if (binaryOperator == "-")
        {
            node->setKind(Kind::Numeric);
            node->setSize(1);
            node->setChildren({Number(-n.value)});
        }
    }

    void rename(const p_Base& base)
    {
        auto node = Node::get(base);

        if (!node)
        {
            return;
        }

        switch (node->getKind())
        {
            case Kind::Attribute:
            {
                rename(node->getChild<p_Base>(0));
                break;
            }

            case Kind::AttributeList:
            case Kind::NameList:
            case Kind::ParameterList:
            {
                auto list = node->getChild<p_BaseArray>(0);

                for (auto& var: list)
                {
                    rename(var);
                }
                break;
            }

            case Kind::Identifier:
            {
                scope.addVariable(node->getChild<std::string>(0));
                break;
            }

            default:
            {
                break;
            }
        }
    }

    void refactor(const p_Base& base)
    {
        auto node = Node::get(base);

        if (!node)
        {
            return;
        }

        switch (base->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto binaryOperator = node->getChild<std::string>(0);
                auto lhs = node->getChild<p_Base>(1);
                auto rhs = node->getChild<p_Base>(2);

                refactor(lhs);
                refactor(rhs);

                if (lhs->getKind() == Kind::Numeric && rhs->getKind() == Kind::Numeric)
                {
                    performBinaryOperation(
                        binaryOperator,
                        Node::get(lhs),
                        Node::get(rhs),
                        node
                    );
                }
                break;
            }
            case Kind::UnaryOperation:
            {
                auto unaryOperator = node->getChild<std::string>(0);
                auto expression = node->getChild<p_Base>(1);
                auto expressionNode = Node::get(expression);

                refactor(expression);

                if (expression->getKind() == Kind::Numeric && unaryOperator == "-")
                {
                    performUnaryOperation(
                        unaryOperator,
                        Node::get(expression),
                        node
                    );
                }


                break;
            }

            case Kind::Identifier:
            {
                auto& name = node->getChild<std::string>(0);
                if (scope.contains(name))
                {
                    name = scope.get(name);
                }
            }
            case Kind::Numeric:
            case Kind::Boolean:
            case Kind::Varargs:
            case Kind::String:
            case Kind::Null:
            {
                break;
            }


            case Kind::Attribute:
            case Kind::Member:
            case Kind::Method:
            case Kind::Index:
            {
                auto lhs = node->getChild<p_Base>(0);
                auto rhs = node->getChild<p_Base>(1);
                refactor(lhs);
                refactor(rhs);
                break;
            }

            case Kind::TableIndexValue:
            {
                auto index = node->getChild<p_Base>(0);
                auto value = node->getChild<p_Base>(1);
                refactor(index);
                refactor(value);
                break;
            }
            case Kind::TableNameValue:
            {
                auto index = node->getChild<p_Base>(0);
                auto value = node->getChild<p_Base>(1);
                refactor(index);
                refactor(value);
                break;
            }
            case Kind::TableValue:
            {
                auto value = node->getChild<p_Base>(0);
                refactor(value);
                break;
            }
            case Kind::TableConstructor:
            {
                auto fieldList = node->getChild<p_Base>(0);
                refactor(fieldList);
                break;
            }

            case Kind::ExpressionList:
            case Kind::AttributeList:
            case Kind::ParameterList:
            case Kind::VariableList:
            case Kind::NameList:
            case Kind::FieldList:
            {
                auto list = node->getChild<p_BaseArray>(0);

                for (auto& baseNode: list)
                {
                    refactor(baseNode);
                }
                break;
            }
            case Kind::ArgumentList:
            {
                auto arguments = node->getChild<p_Base>(0);
                refactor(arguments);
                break;
            }

            case Kind::Block:
            {
                auto statements = node->getChild<p_BaseArray>(0);

                scope.begin();
                for (auto& statement: statements)
                {
                    refactor(statement);
                }
                scope.end();
                break;
            }
            case Kind::Chunk:
            {
                auto block = node->getChild<p_Base>(0);
                return refactor(block);
            }

            case Kind::FunctionCall:
            {
                auto root = node->getChild<p_Base>(0);
                auto args = node->getChild<p_Base>(1);
                refactor(root);
                refactor(args);
                break;
            }
            case Kind::FunctionDefinition:
            {
                auto name = node->getChild<p_Base>(0);
                auto body = node->getChild<p_Base>(1);
                rename(name);
                refactor(name);
                refactor(body);
                break;
            }
            case Kind::FunctionName:
            {
                auto name = node->getChild<p_Base>(0);
                refactor(name);
                break;
            }
            case Kind::FunctionBody:
            {
                auto parameters = node->getChild<p_Base>(0);
                auto block = node->getChild<p_Base>(1);
                scope.begin();
                rename(parameters);
                refactor(parameters);
                refactor(block);
                scope.end();
                break;
            }
            case Kind::Label:
            {
                auto name = node->getChild<p_Base>(0);
                refactor(name);
                break;
            }
            case Kind::Semicolon:
            {
                break;
            }

            case Kind::ForStatement:
            {
                scope.begin();
                if (node->getSize() == 3)
                {
                    auto names = node->getChild<p_Base>(0);
                    auto expressions = node->getChild<p_Base>(1);
                    auto block = node->getChild<p_Base>(2);
                    rename(names);
                    refactor(names);
                    refactor(expressions);
                    refactor(block);
                }
                else
                {
                    auto name = node->getChild<p_Base>(0);
                    auto init = node->getChild<p_Base>(1);
                    auto goal = node->getChild<p_Base>(2);
                    auto step = node->getChild<p_Base>(3);
                    auto block = node->getChild<p_Base>(4);
                    rename(name);
                    refactor(name);
                    refactor(init);
                    refactor(goal);
                    refactor(step);
                    refactor(block);
                }
                scope.end();
                break;
            }
            case Kind::ReturnStatement:
            {
                auto expressions = node->getChild<p_Base>(0);
                refactor(expressions);
                break;
            }
            case Kind::RepeatStatement:
            {
                auto conditionalBlock = Node::get(node->getChild<p_Base>(0));
                auto condition = conditionalBlock->getChild<p_Base>(0);
                auto block = conditionalBlock->getChild<p_Base>(1);
                refactor(condition);
                refactor(block);
                break;
            }
            case Kind::WhileStatement:
            {
                auto conditionalBlock = Node::get(node->getChild<p_Base>(0));
                auto condition = conditionalBlock->getChild<p_Base>(0);
                auto block = conditionalBlock->getChild<p_Base>(1);
                refactor(condition);
                refactor(block);
                break;
            }
            case Kind::IfStatement:
            {
                auto statements = node->getChild<p_BaseArray>(0);

                for (int i = 0; i < statements.size(); i++)
                {
                    auto conditionalBlock = Node::get(statements[i]);
                    auto condition = conditionalBlock->getChild<p_Base>(0);
                    auto block = conditionalBlock->getChild<p_Base>(1);
                    refactor(condition);
                    refactor(block);
                }
                break;
            }
            case Kind::DoStatement:
            {
                auto block = node->getChild<p_Base>(0);
                refactor(block);
                break;
            }
            case Kind::GotoStatement:
            {
                auto name = node->getChild<p_Base>(0);
                refactor(name);
                break;
            }
            case Kind::BreakStatement:
            {
                break;
            }
            case Kind::LocalStatement:
            {
                auto statement = Node::get(node->getChild<p_Base>(0));
                rename(statement);
                refactor(statement);
                break;
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = node->getChild<p_Base>(0);
                auto rhs = node->getChild<p_Base>(1);

                refactor(rhs);
                if (node->getParent()->getKind() == Kind::LocalStatement)
                {
                    rename(lhs);
                }
                refactor(lhs);
                break;
            }

            default:
            {
                break;
            }
        }
    }
};


class Generator
{
public:
    std::string generate(const std::string& source)
    {
        Parser parser;
        auto chunk = parser.parse(source);

        // Memory memory;
        // memory.refactor(chunk);

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

    static int getPrecedence(const std::string& binaryOperator, bool isUnaryOperation = false)
    {
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

        if (isUnaryOperation)
        {
            return static_cast<int>(priority.size()) - 1;
        }

        for (int i = 0; i < priority.size(); i++)
        {
            for (auto& e: priority[i])
            {
                if (binaryOperator == e)
                {
                    return i + 1;
                }
            }
        }
        return -1;
    }

    static bool isBinaryPrecedenceHigher(const p_Node& lhs, const p_Node& rhs)
    {
        if (!lhs) return false;
        if (!rhs) return false;
        if (lhs->getKind() != Kind::BinaryOperation) return false;
        if (rhs->getKind() != Kind::BinaryOperation) return false;

        return getPrecedence(lhs->getChild<std::string>(0)) > getPrecedence(rhs->getChild<std::string>(0));
    }

    std::string toString(const p_Base& base, std::size_t depth = 0)
    {
        auto node = Node::get(base);

        if (!node)
        {
            return "";
        }

        switch (base->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto binaryOperator = node->getChild<std::string>(0);
                auto lhs = node->getChild<p_Base>(1);
                auto rhs = node->getChild<p_Base>(2);

                std::string lhsFmt = "{0}";
                std::string rhsFmt = "{0}";

                if (isBinaryPrecedenceHigher(node, Node::get(lhs)))
                {
                    lhsFmt = "({0})";
                }
                if (isBinaryPrecedenceHigher(node, Node::get(rhs)))
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

                switch (expression->getKind())
                {
                    case Kind::UnaryOperation:
                    {
                        auto innerOperator = Node::get(expression)->getChild<std::string>(0);
                        if (unaryOperator == "-" && unaryOperator == innerOperator)
                        {
                            fmt = "{0}{1}({2})";
                        }
                        break;
                    }
                    case Kind::BinaryOperation:
                    {
                        fmt = "{0}{1}({2})";
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }

                return format(
                    fmt,
                    unaryOperator,
                    unaryOperator == "not" ? " " : "",
                    toString(expression, depth)
                );
            }

            case Kind::Identifier:
            case Kind::Boolean:
            case Kind::Varargs:
            case Kind::String:
            case Kind::Null:
            {
                return node->getChild<std::string>(0);
            }
            case Kind::Numeric:
            {
                return std::to_string(node->getChild<Number>(0).value);
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
                std::string fmt;

                switch (root->getKind())
                {
                    case Kind::Identifier:
                    case Kind::Member:
                    case Kind::Method:
                    case Kind::Index:
                    case Kind::FunctionCall:
                    {
                        fmt = "{0}{1}";
                        break;
                    }
                    default:
                    {
                        fmt = "({0}){1}";
                        break;
                    }
                }

                return format(
                    fmt,
                    toString(root, depth),
                    toString(args, depth)
                );
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
                std::string fmt = "({0}){1}{2}{3}end";

                if (!block)
                {
                    fmt = "({0}) end";
                }

                return format(
                    fmt,
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

                if (!expressions)
                {
                    return "return";
                }
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