#ifndef LUA_NODE_H
#define LUA_NODE_H

#include <iostream>
#include <variant>
#include <vector>
#include <string>
#include <Kind.h>
#include <Base.h>
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
using v_Variant = std::vector<std::variant<Number, std::string, p_Base, p_BaseArray>>;


class Node : public Base
{
private:
    v_Variant m_Children;
    std::size_t m_Size = 0;
public:
    explicit Node() = default;

    void setChildren(v_Variant children);
    v_Variant getChildren();

    void setSize(const std::size_t& size);
    [[nodiscard]] std::size_t getSize() const;

    void setParent(const p_Base& parent);
    p_Node getParent(const std::size_t& depth = 0);

    template <typename Type>
    Type& getChild(const size_t& index)
    {
        return std::get<Type>(m_Children[index]);
    }

    static void Reset(const p_Base& base)
    {
        auto node = get(base);
        assert(node, "node expected");
        node->setParent(nullptr);
        node->setSize(0);
        node->setChildren({});
        node->setKind(Kind::Unknown);
    }

    static void Swap(const p_Base& lhsBase, const p_Base& rhsBase)
    {
        auto lhs = get(lhsBase);
        auto rhs = get(rhsBase);
        assert(lhs, "lhs expected");
        assert(rhs, "rhs expected");
        std::swap(lhs->m_Parent, rhs->m_Parent);
        std::swap(lhs->m_Size, rhs->m_Size);
        std::swap(lhs->m_Kind, rhs->m_Kind);
        std::swap(lhs->m_Children, rhs->m_Children);
    }

    static void setParent(const p_Base& baseNode, const p_Base& parentNode);
    static p_Node get(const p_Base& baseNode);
    [[nodiscard]] std::string toString(std::size_t depth) const override;
};

#endif