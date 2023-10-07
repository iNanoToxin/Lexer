#ifndef LUA_NODE_H
#define LUA_NODE_H

#include <iostream>
#include <variant>
#include <vector>
#include <string>
#include <format>
#include "Kind.h"
#include "Base.h"

using NodeVariant = std::variant<std::monostate, std::string, p_Base, std::vector<p_Base>>;


class Node : public Base
{
private:
    std::vector<NodeVariant> m_Children;
    std::size_t m_Size = 0;
public:
    explicit Node() = default;

    #pragma region node_methods

    void setChildren(std::vector<NodeVariant> children)
    {
        m_Children = children;
    }

    std::vector<NodeVariant> getChildren()
    {
        return m_Children;
    }

    /*template <std::size_t Position, typename T>
    void setChild(T child)
    {
        std::get<Position>(m_Children) = child;
    }


    auto getChild(std::size_t position)
    {
        return std::get<std::string>(m_Children[0]);
    }*/

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

    Node* getParent()
    {
        return dynamic_cast<Node*>(m_Parent.get());
    }

    #pragma endregion


    static void setParent(const p_Base& baseNode, const p_Base& parentNode) {
        if (auto node = getNode(baseNode))
        {
            node->setParent(parentNode);
        }
    }

    static Node* getNode(const p_Base& baseNode) {
        if (!baseNode) {
            return nullptr;
        }
        return dynamic_cast<Node*>(baseNode.get());
    }

    std::string toString(std::size_t depth = 0) const override
    {
        std::string str;
        std::size_t mul = 4;
        // str += std::string(depth * mul, ' ');
        str += "{\n";
        depth++;
        str += std::string(depth * mul, ' ');
        str += "Kind: " + getKindName(m_Kind) + "\n";

        for (int i = 0; i < m_Size; i++) {
            if (std::holds_alternative<std::string>(m_Children[i])) {
                auto value = std::get<std::string>(m_Children[i]);

                if (m_Kind == Kind::String) {
                    str += std::format(
                        "{0}[{1}] = {2}\n",
                        std::string(depth * mul, ' '),
                        std::to_string(i),
                        value
                    );
                }
                else {
                    str += std::format(
                        "{0}[{1}] = '{2}'\n",
                        std::string(depth * mul, ' '),
                        std::to_string(i),
                        value
                    );
                }
            }
            else if (std::holds_alternative<p_Base>(m_Children[i])) {
                auto value = std::get<p_Base>(m_Children[i]);
                if (auto node = getNode(value)) {
                    str += std::format(
                        "{0}[{1}] = {2}\n",
                        std::string(depth * mul, ' '),
                        std::to_string(i),
                        node->toString(depth)
                    );
                }
            }
            else if (std::holds_alternative<p_BaseArray>(m_Children[i])) {
                auto array = std::get<p_BaseArray>(m_Children[i]);

                for (int j = 0; j < array.size(); j++) {
                    if (auto node = getNode(array[j])) {
                        str += std::format(
                            "{0}[{1}] = {2}\n",
                            std::string(depth * mul, ' '),
                            std::to_string(j),
                            node->toString(depth)
                        );
                    }
                }
            }
        }

        depth--;
        str += std::string(depth * mul, ' ');
        str += "}";

        return str;
    }
};

#endif