#include "boolean_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<BooleanNode> BooleanNode::create(const bool p_Value)
{
    std::shared_ptr<BooleanNode> node = std::make_shared<BooleanNode>();
    node->value = p_Value;
    return node;
}

void BooleanNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<BooleanNode>());
}

void BooleanNode::flip()
{
    value = !value;
}
