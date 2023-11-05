#ifndef LUA_GENERATION_H
#define LUA_GENERATION_H

#include <Parser.h>
#include <Util.h>
#include <chrono>
#include <cmath>
#include <fmt/core.h>
#include <map>
#include <stack>
#include <string_view>
#include <variant>

#define NEW_LINE "\n"


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
        assert(!this->empty(), "scope is empty");

        for (auto& var: this->top())
        {
            variableCount -= var.second.second;
        }
        this->pop();
    }

    std::string getVariable(unsigned int id)
    {
        std::string str;

        while (id > 0)
        {
            id--;
            str += variableChars[id % variableChars.size()];
            id /= variableChars.size();
        }
        std::reverse(str.begin(), str.end());
        return str;
    }

    std::string nextVariable()
    {
        return getVariable(++variableCount);
        // return "VAR_" + std::to_string(variableCount++);
    }

    void addVariable(const std::string& string)
    {
        if (!get(string).empty())
        {
            return;
        }

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
                    if (parent->getChild<p_Node>(1) == node)
                    {
                        return false;
                    }
                    break;
                }
                case Kind::Member:
                case Kind::Method:
                {
                    auto lhsChild = parent->getChild<p_Node>(0);
                    auto rhsChild = parent->getChild<p_Node>(1);

                    if (lhsChild->getKind() != Kind::Identifier
                        || rhsChild->getKind() != Kind::Identifier
                        || lhsChild != node)
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
                    if (parent->getChild<p_Node>(0) != node)
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


    static void performBinaryOperation(const p_Node& node)
    {
        auto opKind = node->getChild<OperatorKind>(0);
        auto lhs = node->getChild<p_Node>(1);
        auto rhs = node->getChild<p_Node>(2);

        auto swapWith = [&](const p_Node& other) -> void
        {
            std::swap(node->getKind(), other->getKind());
            std::swap(node->getChildren(), other->getChildren());
            Node::reset(other);
        };

        auto computeArith = [&](auto func)
        {
            if (auto value = Operation::arithmetic(lhs, rhs, func))
            {
                node->setKind(Kind::Numeric);
                node->setChildren({Number(*value)});
                Node::reset(lhs);
                Node::reset(rhs);
            }
        };

        auto computeBit = [&](auto func)
        {
            if (auto value = Operation::bitwise(lhs, rhs, func))
            {
                node->setKind(Kind::Numeric);
                node->setChildren({Number(*value)});
                Node::reset(lhs);
                Node::reset(rhs);
            }
        };

        auto set = [&](const Kind& kind, const v_Variant& children)
        {
            node->setKind(kind);
            node->setChildren(children);
            Node::reset(lhs);
            Node::reset(rhs);
        };

        switch (opKind)
        {
            case OperatorKind::ADD:
            {
                computeArith(Operation::Add());
                break;
            }
            case OperatorKind::SUB:
            {
                computeArith(Operation::Sub());
                break;
            }
            case OperatorKind::MUL:
            {
                computeArith(Operation::Mul());
                break;
            }
            case OperatorKind::DIV:
            {
                computeArith(Operation::Div());
                break;
            }
            case OperatorKind::IDIV:
            {
                computeArith(Operation::Idiv());
                break;
            }
            case OperatorKind::MOD:
            {
                computeArith(Operation::Mod());
                break;
            }
            case OperatorKind::POW:
            {
                computeArith(Operation::Pow());
                break;
            }
            case OperatorKind::BAND:
            {
                computeBit(Operation::Band());
                break;
            }
            case OperatorKind::BOR:
            {
                computeBit(Operation::Bor());
                break;
            }
            case OperatorKind::BXOR:
            {
                computeBit(Operation::Bxor());
                break;
            }
            case OperatorKind::SHL:
            {
                computeBit(Operation::Shl());
                break;
            }
            case OperatorKind::SHR:
            {
                computeBit(Operation::Shr());
                break;
            }
            case OperatorKind::CONCAT:
            {
                auto l = Util::toString(lhs);
                auto r = Util::toString(rhs);

                if (l && r)
                {
                    set(Kind::String, {*l + *r});
                }
                break;
            }

                /*case OperatorKind::LOR:
            {
                switch (lhs->getKind())
                {
                    case Kind::Numeric:
                    case Kind::String:
                    case Kind::TableConstructor:
                    case Kind::FunctionDefinition:
                    {
                        swapWith(lhs);
                        return;
                    }
                    case Kind::Boolean:
                    {
                        if (lhs->getChild<bool>(0))
                        {
                            swapWith(lhs);
                            return;
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }

                switch (lhs->getKind())
                {
                    case Kind::Numeric:
                    case Kind::String:
                    case Kind::TableConstructor:
                    case Kind::FunctionDefinition:
                    {
                        std::swap(node->getKind(), lhs->getKind());
                        std::swap(node->getChildren(), lhs->getChildren());
                        Node::reset(lhs);
                        return;
                    }
                    case Kind::Boolean:
                    {
                        if (lhs->getChild<bool>(0))
                        {
                            std::swap(node->getKind(), lhs->getKind());
                            std::swap(node->getChildren(), lhs->getChildren());
                            Node::reset(lhs);
                            return;
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }

                break;
            }*/

            // case OperatorKind::INEQ:
            // {
            //     break;
            // }

            case OperatorKind::EQ:
            {
                /*if (auto boolean = Operation::compare(lhs, rhs, std::equal_to<>()))
                {
                    node->setKind(Kind::Boolean);
                    node->setChildren({*boolean});
                    Node::reset(lhs);
                    Node::reset(rhs);
                }*/

                switch (lhs->getKind())
                {
                    case Kind::String:
                    {
                        break;
                    }
                    case Kind::Numeric:
                    {
                        if (rhs->isKind(Kind::Numeric))
                        {
                            std::cout << "bool" << std::endl;
                            set(Kind::Boolean, {lhs->getChild<Number>(0) == rhs->getChild<Number>(0)});
                            break;
                        }
                        break;
                    }
                    case Kind::Boolean:
                    {
                        if (rhs->isKind(Kind::Boolean))
                        {
                            std::cout << "bool" << std::endl;
                            set(Kind::Boolean, {lhs->getChild<bool>(0) == rhs->getChild<bool>(0)});
                            break;
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }


                break;
            }

            default:
            {
                break;
            }
        }
    }

    static void performUnaryOperation(const p_Node& node)
    {
        auto opKind = node->getChild<OperatorKind>(0);
        auto lhs = node->getChild<p_Node>(1);

        auto getCount = [&node, &opKind]() -> int
        {
            auto curr = node;
            int i = 0;

            while (curr && curr->isKind(Kind::UnaryOperation) && curr->getChild<OperatorKind>(0) == opKind)
            {
                curr = curr->getParent();
                i++;
            }
            return i;
        };

        switch (opKind)
        {
            case OperatorKind::UNM:
            {
                if (auto value = Operation::unaryArithmetic(lhs, std::negate<>()))
                {
                    node->setKind(Kind::Numeric);
                    node->setChildren({Number(*value)});
                }
                break;
            }
            case OperatorKind::LEN:
            {
                if (lhs->isKind(Kind::String))
                {
                    auto s = lhs->getChild<std::string>(0);
                    auto i = 1;

                    if (s.starts_with("["))
                    {
                        while (i < s.size() && s[i] == '=')
                        {
                            i++;
                        }
                        i++;
                    }

                    node->setKind(Kind::Numeric);
                    node->setChildren({Number(s.size() - i * 2)});
                }
                break;
            }
            case OperatorKind::LNOT:
            {
                switch (lhs->getKind())
                {
                    case Kind::FunctionDefinition:
                    case Kind::TableConstructor:
                    case Kind::Numeric:
                    case Kind::String:
                    {
                        node->setKind(Kind::Boolean);
                        node->setChildren({false});
                        Node::reset(lhs);
                        break;
                    }
                    case Kind::Null:
                    {
                        node->setKind(Kind::Boolean);
                        node->setChildren({true});
                        Node::reset(lhs);
                        break;
                    }
                    case Kind::Boolean:
                    {
                        bool boolean = lhs->getChild<bool>(0);
                        node->setKind(Kind::Boolean);
                        node->setChildren({!boolean});
                        Node::reset(lhs);
                        break;
                    }
                    default:
                    {
                        auto count = getCount();
                        auto curr = lhs;
                        auto next = node;

                        for (int i = count - 1; i > (count % 2 == 0); i--)
                        {
                            std::swap(curr->getChildren(), next->getChildren());
                            std::swap(curr->getKind(), next->getKind());
                            Node::reset(curr);
                            curr = next;
                            next = next->getParent();
                        }
                        break;
                    }
                }
                break;
            }
            case OperatorKind::BNOT:
            {
                if (auto value = Operation::unaryBitwise(lhs, std::bit_not<>()))
                {
                    node->setKind(Kind::Numeric);
                    node->setChildren({Number(*value)});
                }
                break;
            }
            default:
            {
                break;
            }
        }
    }

    void rename(const p_Node& node)
    {
        if (!node)
        {
            return;
        }

        switch (node->getKind())
        {
            case Kind::Attribute:
            {
                rename(node->getChild<p_Node>(0));
                break;
            }

            case Kind::VariableList:
            case Kind::AttributeList:
            case Kind::NameList:
            case Kind::ParameterList:
            {
                auto list = node->getChild<p_NodeArray>(0);

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

    void refactor(const p_Node& node)
    {
        if (!node) return;

        switch (node->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto lhs = node->getChild<p_Node>(1);
                auto rhs = node->getChild<p_Node>(2);

                refactor(lhs);
                refactor(rhs);
                performBinaryOperation(node);
                break;
            }
            case Kind::UnaryOperation:
            {
                auto expression = node->getChild<p_Node>(1);

                refactor(expression);

                if (node->isKind(Kind::UnaryOperation))
                {
                    performUnaryOperation(node);
                }
                break;
            }

            case Kind::Identifier:
            {
                if (node->getParent() && node->getParent()->getKind() == Kind::TableNameValue)
                {
                    break;
                }

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
                auto lhs = node->getChild<p_Node>(0);
                auto rhs = node->getChild<p_Node>(1);
                refactor(lhs);
                refactor(rhs);
                break;
            }

            case Kind::TableIndexValue:
            {
                auto index = node->getChild<p_Node>(0);
                auto value = node->getChild<p_Node>(1);
                refactor(index);
                refactor(value);
                break;
            }
            case Kind::TableNameValue:
            {
                auto index = node->getChild<p_Node>(0);
                auto value = node->getChild<p_Node>(1);
                refactor(index);
                refactor(value);
                break;
            }
            case Kind::TableValue:
            {
                auto value = node->getChild<p_Node>(0);
                refactor(value);
                break;
            }
            case Kind::TableConstructor:
            {
                auto fieldList = node->getChild<p_Node>(0);
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
                auto list = node->getChild<p_NodeArray>(0);

                for (auto& baseNode: list)
                {
                    refactor(baseNode);
                }
                break;
            }
            case Kind::ArgumentList:
            {
                auto arguments = node->getChild<p_Node>(0);
                refactor(arguments);
                break;
            }

            case Kind::Block:
            {
                auto statements = node->getChild<p_NodeArray>(0);

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
                auto block = node->getChild<p_Node>(0);
                return refactor(block);
            }

            case Kind::FunctionCall:
            {
                auto root = node->getChild<p_Node>(0);
                auto args = node->getChild<p_Node>(1);
                refactor(root);
                refactor(args);
                break;
            }
            case Kind::FunctionDefinition:
            {
                auto name = node->getChild<p_Node>(0);
                auto body = node->getChild<p_Node>(1);
                rename(name);
                refactor(name);
                refactor(body);
                break;
            }
            case Kind::FunctionName:
            {
                auto name = node->getChild<p_Node>(0);
                refactor(name);
                break;
            }
            case Kind::FunctionBody:
            {
                auto parameters = node->getChild<p_Node>(0);
                auto block = node->getChild<p_Node>(1);
                scope.begin();
                rename(parameters);
                refactor(parameters);
                refactor(block);
                scope.end();
                break;
            }
            case Kind::Label:
            {
                auto name = node->getChild<p_Node>(0);
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
                    auto names = node->getChild<p_Node>(0);
                    auto expressions = node->getChild<p_Node>(1);
                    auto block = node->getChild<p_Node>(2);
                    rename(names);
                    refactor(names);
                    refactor(expressions);
                    refactor(block);
                }
                else
                {
                    auto name = node->getChild<p_Node>(0);
                    auto init = node->getChild<p_Node>(1);
                    auto goal = node->getChild<p_Node>(2);
                    auto step = node->getChild<p_Node>(3);
                    auto block = node->getChild<p_Node>(4);
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
                auto expressions = node->getChild<p_Node>(0);
                refactor(expressions);
                break;
            }
            case Kind::RepeatStatement:
            {
                auto conditionalBlock = node->getChild<p_Node>(0);
                auto condition = conditionalBlock->getChild<p_Node>(0);
                auto block = conditionalBlock->getChild<p_Node>(1);
                refactor(condition);
                refactor(block);
                break;
            }
            case Kind::WhileStatement:
            {
                auto conditionalBlock = node->getChild<p_Node>(0);
                auto condition = conditionalBlock->getChild<p_Node>(0);
                auto block = conditionalBlock->getChild<p_Node>(1);
                refactor(condition);
                refactor(block);
                break;
            }
            case Kind::IfStatement:
            {
                auto statements = node->getChild<p_NodeArray>(0);

                for (const auto& conditionalBlock: statements)
                {
                    auto condition = conditionalBlock->getChild<p_Node>(0);
                    auto block = conditionalBlock->getChild<p_Node>(1);
                    refactor(condition);
                    refactor(block);
                }
                break;
            }
            case Kind::DoStatement:
            {
                auto block = node->getChild<p_Node>(0);
                refactor(block);
                break;
            }
            case Kind::GotoStatement:
            {
                auto name = node->getChild<p_Node>(0);
                refactor(name);
                break;
            }
            case Kind::BreakStatement:
            {
                break;
            }
            case Kind::LocalStatement:
            {
                auto statement = node->getChild<p_Node>(0);
                rename(statement);
                refactor(statement);
                break;
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = node->getChild<p_Node>(0);
                auto rhs = node->getChild<p_Node>(1);

                refactor(rhs);
                // if (node->getParent()->getKind() == Kind::LocalStatement)
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
        std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

        Parser parser;
        auto chunk = parser.parse(source);

        Memory memory;
        memory.refactor(chunk);


        auto generatedString = toString(chunk, 0);

        if (!generatedString.empty() && generatedString.back() == '\n')
        {
            generatedString.pop_back();
        }

        std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

        std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count()
                  << "[ms]" << std::endl;

        return generatedString;
    }

    std::string concat(p_NodeArray array, const std::string& separator, std::size_t depth, bool skip_last = true)
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
    std::string format(std::string_view fmtString, Args&&... args)
    {
        return fmt::vformat(fmtString, fmt::make_format_args(args...));
    }

    static std::string space(const std::size_t& depth)
    {
        return std::string(depth * 4, ' ');
    }

    static int getPrecedence(const OperatorKind& opKind, bool isUnOp = false)
    {
        if (isUnOp)
        {
            return 11;
        }

        switch (opKind)
        {
            case OperatorKind::LOR:
            {
                return 1;
            }
            case OperatorKind::LAND:
            {
                return 2;
            }
            case OperatorKind::LT:
            case OperatorKind::GT:
            case OperatorKind::LE:
            case OperatorKind::GE:
            case OperatorKind::INEQ:
            case OperatorKind::EQ:
            {
                return 3;
            }
            case OperatorKind::BOR:
            {
                return 4;
            }
            case OperatorKind::BXOR:
            {
                return 5;
            }
            case OperatorKind::BAND:
            {
                return 6;
            }
            case OperatorKind::SHL:
            case OperatorKind::SHR:
            {
                return 7;
            }
            case OperatorKind::CONCAT:
            {
                return 8;
            }
            case OperatorKind::ADD:
            case OperatorKind::SUB:
            {
                return 9;
            }
            case OperatorKind::MUL:
            case OperatorKind::DIV:
            case OperatorKind::IDIV:
            case OperatorKind::MOD:
            {
                return 10;
            }
            case OperatorKind::POW:
            {
                return 12;
            }
            default:
            {
                return -1;
            }
        }
    }


    static std::string trim(const std::string& string)
    {
        auto lit = string.begin();
        while (lit != string.end() && isspace(*lit))
        {
            lit++;
        }

        auto rit = string.rbegin();
        while (rit.base() != lit && isspace(*rit))
        {
            rit++;
        }
        return {lit, rit.base()};
    }

    std::string toString(const p_Node& node, std::size_t depth = 0)
    {
        if (!node)
        {
            return "";
        }

        switch (node->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto binOp = node->getChild<OperatorKind>(0);
                auto lhs = node->getChild<p_Node>(1);
                auto rhs = node->getChild<p_Node>(2);

                std::string lhsFmt = "{0}";
                std::string rhsFmt = "{0}";


                if (lhs->isKind(Kind::BinaryOperation))
                {
                    auto lhsOp = lhs->getChild<OperatorKind>(0);

                    if (Util::getOperator(binOp) == "^" || Util::getOperator(binOp) == ".." || getPrecedence(lhsOp) < getPrecedence(binOp))
                    {
                        lhsFmt = "({0})";
                    }
                }

                if (rhs->isKind(Kind::BinaryOperation))
                {
                    auto rhsOp = rhs->getChild<OperatorKind>(0);

                    if (getPrecedence(rhsOp) < getPrecedence(binOp))
                    {
                        rhsFmt = "({0})";
                    }
                }

                return format(
                    "{0} {1} {2}",
                    format(lhsFmt, toString(lhs, depth)),
                    Util::getOperator(binOp),
                    format(rhsFmt, toString(rhs, depth))
                );
            }
            case Kind::UnaryOperation:
            {
                auto unOp = node->getChild<OperatorKind>(0);
                auto expression = node->getChild<p_Node>(1);

                std::string fmt = "{0}{1}{2}";

                switch (expression->getKind())
                {
                    case Kind::UnaryOperation:
                    {
                        auto innerOperator = expression->getChild<OperatorKind>(0);
                        if (unOp == OperatorKind::UNM && unOp == innerOperator)
                        {
                            fmt = "{0}{1}({2})";
                        }
                        break;
                    }
                    case Kind::BinaryOperation:
                    {
                        auto binOp = expression->getChild<OperatorKind>(0);
                        if (getPrecedence(binOp) < getPrecedence(unOp, true))
                        {
                            fmt = "{0}{1}({2})";
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }

                return format(
                    fmt,
                    Util::getOperator(unOp),
                    unOp == OperatorKind::LNOT ? " " : "",
                    toString(expression, depth)
                );
            }

            case Kind::Identifier:
            case Kind::Varargs:
            case Kind::String:
            case Kind::Null:
            {
                return node->getChild<std::string>(0);
            }
            case Kind::Numeric:
            {
                return node->getChild<Number>(0).toString();
            }
            case Kind::Boolean:
            {
                return node->getChild<bool>(0) ? "true" : "false";
            }


            case Kind::Attribute:
            {
                auto name = node->getChild<p_Node>(0);
                auto attribute = node->getChild<p_Node>(1);
                return format("{0}<{1}>", toString(name, depth), toString(attribute, depth));
            }
            case Kind::Member:
            {
                auto root = node->getChild<p_Node>(0);
                auto index = node->getChild<p_Node>(1);
                return format("{0}.{1}", toString(root, depth), toString(index, depth));
            }
            case Kind::Method:
            {
                auto root = node->getChild<p_Node>(0);
                auto index = node->getChild<p_Node>(1);
                return format("{0}:{1}", toString(root, depth), toString(index, depth));
            }
            case Kind::Index:
            {
                auto root = node->getChild<p_Node>(0);
                auto index = node->getChild<p_Node>(1);
                return format("{0}[{1}]", toString(root, depth), toString(index, depth));
            }

            case Kind::TableIndexValue:
            {
                auto index = node->getChild<p_Node>(0);
                auto value = node->getChild<p_Node>(1);
                return format("{0}[{1}] = {2}", space(depth), toString(index, depth), toString(value, depth));
            }
            case Kind::TableNameValue:
            {
                auto index = node->getChild<p_Node>(0);
                auto value = node->getChild<p_Node>(1);
                return format("{0}{1} = {2}", space(depth), toString(index, depth), toString(value, depth));
            }
            case Kind::TableValue:
            {
                auto value = node->getChild<p_Node>(0);
                return format("{0}{1}", space(depth), toString(value, depth));
            }
            case Kind::TableConstructor:
            {
                if (auto child = node->getChild<p_Node>(0))
                {
                    std::string fmt = "{{{0}{1}{2}{3}}}";
                    std::string str = toString(child, depth + 1);

                    if (str.find('\n') == std::string::npos)
                    {
                        fmt = "{{{1}}}";
                        str = trim(str);
                    }

                    return format(fmt, NEW_LINE, str, NEW_LINE, space(depth));
                }
                return "{}";
            }

            case Kind::ExpressionList:
            case Kind::AttributeList:
            case Kind::ParameterList:
            case Kind::VariableList:
            case Kind::NameList:
            {
                auto list = node->getChild<p_NodeArray>(0);
                return concat(list, ", ", depth);
            }
            case Kind::FieldList:
            {
                auto list = node->getChild<p_NodeArray>(0);
                return concat(list, ",\n", depth);
            }
            case Kind::ArgumentList:
            {
                auto arguments = node->getChild<p_Node>(0);
                return format("({0})", toString(arguments, depth));
            }

            case Kind::Block:
            {
                auto statements = node->getChild<p_NodeArray>(0);
                std::string statementString;

                auto n = statements.size();
                for (std::size_t i = 0; i < n; i++)
                {
                    auto& statement = statements[i];
                    auto string = toString(statement, depth);

                    if (statement->getKind() == Kind::Semicolon)
                    {
                        {
                            continue;
                        }

                        auto j = i;
                        while (i + 1 < n && statements[i + 1]->getKind() == Kind::Semicolon)
                        {
                            i++;
                        }

                        if (j == 0)
                        {
                            continue;
                        }

                        if (!statementString.empty() && statementString.back() == '\n')
                        {
                            statementString.pop_back();
                        }
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
                auto block = node->getChild<p_Node>(0);
                return toString(block);
            }

            case Kind::FunctionCall:
            {
                auto root = node->getChild<p_Node>(0);
                auto args = node->getChild<p_Node>(1);
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

                return format(fmt, toString(root, depth), toString(args, depth));
            }
            case Kind::FunctionDefinition:
            {
                auto name = node->getChild<p_Node>(0);
                auto body = node->getChild<p_Node>(1);
                return format("function{0}{1}{2}", !name ? "" : " ", toString(name, depth), toString(body, depth));
            }
            case Kind::FunctionName:
            {
                auto name = node->getChild<p_Node>(0);
                return toString(name, depth);
            }
            case Kind::FunctionBody:
            {
                auto parameters = node->getChild<p_Node>(0);
                auto block = node->getChild<p_Node>(1);
                std::string fmt = "({0}){1}{2}{3}end";

                if (!block)
                {
                    fmt = "({0}) end";
                }

                return format(fmt, toString(parameters, depth), NEW_LINE, toString(block, depth + 1), space(depth));
            }
            case Kind::Label:
            {
                auto name = node->getChild<p_Node>(0);
                return format("::{0}::", toString(name, depth));
            }
            case Kind::Semicolon:
            {
                return ";";
            }

            case Kind::ForStatement:
            {
                if (node->getSize() == 3)
                {
                    auto names = node->getChild<p_Node>(0);
                    auto expressions = node->getChild<p_Node>(1);
                    auto block = node->getChild<p_Node>(2);

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
                    auto name = node->getChild<p_Node>(0);
                    auto init = node->getChild<p_Node>(1);
                    auto goal = node->getChild<p_Node>(2);
                    auto step = node->getChild<p_Node>(3);
                    auto block = node->getChild<p_Node>(4);

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
                auto expressions = node->getChild<p_Node>(0);

                if (!expressions)
                {
                    return "return";
                }
                return format("return {0}", toString(expressions, depth));
            }
            case Kind::RepeatStatement:
            {
                auto conditionalBlock = node->getChild<p_Node>(0);
                auto condition = conditionalBlock->getChild<p_Node>(0);
                auto block = conditionalBlock->getChild<p_Node>(1);

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
                auto conditionalBlock = node->getChild<p_Node>(0);
                auto condition = conditionalBlock->getChild<p_Node>(0);
                auto block = conditionalBlock->getChild<p_Node>(1);

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
                auto statements = node->getChild<p_NodeArray>(0);

                std::string ifString;
                for (int i = 0; i < statements.size(); i++)
                {
                    auto conditionalBlock = statements[i];
                    auto condition = conditionalBlock->getChild<p_Node>(0);
                    auto block = conditionalBlock->getChild<p_Node>(1);

                    std::string fmt = "if {1} then{2}{3}";

                    if (!condition)
                    {
                        fmt = "{0}else{2}{3}";
                    }
                    else if (i > 0)
                    {
                        fmt = "{0}elseif {1} then{2}{3}";
                    }

                    ifString +=
                        format(fmt, space(depth), toString(condition, depth), NEW_LINE, toString(block, depth + 1));
                }

                ifString += format("{0}end", space(depth));
                return ifString;
            }
            case Kind::DoStatement:
            {
                auto block = node->getChild<p_Node>(0);
                return format("do{0}{1}{2}end", NEW_LINE, toString(block, depth + 1), space(depth));
            }
            case Kind::GotoStatement:
            {
                auto name = node->getChild<p_Node>(0);
                return format("goto {0}", toString(name, depth));
            }
            case Kind::BreakStatement:
            {
                return "break";
            }
            case Kind::LocalStatement:
            {
                auto statement = node->getChild<p_Node>(0);
                return format("local {0}", toString(statement, depth));
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = node->getChild<p_Node>(0);
                auto rhs = node->getChild<p_Node>(1);
                return format("{0} = {1}", toString(lhs, depth), toString(rhs, depth));
            }

            default:
            {
                return "";
            }
        }
    }
};


#endif