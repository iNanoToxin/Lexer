#include "Node.h"

void Node::setChildren(std::vector<NodeVariant> children)
{
    m_Children = children;
}

void Node::setSize(std::size_t size)
{
    m_Size = size;
}

void Node::setParent(const p_Base& parent)
{
    this->m_Parent = parent;
}

std::vector<NodeVariant> Node::getChildren()
{
    return m_Children;
}

std::size_t Node::getSize() const
{
    return m_Size;
}

Node* Node::getParent()
{
    return dynamic_cast<Node*>(m_Parent.get());
}
