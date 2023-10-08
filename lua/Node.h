#ifndef LUA_NODE_H
#define LUA_NODE_H

#include <iostream>
#include <variant>
#include <vector>
#include <string>
#include <format>
#include "Kind.h"
#include "Base.h"

using NodeVariant = std::variant<std::string, p_Base, p_BaseArray>;

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
    p_Node getParent();

    #pragma endregion

    template <typename Type>
    Type& getChild(const std::size_t& index) {
        // std::cout << "KIND `" + getKindName(m_Kind) + "` ACCESSED " + std::to_string(index) << std::endl;
        return std::get<Type>(m_Children[index]);
    }


    static void setParent(const p_Base& baseNode, const p_Base& parentNode) {
        if (auto node = getNode(baseNode))
        {
            node->setParent(parentNode);
        }
    }

    static p_Node getNode(const p_Base& baseNode) {
        return std::static_pointer_cast<Node>(baseNode);
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

                if (!value) {
                    str += std::format(
                        "{0}[{1}] = nullptr\n",
                        std::string(depth * mul, ' '),
                        std::to_string(i)
                    );
                }
                else if (auto node = getNode(value)) {
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