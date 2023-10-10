#ifndef LUA_NODE_H
#define LUA_NODE_H

#include <iostream>
#include <variant>
#include <vector>
#include <string>
#include <Kind.h>
#include <Base.h>
#include <fmt/core.h>


class Node;
using p_Node = std::shared_ptr<Node>;
using v_Variant = std::vector<std::variant<std::string, p_Base, p_BaseArray>>;


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

    static void setParent(const p_Base& baseNode, const p_Base& parentNode);
    static p_Node get(const p_Base& baseNode);
    [[nodiscard]] std::string toString(std::size_t depth) const override;
};

#endif