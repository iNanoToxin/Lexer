#include "identifier_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<IdentifierNode> IdentifierNode::create(const std::string& p_Name)
{
    std::shared_ptr<IdentifierNode> node = std::make_shared<IdentifierNode>();
    node->m_Name = p_Name;
    return node;
}

void IdentifierNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<IdentifierNode>());
}

void IdentifierNode::setName(const std::string& p_Name)
{
    m_Name = p_Name;
}

std::string IdentifierNode::getName() const
{
    return m_Name;
}
