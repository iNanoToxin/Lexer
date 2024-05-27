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


int get_unary_operation_count(const NodePointer& p_Node, OperatorKind p_OpKind);

class Scope : std::stack<std::map<std::string, std::pair<std::string, int>>>
{
private:
    std::vector<char> m_VariableChars;
    unsigned int m_VariableCount = 0;

public:
    Scope()
    {
        for (int i = 'a'; i <= 'z'; i++)
        {
            m_VariableChars.push_back(i);
        }
        for (int i = 'A'; i <= 'Z'; i++)
        {
            m_VariableChars.push_back(i);
        }
    }

    bool contains(const std::string& p_String)
    {
        auto scopes = *this;

        while (!scopes.empty())
        {
            if (scopes.top().contains(p_String))
            {
                return true;
            }
            scopes.pop();
        }
        return false;
    }

    std::string get(const std::string& p_String)
    {
        auto scopes = *this;

        while (!scopes.empty())
        {
            if (scopes.top().contains(p_String))
            {
                return scopes.top()[p_String].first;
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
            m_VariableCount -= var.second.second;
        }
        this->pop();
    }

    std::string getVariable(unsigned int p_Id)
    {
        std::string str;

        while (p_Id > 0)
        {
            p_Id--;
            str += m_VariableChars[p_Id % m_VariableChars.size()];
            p_Id /= m_VariableChars.size();
        }
        std::reverse(str.begin(), str.end());
        return str;
    }

    std::string nextVariable()
    {
        return getVariable(++m_VariableCount);
        // return "VAR_" + std::to_string(variableCount++);
    }

    void addVariable(const std::string& p_String)
    {
        if (!get(p_String).empty())
        {
            return;
        }

        auto& map = this->top();
        auto& var = map[p_String];
        var.first = nextVariable();
        var.second++;
    }
};


class Memory
{
public:
    Scope scope;

    static bool isUsedLocalVariable(const NodePointer& p_Node)
    {
        if (!p_Node)
        {
            return false;
        }

        if (auto parent = p_Node->getParent())
        {
            switch (parent->getKind())
            {
                case Kind::Attribute:
                {
                    if (parent->getChild<NodePointer>(1) == p_Node)
                    {
                        return false;
                    }
                    break;
                }
                case Kind::Member:
                case Kind::Method:
                {
                    auto lhs_child = parent->getChild<NodePointer>(0);
                    auto rhs_child = parent->getChild<NodePointer>(1);

                    if (lhs_child->getKind() != Kind::Identifier
                        || rhs_child->getKind() != Kind::Identifier
                        || lhs_child != p_Node)
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

    static bool isLocalVariable(const NodePointer& p_Node)
    {
        if (!p_Node)
        {
            return false;
        }

        if (auto parent = p_Node->getParent())
        {
            switch (parent->getKind())
            {
                case Kind::Attribute:
                {
                    if (parent->getChild<NodePointer>(0) != p_Node)
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

    static std::optional<bool> evaluate(const NodePointer& p_Node)
    {
        switch (p_Node->getKind())
        {
            case Kind::Boolean:
            {
                return p_Node->getChild<bool>(0);
            }
            case Kind::FunctionDefinition:
            case Kind::TableConstructor:
            case Kind::String:
            case Kind::Numeric:
            {
                return true;
            }
            case Kind::Null:
            {
                return false;
            }
            default:
            {
                return std::nullopt;
            }
        }
    };

    static bool isALlowedComparison(const NodePointer& p_Node)
    {
        switch (p_Node->getKind())
        {
            case Kind::FunctionDefinition:
            case Kind::TableConstructor:
            case Kind::String:
            case Kind::Numeric:
            case Kind::Boolean:
            case Kind::Null:
            {
                return true;
            }
            default:
            {
                return false;
            }
        }
    };

    static std::optional<bool> isLessThan(const NodePointer& p_Lhs, const NodePointer& p_Rhs)
    {
        if (p_Lhs->isKind(Kind::Numeric) && p_Rhs->isKind(Kind::Numeric))
        {
            return p_Lhs->getChild<Number>(0) < p_Rhs->getChild<Number>(0);
        }
        else if (p_Lhs->isKind(Kind::String) && p_Rhs->isKind(Kind::String))
        {
            const std::string& a = p_Lhs->getChild<std::string>(0);
            const std::string& b = p_Rhs->getChild<std::string>(0);
            return a.compare(b) < 0;
        }
        return std::nullopt;
    }

    static std::optional<bool> isLessThanOrEqualTo(const NodePointer& p_Lhs, const NodePointer& p_Rhs)
    {
        if (p_Lhs->isKind(Kind::Numeric) && p_Rhs->isKind(Kind::Numeric))
        {
            return p_Lhs->getChild<Number>(0) <= p_Rhs->getChild<Number>(0);
        }
        else if (p_Lhs->isKind(Kind::String) && p_Rhs->isKind(Kind::String))
        {
            const std::string& a = p_Lhs->getChild<std::string>(0);
            const std::string& b = p_Rhs->getChild<std::string>(0);
            return a.compare(b) <= 0;
        }
        return std::nullopt;
    }

    static void performBinaryOperation(const NodePointer& p_Node)
    {
        auto op_kind = p_Node->getChild<OperatorKind>(0);
        auto lhs = p_Node->getChild<NodePointer>(1);
        auto rhs = p_Node->getChild<NodePointer>(2);

        auto swap_with = [&](const NodePointer& p_Other)
        {
            std::swap(p_Node->getKind(), p_Other->getKind());
            std::swap(p_Node->getChildren(), p_Other->getChildren());
            Node::reset(lhs);
            Node::reset(rhs);
        };

        auto compute_arith = [&](auto p_Func)
        {
            if (auto value = Operation::arithmetic(lhs, rhs, p_Func))
            {
                p_Node->setKind(Kind::Numeric);
                p_Node->setChildren({Number(*value)});
                Node::reset(lhs);
                Node::reset(rhs);
            }
        };

        auto compute_bit = [&](auto p_Func)
        {
            if (auto value = Operation::bitwise(lhs, rhs, p_Func))
            {
                p_Node->setKind(Kind::Numeric);
                p_Node->setChildren({Number(*value)});
                Node::reset(lhs);
                Node::reset(rhs);
            }
        };

        auto set = [&](const Kind& p_Kind, const NodeChildren& p_Children)
        {
            p_Node->setKind(p_Kind);
            p_Node->setChildren(p_Children);
            Node::reset(lhs);
            Node::reset(rhs);
        };



        switch (op_kind)
        {
            case OperatorKind::ADD:
            {
                if (rhs->isKind(Kind::UnaryOperation) && rhs->getChild<OperatorKind>(0) == OperatorKind::UNM)
                {
                    auto next_rhs = rhs->getChild<NodePointer>(1);
                    Node::swap(rhs, next_rhs);
                    Node::reset(next_rhs);
                    p_Node->getChild<OperatorKind>(0) = OperatorKind::SUB;
                    compute_arith(Operation::Sub());
                    break;
                }
                else if (rhs->isKind(Kind::Numeric) && rhs->getChild<Number>(0).value < 0)
                {
                    rhs->getChild<Number>(0).value *= -1;
                    p_Node->getChild<OperatorKind>(0) = OperatorKind::SUB;
                    compute_arith(Operation::Sub());
                    break;
                }
                compute_arith(Operation::Add());
                break;
            }
            case OperatorKind::SUB:
            {
                compute_arith(Operation::Sub());
                break;
            }
            case OperatorKind::MUL:
            {
                compute_arith(Operation::Mul());
                break;
            }
            case OperatorKind::DIV:
            {
                compute_arith(Operation::Div());
                break;
            }
            case OperatorKind::IDIV:
            {
                compute_arith(Operation::Idiv());
                break;
            }
            case OperatorKind::MOD:
            {
                compute_arith(Operation::Mod());
                break;
            }
            case OperatorKind::POW:
            {
                compute_arith(Operation::Pow());
                break;
            }
            case OperatorKind::BAND:
            {
                compute_bit(Operation::Band());
                break;
            }
            case OperatorKind::BOR:
            {
                compute_bit(Operation::Bor());
                break;
            }
            case OperatorKind::BXOR:
            {
                compute_bit(Operation::Bxor());
                break;
            }
            case OperatorKind::SHL:
            {
                compute_bit(Operation::Shl());
                break;
            }
            case OperatorKind::SHR:
            {
                compute_bit(Operation::Shr());
                break;
            }
            case OperatorKind::CONCAT:
            {
                auto l = Util::to_string(lhs);
                auto r = Util::to_string(rhs);

                if (l && r)
                {
                    set(Kind::String, {Util::quote(Util::unquote(*l) + Util::unquote(*r))});
                }
                break;
            }

            case OperatorKind::LAND:
            {
                auto lhs_e = evaluate(lhs);
                auto rhs_e = evaluate(lhs);

                if (lhs_e && rhs_e)
                {
                    swap_with((*lhs_e && *rhs_e) ? rhs : lhs);
                }
                break;
            }
            case OperatorKind::LOR:
            {
                auto lhs_e = evaluate(lhs);
                auto rhs_e = evaluate(lhs);

                if (lhs_e && rhs_e)
                {
                    swap_with(*lhs_e ? lhs : rhs);
                }

                break;
            }

            case OperatorKind::LT:
            {
                if (auto value = isLessThan(lhs, rhs))
                {
                    set(Kind::Boolean, {*value});
                }
                break;
            }
            case OperatorKind::GT:
            {
                if (auto value = isLessThan(rhs, lhs))
                {
                    set(Kind::Boolean, {*value});
                }
                break;
            }

            case OperatorKind::EQ:
            {
                /*if (auto boolean = Operation::compare(lhs, rhs, std::equal_to<>()))
                {
                    node->setKind(Kind::Boolean);
                    node->setChildren({*boolean});
                    Node::reset(lhs);
                    Node::reset(rhs);
                }*/

                /*switch (lhs->getKind())
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
                }*/


                break;
            }

            default:
            {
                break;
            }
        }
    }

    static void performUnaryOperation(const NodePointer& p_Node)
    {
        auto op_kind = p_Node->getChild<OperatorKind>(0);
        auto lhs = p_Node->getChild<NodePointer>(1);

        switch (op_kind)
        {
            case OperatorKind::UNM:
            {
                if (auto value = Operation::unary_arithmetic(lhs, std::negate<>()))
                {
                    p_Node->setKind(Kind::Numeric);
                    p_Node->setChildren({Number(*value)});
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

                    p_Node->setKind(Kind::Numeric);
                    p_Node->setChildren({Number(s.size() - i * 2)});
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
                        p_Node->setKind(Kind::Boolean);
                        p_Node->setChildren({false});
                        Node::reset(lhs);
                        break;
                    }
                    case Kind::Null:
                    {
                        p_Node->setKind(Kind::Boolean);
                        p_Node->setChildren({true});
                        Node::reset(lhs);
                        break;
                    }
                    case Kind::Boolean:
                    {
                        bool boolean = lhs->getChild<bool>(0);
                        p_Node->setKind(Kind::Boolean);
                        p_Node->setChildren({!boolean});
                        Node::reset(lhs);
                        break;
                    }
                    default:
                    {
                        auto count = get_unary_operation_count(p_Node, op_kind);
                        auto curr = lhs;
                        auto next = p_Node;

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
                if (auto value = Operation::unary_bitwise(lhs, std::bit_not<>()))
                {
                    p_Node->setKind(Kind::Numeric);
                    p_Node->setChildren({Number(*value)});
                }
                break;
            }
            default:
            {
                break;
            }
        }
    }

    void rename(const NodePointer& p_Node)
    {
        {
            return;
        }
        if (!p_Node)
        {
            return;
        }

        switch (p_Node->getKind())
        {
            case Kind::Attribute:
            {
                rename(p_Node->getChild<NodePointer>(0));
                break;
            }

            case Kind::VariableList:
            case Kind::AttributeList:
            case Kind::NameList:
            case Kind::ParameterList:
            {
                auto list = p_Node->getChild<NodeArray>(0);

                for (auto& var: list)
                {
                    rename(var);
                }
                break;
            }

            case Kind::Identifier:
            {
                scope.addVariable(p_Node->getChild<std::string>(0));
                break;
            }

            default:
            {
                break;
            }
        }
    }

    void refactor(const NodePointer& p_Node)
    {
        if (!p_Node) return;

        switch (p_Node->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto lhs = p_Node->getChild<NodePointer>(1);
                auto rhs = p_Node->getChild<NodePointer>(2);

                refactor(lhs);
                refactor(rhs);
                performBinaryOperation(p_Node);
                break;
            }
            case Kind::UnaryOperation:
            {
                auto expression = p_Node->getChild<NodePointer>(1);

                refactor(expression);

                if (p_Node->isKind(Kind::UnaryOperation))
                {
                    performUnaryOperation(p_Node);
                }
                break;
            }

            case Kind::Identifier:
            {
                if (p_Node->getParent() && p_Node->getParent()->getKind() == Kind::TableNameValue)
                {
                    break;
                }

                auto& name = p_Node->getChild<std::string>(0);
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
                auto lhs = p_Node->getChild<NodePointer>(0);
                auto rhs = p_Node->getChild<NodePointer>(1);
                refactor(lhs);
                refactor(rhs);
                break;
            }

            case Kind::TableIndexValue:
            {
                auto index = p_Node->getChild<NodePointer>(0);
                auto value = p_Node->getChild<NodePointer>(1);
                refactor(index);
                refactor(value);
                break;
            }
            case Kind::TableNameValue:
            {
                auto index = p_Node->getChild<NodePointer>(0);
                auto value = p_Node->getChild<NodePointer>(1);
                refactor(index);
                refactor(value);
                break;
            }
            case Kind::TableValue:
            {
                auto value = p_Node->getChild<NodePointer>(0);
                refactor(value);
                break;
            }
            case Kind::TableConstructor:
            {
                auto field_list = p_Node->getChild<NodePointer>(0);
                refactor(field_list);
                break;
            }

            case Kind::ExpressionList:
            case Kind::AttributeList:
            case Kind::ParameterList:
            case Kind::VariableList:
            case Kind::NameList:
            case Kind::FieldList:
            {
                auto list = p_Node->getChild<NodeArray>(0);

                for (auto& base_node: list)
                {
                    refactor(base_node);
                }
                break;
            }
            case Kind::ArgumentList:
            {
                auto arguments = p_Node->getChild<NodePointer>(0);
                refactor(arguments);
                break;
            }

            case Kind::Block:
            {
                auto statements = p_Node->getChild<NodeArray>(0);

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
                auto block = p_Node->getChild<NodePointer>(0);
                return refactor(block);
            }

            case Kind::FunctionCall:
            {
                auto root = p_Node->getChild<NodePointer>(0);
                auto args = p_Node->getChild<NodePointer>(1);
                refactor(root);
                refactor(args);
                break;
            }
            case Kind::FunctionDefinition:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                auto body = p_Node->getChild<NodePointer>(1);
                rename(name);
                refactor(name);
                refactor(body);
                break;
            }
            case Kind::FunctionName:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                refactor(name);
                break;
            }
            case Kind::FunctionBody:
            {
                auto parameters = p_Node->getChild<NodePointer>(0);
                auto block = p_Node->getChild<NodePointer>(1);
                scope.begin();
                rename(parameters);
                refactor(parameters);
                refactor(block);
                scope.end();
                break;
            }
            case Kind::Label:
            {
                auto name = p_Node->getChild<NodePointer>(0);
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
                if (p_Node->getSize() == 3)
                {
                    auto names = p_Node->getChild<NodePointer>(0);
                    auto expressions = p_Node->getChild<NodePointer>(1);
                    auto block = p_Node->getChild<NodePointer>(2);
                    rename(names);
                    refactor(names);
                    refactor(expressions);
                    refactor(block);
                }
                else
                {
                    auto name = p_Node->getChild<NodePointer>(0);
                    auto init = p_Node->getChild<NodePointer>(1);
                    auto goal = p_Node->getChild<NodePointer>(2);
                    auto step = p_Node->getChild<NodePointer>(3);
                    auto block = p_Node->getChild<NodePointer>(4);
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
                auto expressions = p_Node->getChild<NodePointer>(0);
                refactor(expressions);
                break;
            }
            case Kind::RepeatStatement:
            {
                auto conditional_block = p_Node->getChild<NodePointer>(0);
                auto condition = conditional_block->getChild<NodePointer>(0);
                auto block = conditional_block->getChild<NodePointer>(1);
                refactor(condition);
                refactor(block);
                break;
            }
            case Kind::WhileStatement:
            {
                auto conditional_block = p_Node->getChild<NodePointer>(0);
                auto condition = conditional_block->getChild<NodePointer>(0);
                auto block = conditional_block->getChild<NodePointer>(1);
                refactor(condition);
                refactor(block);
                break;
            }
            case Kind::IfStatement:
            {
                auto statements = p_Node->getChild<NodeArray>(0);

                for (const auto& conditional_block: statements)
                {
                    auto condition = conditional_block->getChild<NodePointer>(0);
                    auto block = conditional_block->getChild<NodePointer>(1);
                    refactor(condition);
                    refactor(block);
                }
                break;
            }
            case Kind::DoStatement:
            {
                auto block = p_Node->getChild<NodePointer>(0);
                refactor(block);
                break;
            }
            case Kind::GotoStatement:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                refactor(name);
                break;
            }
            case Kind::BreakStatement:
            {
                break;
            }
            case Kind::LocalStatement:
            {
                auto statement = p_Node->getChild<NodePointer>(0);
                rename(statement);
                refactor(statement);
                break;
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = p_Node->getChild<NodePointer>(0);
                auto rhs = p_Node->getChild<NodePointer>(1);

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
    std::string generate(const std::string& p_Source)
    {
        std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

        Parser parser;
        auto chunk = parser.parse(p_Source);

        Memory memory;
        memory.refactor(chunk);


        auto generated_string = toString(chunk, 0);

        if (!generated_string.empty() && generated_string.back() == '\n')
        {
            generated_string.pop_back();
        }

        std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

        std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count()
                  << "[ms]" << std::endl;

        return generated_string;
    }

    std::string concat(NodeArray p_Array, const std::string& p_Separator, std::size_t p_Depth, bool p_SkipLast = true)
    {
        std::string merged_string;
        auto it = p_Array.begin();

        while (it != p_Array.end())
        {
            merged_string += toString(*it, p_Depth);
            it++;
            if (!(p_SkipLast && it == p_Array.end()))
            {
                merged_string += p_Separator;
            }
        }
        return merged_string;
    }

    template <typename... Args>
    std::string format(std::string_view p_FmtString, Args&&... p_Args)
    {
        return fmt::vformat(p_FmtString, fmt::make_format_args(p_Args...));
    }

    static std::string space(const std::size_t& p_Depth)
    {
        return std::string(p_Depth * 4, ' ');
    }

    static int getPrecedence(const OperatorKind& p_OpKind, bool p_IsUnOp = false)
    {
        if (p_IsUnOp)
        {
            return 11;
        }

        switch (p_OpKind)
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


    static std::string trim(const std::string& p_String)
    {
        auto lit = p_String.begin();
        while (lit != p_String.end() && isspace(*lit))
        {
            lit++;
        }

        auto rit = p_String.rbegin();
        while (rit.base() != lit && isspace(*rit))
        {
            rit++;
        }
        return {lit, rit.base()};
    }

    std::string toString(const NodePointer& p_Node, std::size_t p_Depth = 0)
    {
        if (!p_Node)
        {
            return "";
        }

        switch (p_Node->getKind())
        {
            case Kind::BinaryOperation:
            {
                auto bin_op = p_Node->getChild<OperatorKind>(0);
                auto lhs = p_Node->getChild<NodePointer>(1);
                auto rhs = p_Node->getChild<NodePointer>(2);

                std::string lhs_fmt = "{0}";
                std::string rhs_fmt = "{0}";


                if (lhs->isKind(Kind::BinaryOperation))
                {
                    auto lhs_op = lhs->getChild<OperatorKind>(0);

                    if (Util::get_operator(bin_op) == "^" || Util::get_operator(bin_op) == ".." || getPrecedence(lhs_op) < getPrecedence(bin_op))
                    {
                        lhs_fmt = "({0})";
                    }
                }

                if (rhs->isKind(Kind::BinaryOperation))
                {
                    auto rhs_op = rhs->getChild<OperatorKind>(0);

                    if (getPrecedence(rhs_op) < getPrecedence(bin_op))
                    {
                        rhs_fmt = "({0})";
                    }
                }

                return format(
                    "{0} {1} {2}",
                    format(lhs_fmt, toString(lhs, p_Depth)),
                    Util::get_operator(bin_op),
                    format(rhs_fmt, toString(rhs, p_Depth))
                );
            }
            case Kind::UnaryOperation:
            {
                auto un_op = p_Node->getChild<OperatorKind>(0);
                auto expression = p_Node->getChild<NodePointer>(1);

                std::string fmt = "{0}{1}{2}";

                switch (expression->getKind())
                {
                    case Kind::UnaryOperation:
                    {
                        auto inner_operator = expression->getChild<OperatorKind>(0);
                        if (un_op == OperatorKind::UNM && un_op == inner_operator)
                        {
                            fmt = "{0}{1}({2})";
                        }
                        break;
                    }
                    case Kind::BinaryOperation:
                    {
                        auto bin_op = expression->getChild<OperatorKind>(0);
                        if (getPrecedence(bin_op) < getPrecedence(un_op, true))
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
                    Util::get_operator(un_op),
                    un_op == OperatorKind::LNOT ? " " : "",
                    toString(expression, p_Depth)
                );
            }

            case Kind::Identifier:
            case Kind::Varargs:
            case Kind::String:
            case Kind::Null:
            {
                return p_Node->getChild<std::string>(0);
            }
            case Kind::Numeric:
            {
                return p_Node->getChild<Number>(0).toString();
            }
            case Kind::Boolean:
            {
                return p_Node->getChild<bool>(0) ? "true" : "false";
            }


            case Kind::Attribute:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                auto attribute = p_Node->getChild<NodePointer>(1);
                return format("{0}<{1}>", toString(name, p_Depth), toString(attribute, p_Depth));
            }
            case Kind::Member:
            {
                auto root = p_Node->getChild<NodePointer>(0);
                auto index = p_Node->getChild<NodePointer>(1);
                return format("{0}.{1}", toString(root, p_Depth), toString(index, p_Depth));
            }
            case Kind::Method:
            {
                auto root = p_Node->getChild<NodePointer>(0);
                auto index = p_Node->getChild<NodePointer>(1);
                return format("{0}:{1}", toString(root, p_Depth), toString(index, p_Depth));
            }
            case Kind::Index:
            {
                auto root = p_Node->getChild<NodePointer>(0);
                auto index = p_Node->getChild<NodePointer>(1);
                return format("{0}[{1}]", toString(root, p_Depth), toString(index, p_Depth));
            }

            case Kind::TableIndexValue:
            {
                auto index = p_Node->getChild<NodePointer>(0);
                auto value = p_Node->getChild<NodePointer>(1);
                return format("{0}[{1}] = {2}", space(p_Depth), toString(index, p_Depth), toString(value, p_Depth));
            }
            case Kind::TableNameValue:
            {
                auto index = p_Node->getChild<NodePointer>(0);
                auto value = p_Node->getChild<NodePointer>(1);
                return format("{0}{1} = {2}", space(p_Depth), toString(index, p_Depth), toString(value, p_Depth));
            }
            case Kind::TableValue:
            {
                auto value = p_Node->getChild<NodePointer>(0);
                return format("{0}{1}", space(p_Depth), toString(value, p_Depth));
            }
            case Kind::TableConstructor:
            {
                if (auto child = p_Node->getChild<NodePointer>(0))
                {
                    std::string fmt = "{{{0}{1}{2}{3}}}";
                    std::string str = toString(child, p_Depth + 1);

                    if (str.find('\n') == std::string::npos)
                    {
                        fmt = "{{{1}}}";
                        str = trim(str);
                    }

                    return format(fmt, NEW_LINE, str, NEW_LINE, space(p_Depth));
                }
                return "{}";
            }

            case Kind::ExpressionList:
            case Kind::AttributeList:
            case Kind::ParameterList:
            case Kind::VariableList:
            case Kind::NameList:
            {
                auto list = p_Node->getChild<NodeArray>(0);
                return concat(list, ", ", p_Depth);
            }
            case Kind::FieldList:
            {
                auto list = p_Node->getChild<NodeArray>(0);
                return concat(list, ",\n", p_Depth);
            }
            case Kind::ArgumentList:
            {
                auto arguments = p_Node->getChild<NodePointer>(0);
                return format("({0})", toString(arguments, p_Depth));
            }

            case Kind::Block:
            {
                auto statements = p_Node->getChild<NodeArray>(0);
                std::string statement_string;

                auto n = statements.size();
                for (std::size_t i = 0; i < n; i++)
                {
                    auto& statement = statements[i];
                    auto string = toString(statement, p_Depth);

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

                        if (!statement_string.empty() && statement_string.back() == '\n')
                        {
                            statement_string.pop_back();
                        }
                    }
                    else
                    {
                        statement_string += space(p_Depth);
                    }
                    statement_string += string;
                    statement_string += "\n";
                }
                return statement_string;
            }
            case Kind::Chunk:
            {
                auto block = p_Node->getChild<NodePointer>(0);
                return toString(block);
            }

            case Kind::FunctionCall:
            {
                auto root = p_Node->getChild<NodePointer>(0);
                auto args = p_Node->getChild<NodePointer>(1);
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

                return format(fmt, toString(root, p_Depth), toString(args, p_Depth));
            }
            case Kind::FunctionDefinition:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                auto body = p_Node->getChild<NodePointer>(1);
                return format("function{0}{1}{2}", !name ? "" : " ", toString(name, p_Depth), toString(body, p_Depth));
            }
            case Kind::FunctionName:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                return toString(name, p_Depth);
            }
            case Kind::FunctionBody:
            {
                auto parameters = p_Node->getChild<NodePointer>(0);
                auto block = p_Node->getChild<NodePointer>(1);
                std::string fmt = "({0}){1}{2}{3}end";

                if (!block)
                {
                    fmt = "({0}) end";
                }

                return format(fmt, toString(parameters, p_Depth), NEW_LINE, toString(block, p_Depth + 1), space(p_Depth));
            }
            case Kind::Label:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                return format("::{0}::", toString(name, p_Depth));
            }
            case Kind::Semicolon:
            {
                return ";";
            }

            case Kind::ForStatement:
            {
                if (p_Node->getSize() == 3)
                {
                    auto names = p_Node->getChild<NodePointer>(0);
                    auto expressions = p_Node->getChild<NodePointer>(1);
                    auto block = p_Node->getChild<NodePointer>(2);

                    return format(
                        "for {0} in {1} do{2}{3}{4}end",
                        toString(names, p_Depth),
                        toString(expressions, p_Depth),
                        NEW_LINE,
                        toString(block, p_Depth + 1),
                        space(p_Depth)
                    );
                }
                else
                {
                    auto name = p_Node->getChild<NodePointer>(0);
                    auto init = p_Node->getChild<NodePointer>(1);
                    auto goal = p_Node->getChild<NodePointer>(2);
                    auto step = p_Node->getChild<NodePointer>(3);
                    auto block = p_Node->getChild<NodePointer>(4);

                    std::string fmt = "for {0} = {1}, {2}, {3} do{4}{5}{6}end";

                    if (!step)
                    {
                        fmt = "for {0} = {1}, {2} do{4}{5}{6}end";
                    }

                    return format(
                        fmt,
                        toString(name, 0),
                        toString(init, p_Depth),
                        toString(goal, p_Depth),
                        toString(step, p_Depth),
                        NEW_LINE,
                        toString(block, p_Depth + 1),
                        space(p_Depth)
                    );
                }
            }
            case Kind::ReturnStatement:
            {
                auto expressions = p_Node->getChild<NodePointer>(0);

                if (!expressions)
                {
                    return "return";
                }
                return format("return {0}", toString(expressions, p_Depth));
            }
            case Kind::RepeatStatement:
            {
                auto conditional_block = p_Node->getChild<NodePointer>(0);
                auto condition = conditional_block->getChild<NodePointer>(0);
                auto block = conditional_block->getChild<NodePointer>(1);

                return format(
                    "repeat{0}{1}{2}until {3}",
                    NEW_LINE,
                    toString(block, p_Depth + 1),
                    space(p_Depth),
                    toString(condition, p_Depth)
                );
            }
            case Kind::WhileStatement:
            {
                auto conditional_block = p_Node->getChild<NodePointer>(0);
                auto condition = conditional_block->getChild<NodePointer>(0);
                auto block = conditional_block->getChild<NodePointer>(1);

                return format(
                    "while {0} do{1}{2}{3}end",
                    toString(condition, p_Depth),
                    NEW_LINE,
                    toString(block, p_Depth + 1),
                    space(p_Depth)
                );
            }
            case Kind::IfStatement:
            {
                auto statements = p_Node->getChild<NodeArray>(0);

                std::string if_string;
                for (int i = 0; i < statements.size(); i++)
                {
                    auto conditional_block = statements[i];
                    auto condition = conditional_block->getChild<NodePointer>(0);
                    auto block = conditional_block->getChild<NodePointer>(1);

                    std::string fmt = "if {1} then{2}{3}";

                    if (!condition)
                    {
                        fmt = "{0}else{2}{3}";
                    }
                    else if (i > 0)
                    {
                        fmt = "{0}elseif {1} then{2}{3}";
                    }

                    if_string +=
                        format(fmt, space(p_Depth), toString(condition, p_Depth), NEW_LINE, toString(block, p_Depth + 1));
                }

                if_string += format("{0}end", space(p_Depth));
                return if_string;
            }
            case Kind::DoStatement:
            {
                auto block = p_Node->getChild<NodePointer>(0);
                return format("do{0}{1}{2}end", NEW_LINE, toString(block, p_Depth + 1), space(p_Depth));
            }
            case Kind::GotoStatement:
            {
                auto name = p_Node->getChild<NodePointer>(0);
                return format("goto {0}", toString(name, p_Depth));
            }
            case Kind::BreakStatement:
            {
                return "break";
            }
            case Kind::LocalStatement:
            {
                auto statement = p_Node->getChild<NodePointer>(0);
                return format("local {0}", toString(statement, p_Depth));
            }
            case Kind::AssignmentStatement:
            {
                auto lhs = p_Node->getChild<NodePointer>(0);
                auto rhs = p_Node->getChild<NodePointer>(1);
                return format("{0} = {1}", toString(lhs, p_Depth), toString(rhs, p_Depth));
            }

            default:
            {
                return "";
            }
        }
    }
};


#endif
