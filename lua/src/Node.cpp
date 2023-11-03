#include <Node.h>
#include <Util.h>

void Node::setChildren(v_Variant children)
{
    for (std::size_t i = 0; i < children.size(); i++)
    {
        auto& elem = children[i];
        if (std::holds_alternative<p_Node>(elem))
        {
            if (auto node = std::get<p_Node>(elem))
            {
                node->setParent(getPointer());
            }
        }
    }
    m_Children = std::move(children);
}

void Node::setParent(const p_Node& parent)
{
    this->m_Parent = parent;
}

v_Variant& Node::getChildren()
{
    return m_Children;
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
    std::string str;
    std::size_t mul = 4;

    str += "{\n";
    depth++;
    str += std::string(depth * mul, ' ');
    str += "Kind: " + getKindName(m_Kind) + "\n";

    for (int i = 0; i < m_Children.size(); i++)
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
        else if (std::holds_alternative<bool>(m_Children[i]))
        {
            auto value = std::get<bool>(m_Children[i]);

            str += fmt::format(
                "{0}[{1}] = {2}\n",
                std::string(depth * mul, ' '),
                std::to_string(i),
                std::to_string(value)
            );
        }
        else if (std::holds_alternative<Number>(m_Children[i]))
        {
            auto value = std::get<Number>(m_Children[i]);

            str += fmt::format(
                "{0}[{1}] = {2}\n",
                std::string(depth * mul, ' '),
                std::to_string(i),
                value.toString()
            );
        }
        else if (std::holds_alternative<OperatorKind>(m_Children[i]))
        {
            auto value = std::get<OperatorKind>(m_Children[i]);

            str += fmt::format(
                "{0}[{1}] = \"{2}\"\n",
                std::string(depth * mul, ' '),
                std::to_string(i),
                Util::getOperator(value)
            );
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

Kind& Node::getKind()
{
    return m_Kind;
}

std::size_t Node::getSize() const
{
    return m_Children.size();
}