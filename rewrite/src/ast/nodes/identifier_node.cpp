#include "identifier_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<IdentifierNode> IdentifierNode::create(std::string p_Value)
{
    std::shared_ptr<IdentifierNode> node = std::make_shared<IdentifierNode>();
    node->value = std::move(p_Value);
    return node;
}

std::shared_ptr<IdentifierNode> IdentifierNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<IdentifierNode>(p_Node);
}

void IdentifierNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
