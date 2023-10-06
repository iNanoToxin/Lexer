#ifndef LUA_NODE_H
#define LUA_NODE_H

#include "Kind.h"
#include "Base.h"


template <typename ...Types>
class Node : public Base
{
private:
    std::tuple<Types...> m_Children;
    std::size_t m_Size = 0;
public:
    explicit Node() = default;

    #pragma region node_methods

    void setChildren(std::tuple<Types...> children)
    {
        m_Children = children;
    }

    std::tuple<Types...> getChildren()
    {
        return m_Children;
    }

    template <std::size_t Position, typename T>
    void setChild(T child)
    {
        std::get<Position>(m_Children) = child;
    }

    template <std::size_t Position>
    auto getChild()
    {
        return std::get<Position>(m_Children);
    }

    void setKind(Kind kind)
    {
        this->m_Kind = kind;
    }

    Kind getKind()
    {
        return m_Kind;
    }

    void setSize(std::size_t size)
    {
        m_Size = size;
    }

    std::size_t getSize()
    {
        return m_Size;
    }

    void setParent(const p_Base& parent)
    {
        this->m_Parent = parent;
    }

    template <typename ...ParentTypes>
    Node<ParentTypes...>* getParent()
    {
        return dynamic_cast<Node<ParentTypes...>*>(m_Parent.get());
    }

    #pragma endregion

    std::string toString(std::size_t depth = 0) const override
    {
        return "hi";
    }
};

#endif