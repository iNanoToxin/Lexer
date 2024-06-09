#include "table_value_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableValueNode> TableValueNode::create(const std::shared_ptr<AstNode>& p_Value)
{
    std::shared_ptr<TableValueNode> node = std::make_shared<TableValueNode>();
    node->value = p_Value;

    if (node->value != nullptr)
    {
        node->value->setParent(node);
    }
    return node;
}

void TableValueNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<TableValueNode>());
}
