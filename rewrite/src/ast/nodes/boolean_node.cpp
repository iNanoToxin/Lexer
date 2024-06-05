#include "boolean_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<BooleanNode> BooleanNode::create(const bool p_Value)
{
    std::shared_ptr<BooleanNode> node = std::make_shared<BooleanNode>();
    node->value = p_Value;
    return node;
}

std::shared_ptr<BooleanNode> BooleanNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<BooleanNode>(p_Node);
}

void BooleanNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}

void BooleanNode::flip()
{
    value = !value;
}
