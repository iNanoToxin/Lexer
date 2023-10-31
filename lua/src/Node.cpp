#include "Node.h"


void Node::setChildren(v_Variant children)
{
    // for (auto& elem: children)
    // {
    //     if (std::holds_alternative<p_Node>(elem))
    //     {
    //         std::get<p_Node>(elem)->setParent(getPointer());
    //     }
    // }
    m_Children = std::move(children);
}

void Node::setSize(const std::size_t& size)
{
    m_Size = size;
}

void Node::setParent(const p_Node& parent)
{
    this->m_Parent = parent;
}

v_Variant Node::getChildren()
{
    return m_Children;
}

std::size_t Node::getSize() const
{
    return m_Size;
}

p_Node Node::getParent(const std::size_t& depth)
{
    p_Node parent = std::static_pointer_cast<Node>(m_Parent);
    if (parent && depth > 0)
    {
        return parent->getParent(depth - 1);
    }
    return parent;
}


std::string Node::toString(std::size_t depth) const
{
    {
        return "";
    }

    std::string str;
    std::size_t mul = 4;

    str += "{\n";
    depth++;
    str += std::string(depth * mul, ' ');
    str += "Kind: " + getKindName(m_Kind) + "\n";

    for (int i = 0; i < m_Size; i++)
    {
        if (std::holds_alternative<std::string>(m_Children[i]))
        {
            auto value = std::get<std::string>(m_Children[i]);

            if (m_Kind == Kind::String || m_Kind == Kind::Numeric)
            {
                str += fmt::format(
                    "{0}[{1}] = {2}\n",
                    std::string(depth * mul, ' '),
                    std::to_string(i),
                    value
                );
            }
            else
            {
                str += fmt::format(
                    "{0}[{1}] = '{2}'\n",
                    std::string(depth * mul, ' '),
                    std::to_string(i),
                    value
                );
            }
        }
        else if (std::holds_alternative<p_Node>(m_Children[i]))
        {
            auto value = std::get<p_Node>(m_Children[i]);

            if (!value)
            {
                str += fmt::format(
                    "{0}[{1}] = nullptr\n",
                    std::string(depth * mul, ' '),
                    std::to_string(i)
                );
            }
            else
            {
                str += fmt::format(
                    "{0}[{1}] = {2}\n",
                    std::string(depth * mul, ' '),
                    std::to_string(i),
                    value->toString(depth)
                );
            }
        }
        else if (std::holds_alternative<p_NodeArray>(m_Children[i]))
        {
            auto array = std::get<p_NodeArray>(m_Children[i]);

            for (int j = 0; j < array.size(); j++)
            {
                if (array[j])
                {
                    str += fmt::format(
                        "{0}[{1}] = {2}\n",
                        std::string(depth * mul, ' '),
                        std::to_string(j),
                        array[j]->toString(depth)
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

void Node::setKind(Kind kind)
{
    m_Kind = kind;
}

Kind Node::getKind() const
{
    return m_Kind;
}
