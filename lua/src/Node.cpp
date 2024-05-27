#include <Node.h>
#include <Util.h>

void Node::setChildren(NodeChildren p_Children)
{
    for (std::size_t i = 0; i < p_Children.size(); i++)
    {
        auto& elem = p_Children[i];
        if (std::holds_alternative<NodePointer>(elem))
        {
            if (auto node = std::get<NodePointer>(elem))
            {
                node->setParent(getPointer());
            }
        }
    }
    m_Children = std::move(p_Children);
}

void Node::setParent(const NodePointer& p_Parent)
{
    this->m_Parent = p_Parent;
}

NodeChildren& Node::getChildren()
{
    return m_Children;
}

NodePointer Node::getParent(const std::size_t& p_Depth)
{
    NodePointer parent = m_Parent;
    if (parent && p_Depth > 0)
    {
        return parent->getParent(p_Depth - 1);
    }
    return parent;
}


std::string Node::toString(std::size_t p_Depth) const
{
    std::string str;
    std::size_t mul = 4;

    str += "{\n";
    p_Depth++;
    str += std::string(p_Depth * mul, ' ');
    str += "Kind: " + get_kind_name(m_Kind) + "\n";

    for (int i = 0; i < m_Children.size(); i++)
    {
        if (std::holds_alternative<std::string>(m_Children[i]))
        {
            auto value = std::get<std::string>(m_Children[i]);

            if (m_Kind == Kind::String || m_Kind == Kind::Numeric)
            {
                str += fmt::format(
                    "{0}[{1}] = {2}\n",
                    std::string(p_Depth * mul, ' '),
                    std::to_string(i),
                    value
                );
            }
            else
            {
                str += fmt::format(
                    "{0}[{1}] = '{2}'\n",
                    std::string(p_Depth * mul, ' '),
                    std::to_string(i),
                    value
                );
            }
        }
        else if (std::holds_alternative<bool>(m_Children[i]))
        {
            auto value = std::get<bool>(m_Children[i]);

            str += fmt::format(
                "{0}[{1}] = {2}\n",
                std::string(p_Depth * mul, ' '),
                std::to_string(i),
                std::to_string(value)
            );
        }
        else if (std::holds_alternative<Number>(m_Children[i]))
        {
            auto value = std::get<Number>(m_Children[i]);

            str += fmt::format(
                "{0}[{1}] = {2}\n",
                std::string(p_Depth * mul, ' '),
                std::to_string(i),
                value.toString()
            );
        }
        else if (std::holds_alternative<OperatorKind>(m_Children[i]))
        {
            auto value = std::get<OperatorKind>(m_Children[i]);

            str += fmt::format(
                "{0}[{1}] = \"{2}\"\n",
                std::string(p_Depth * mul, ' '),
                std::to_string(i),
                Util::get_operator(value)
            );
        }
        else if (std::holds_alternative<NodePointer>(m_Children[i]))
        {
            auto value = std::get<NodePointer>(m_Children[i]);

            if (!value)
            {
                str += fmt::format(
                    "{0}[{1}] = nullptr\n",
                    std::string(p_Depth * mul, ' '),
                    std::to_string(i)
                );
            }
            else
            {
                str += fmt::format(
                    "{0}[{1}] = {2}\n",
                    std::string(p_Depth * mul, ' '),
                    std::to_string(i),
                    value->toString(p_Depth)
                );
            }
        }
        else if (std::holds_alternative<NodeArray>(m_Children[i]))
        {
            auto array = std::get<NodeArray>(m_Children[i]);

            for (int j = 0; j < array.size(); j++)
            {
                if (array[j])
                {
                    str += fmt::format(
                        "{0}[{1}] = {2}\n",
                        std::string(p_Depth * mul, ' '),
                        std::to_string(j),
                        array[j]->toString(p_Depth)
                    );
                }
            }
        }
    }

    p_Depth--;
    str += std::string(p_Depth * mul, ' ');
    str += "}";

    return str;
}

void Node::setKind(Kind p_Kind)
{
    m_Kind = p_Kind;
}

Kind& Node::getKind()
{
    return m_Kind;
}

std::size_t Node::getSize() const
{
    return m_Children.size();
}
