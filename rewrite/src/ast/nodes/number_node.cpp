#include "number_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NumberNode> NumberNode::create(const int p_Value)
{
    std::shared_ptr<NumberNode> node = std::make_shared<NumberNode>();
    node->value = p_Value;
    return node;
}

std::shared_ptr<NumberNode> NumberNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<NumberNode>(p_Node);
}

void NumberNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
