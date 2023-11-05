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



enum class OperatorKind
{
    ADD,
    SUB,
    MUL,
    DIV,
    IDIV,
    MOD,
    POW,
    UNM,
    BAND,
    BOR,
    BXOR,
    BNOT,
    SHL,
    SHR,
    CONCAT,
    LEN,
    LT,
    LE,
    GT,
    GE,
    EQ,
    INEQ,
    LNOT,
    LAND,
    LOR
};


class Node;

using p_Node = std::shared_ptr<Node>;
using p_NodeArray = std::vector<p_Node>;
using v_Variant = std::vector<std::variant<
    Number,
    bool,
    std::string,
    p_Node,
    p_NodeArray,
    OperatorKind
>>;


class Node : public std::enable_shared_from_this<Node>
{
private:
    std::size_t m_Index;
    v_Variant m_Children;
    p_Node m_Parent;
    Kind m_Kind;
public:
    explicit Node() : Node(Kind::Unknown)
    {
    }

    explicit Node(Kind kind)
    {
        m_Index = 0;
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
        // std::cout << getKindName(m_Kind) << " : " << typeid(T).name() << std::endl;
        return std::get<T>(m_Children[index]);
    }
    [[nodiscard]] p_Node getParent(const std::size_t& depth = 0);
    [[nodiscard]] Kind& getKind();
    [[nodiscard]] std::size_t getSize() const;
    [[nodiscard]] v_Variant& getChildren();
    [[nodiscard]] p_Node getPointer()
    {
        return shared_from_this();
    }
    [[nodiscard]] std::string toString(std::size_t depth) const;

    [[nodiscard]] bool isKind(Kind kind) const
    {
        return m_Kind == kind;
    }

    [[nodiscard]] p_Node& findNode(const p_Node& node)
    {
        for (std::size_t i = 0; i < m_Children.size(); i++)
        {
            if (std::holds_alternative<p_Node>(m_Children[i]))
            {
                if (getChild<p_Node>(i) == node)
                {
                    std::cout << "found: " << i << std::endl;
                    return getChild<p_Node>(i);
                }
                break;
            }
        }
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