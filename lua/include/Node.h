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
    NOT_EQ,
    LNOT,
    LAND,
    LOR
};


class Node;

using NodePointer = std::shared_ptr<Node>;
using NodeArray = std::vector<NodePointer>;
using NodeVariant = std::variant<
    Number,
    bool,
    std::string,
    NodePointer,
    NodeArray,
    OperatorKind
>;
using NodeChildren = std::vector<NodeVariant>;


class Node : public std::enable_shared_from_this<Node>
{
private:
    std::size_t m_Index;
    NodeChildren m_Children;
    NodePointer m_Parent;
    Kind m_Kind;
public:
    explicit Node() : Node(Kind::Unknown)
    {
    }

    explicit Node(Kind p_Kind)
    {
        m_Index = 0;
        m_Kind = p_Kind;
        m_Parent = nullptr;
        m_Children = {};
    }

    [[nodiscard]] static NodePointer create()
    {
        return std::make_shared<Node>();
    }
    [[nodiscard]] static NodePointer create(Kind p_Kind)
    {
        return std::make_shared<Node>(p_Kind);
    }


    void setChildren(NodeChildren p_Children);
    void setParent(const NodePointer& p_Parent);
    void setKind(Kind p_Kind);

    template <typename T>
    [[nodiscard]] T& getChild(const std::size_t& p_Index)
    {
        // std::cout << getKindName(m_Kind) << " : " << typeid(T).name() << std::endl;
        return std::get<T>(m_Children[p_Index]);
    }
    [[nodiscard]] NodePointer getParent(const std::size_t& p_Depth = 0);
    [[nodiscard]] Kind& getKind();
    [[nodiscard]] std::size_t getSize() const;
    [[nodiscard]] NodeChildren& getChildren();
    [[nodiscard]] NodePointer getPointer()
    {
        return shared_from_this();
    }
    [[nodiscard]] std::string toString(std::size_t p_Depth) const;

    [[nodiscard]] bool isKind(Kind p_Kind) const
    {
        return m_Kind == p_Kind;
    }

    [[nodiscard]] NodePointer& findNode(const NodePointer& p_Node)
    {
        for (std::size_t i = 0; i < m_Children.size(); i++)
        {
            if (std::holds_alternative<NodePointer>(m_Children[i]))
            {
                if (getChild<NodePointer>(i) == p_Node)
                {
                    std::cout << "found: " << i << std::endl;
                    return getChild<NodePointer>(i);
                }
                break;
            }
        }
    }

    static void reset(const NodePointer& p_Node)
    {
        p_Node->setParent(nullptr);
        p_Node->setChildren({});
        p_Node->setKind(Kind::Unknown);
    }

    static void swap(const NodePointer& p_Lhs, const NodePointer& p_Rhs)
    {
        std::swap(p_Lhs->m_Parent, p_Rhs->m_Parent);
        std::swap(p_Lhs->m_Kind, p_Rhs->m_Kind);
        std::swap(p_Lhs->m_Children, p_Rhs->m_Children);
    }
};


#endif
