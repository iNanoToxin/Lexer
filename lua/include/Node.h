#ifndef LUA_NODE_H
#define LUA_NODE_H

#include <iostream>
#include <memory>
#include <variant>
#include <vector>
#include <string>
#include <Kind.h>
#include <Number.h>
#include <fmt/core.h>

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


class Node;

using p_Node = std::shared_ptr<Node>;
using p_NodeArray = std::vector<p_Node>;
using v_Variant = std::vector<std::variant<Number, bool, std::string, p_Node, p_NodeArray>>;


class Node : public std::enable_shared_from_this<Node>
{
private:
    v_Variant m_Children;
    p_Node m_Parent;
    Kind m_Kind;

    static std::size_t getSize(Kind kind)
    {
        switch (kind)
        {
            case Kind::BreakStatement:
            case Kind::Semicolon:
            case Kind::Unknown:
            {
                return 0;
            }
            case Kind::ExpressionList:
            case Kind::AttributeList:
            case Kind::ParameterList:
            case Kind::NameList:
            case Kind::FieldList:
            case Kind::ArgumentList:
            case Kind::VariableList:
            case Kind::TableConstructor:
            case Kind::TableValue:
            case Kind::FunctionName:
            case Kind::String:
            case Kind::Numeric:
            case Kind::Boolean:
            case Kind::Null:
            case Kind::Varargs:
            case Kind::Identifier:
            case Kind::Chunk:
            case Kind::Block:
            case Kind::Label:
            case Kind::IfStatement:
            case Kind::DoStatement:
            case Kind::GotoStatement:

            case Kind::LocalStatement:
            case Kind::WhileStatement:
            case Kind::ReturnStatement:
            case Kind::RepeatStatement:
            case Kind::AssignmentStatement:
            {
                return 1;
            }
            case Kind::ConditionalBlock:
            case Kind::TableIndexValue:
            case Kind::TableNameValue:
            case Kind::Attribute:
            case Kind::Member:
            case Kind::Index:
            case Kind::Method:
            case Kind::UnaryOperation:
            case Kind::FunctionCall:
            case Kind::FunctionBody:
            case Kind::FunctionDefinition:
            {
                return 2;
            }
            case Kind::BinaryOperation:
            case Kind::ForStatement:
            {
                return 3;
            }
        }
    }


public:
    explicit Node() : Node(Kind::Unknown)
    {
    }

    explicit Node(Kind kind)
    {
        m_Kind = kind;
        m_Parent = nullptr;
        m_Children = {};
    }

    [[nodiscard]] static p_Node create()
    {
        return std::make_shared<Node>();
    }
    [[nodiscard]] static p_Node create(Kind kind)
    {
        return std::make_shared<Node>(kind);
    }


    void setChildren(v_Variant children);
    void setParent(const p_Node& parent);
    void setKind(Kind kind);

    template <typename T>
    [[nodiscard]] T& getChild(const std::size_t& index)
    {
        return std::get<T>(m_Children[index]);
    }
    [[nodiscard]] p_Node getParent(const std::size_t& depth = 0);
    [[nodiscard]] Kind getKind() const;
    [[nodiscard]] std::size_t getSize() const;
    [[nodiscard]] v_Variant getChildren();
    [[nodiscard]] p_Node getPointer()
    {
        return shared_from_this();
    }
    [[nodiscard]] std::string toString(std::size_t depth) const;

    [[nodiscard]] bool isKind(Kind kind) const
    {
        return m_Kind == kind;
    }

    static void reset(const p_Node& node)
    {
        node->setParent(nullptr);
        node->setChildren({});
        node->setKind(Kind::Unknown);
    }

    static void swap(const p_Node& lhs, const p_Node& rhs)
    {
        std::swap(lhs->m_Parent, rhs->m_Parent);
        std::swap(lhs->m_Kind, rhs->m_Kind);
        std::swap(lhs->m_Children, rhs->m_Children);
    }
};


#endif