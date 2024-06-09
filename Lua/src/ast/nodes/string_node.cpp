#include "string_node.h"
#include "ast/visitors/ast_visitor.h"
#include "utilities/string.h"

std::shared_ptr<StringNode> StringNode::create(const std::string& p_Value)
{
    std::shared_ptr<StringNode> node = std::make_shared<StringNode>();
    node->m_String = p_Value;
    String::unquote(node->m_Content, node->m_String);
    return node;
}

void StringNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<StringNode>());
}

std::string StringNode::getContent() const
{
    return m_Content;
}

std::string StringNode::getString() const
{
    return m_String;
}

std::size_t StringNode::getLength() const
{
    return m_Content.size();
}

bool StringNode::isLongString() const
{
    return m_String.starts_with('[');
}
