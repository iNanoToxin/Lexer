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

class Node;
using p_Node = std::shared_ptr<Node>;

class Node : public Base
{
private:
    std::vector<NodeVariant> m_Children;
    std::size_t m_Size = 0;
public:
    explicit Node() = default;

    #pragma region node_methods

    void setChildren(std::vector<NodeVariant> children);
    void setSize(std::size_t size);
    void setParent(const p_Base& parent);
    std::vector<NodeVariant> getChildren();
    std::size_t getSize() const;
    Node* getParent();

    #pragma endregion

    template <typename Type>
    Type& getChild(const std::size_t& index) {
        return std::get<Type>(m_Children[index]);
    }


    static void setParent(const p_Base& baseNode, const p_Base& parentNode) {
        // if (auto node = getNode(baseNode))
        // {
        //     node->setParent(parentNode);
        // }
    }

    static p_Node getNode(const p_Base& baseNode) {
        if (!baseNode) {
            return nullptr;
        }
        return p_Node{dynamic_cast<Node*>(baseNode.get())};
    }

    std::string toString(std::size_t depth = 0) const override
    {
        std::string str;
        std::size_t mul = 4;

        str += "{\n";
        depth++;
        str += std::string(depth * mul, ' ');
        str += "Kind: " + getKindName(m_Kind) + "\n";

        for (int i = 0; i < m_Size; i++) {
            if (std::holds_alternative<std::string>(m_Children[i])) {
                auto value = std::get<std::string>(m_Children[i]);

                if (m_Kind == Kind::String || m_Kind == Kind::Numeric) {
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
            else if (std::holds_alternative<std::monostate>(m_Children[i])) {
                str += std::format(
                    "{0}[{1}] = nullptr\n",
                    std::string(depth * mul, ' '),
                    std::to_string(i)
                );
            }
        }

        depth--;
        str += std::string(depth * mul, ' ');
        str += "}";

        return str;
    }
};

#endif