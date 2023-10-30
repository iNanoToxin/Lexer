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
using v_Variant = std::vector<std::variant<Number, std::string, p_Node, p_NodeArray>>;


class Node
{
private:
    v_Variant m_Children;
    p_Node m_Parent;
    Kind m_Kind;
    p_Node m_Pointer;
    std::size_t m_Size;

    static std::size_t getSize(Kind kind)
    {
        switch (kind)
        {
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
            case Kind::Semicolon:
            case Kind::Chunk:
            case Kind::Block:
            case Kind::Label:
            case Kind::IfStatement:
            case Kind::DoStatement:
            case Kind::GotoStatement:
            case Kind::BreakStatement:
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
    explicit Node() : Node(Kind::Unknown, 0)
    {
    }

    explicit Node(Kind kind) : Node(kind, getSize(kind))
    {
    }

    explicit Node(Kind kind, std::size_t size)
    {
        m_Kind = kind;
        m_Parent = nullptr;
        m_Size = size;
        m_Children = {};
        m_Pointer = nullptr;
    }

    [[nodiscard]] static p_Node create()
    {
        return std::make_shared<Node>();
    }
    [[nodiscard]] static p_Node create(Kind kind)
    {
        return std::make_shared<Node>(kind);
    }
    [[nodiscard]] static p_Node create(Kind kind, std::size_t size)
    {
        return std::make_shared<Node>(kind, size);
    }


    void setChildren(v_Variant children);
    void setParent(const p_Node& parent);
    void setKind(Kind kind);
    void setSize(const std::size_t& size);

    template <typename T>
    [[nodiscard]] T& getChild(const std::size_t& index)
    {
        return std::get<T>(m_Children[index]);
    }
    [[nodiscard]] p_Node getParent(const std::size_t& depth = 0);
    [[nodiscard]] std::size_t getSize() const;
    [[nodiscard]] Kind getKind() const;
    [[nodiscard]] v_Variant getChildren();
    [[nodiscard]] p_Node getPointer()
    {
        return nullptr;
    }
    [[nodiscard]] std::string toString(std::size_t depth) const;



    static void reset(const p_Node& node)
    {
        node->setParent(nullptr);
        node->setSize(0);
        node->setChildren({});
        node->setKind(Kind::Unknown);
    }

    static void swap(const p_Node& lhs, const p_Node& rhs)
    {
        std::swap(lhs->m_Parent, rhs->m_Parent);
        std::swap(lhs->m_Size, rhs->m_Size);
        std::swap(lhs->m_Kind, rhs->m_Kind);
        std::swap(lhs->m_Children, rhs->m_Children);
    }
};


#endif