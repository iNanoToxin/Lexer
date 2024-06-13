#include "table_name_value_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableNameValueNode> TableNameValueNode::create(const std::shared_ptr<AstNode>& p_Name, const std::shared_ptr<AstNode>& p_Value)
{
    std::shared_ptr<TableNameValueNode> node = std::make_shared<TableNameValueNode>();
    node->name = p_Name;
    node->value = p_Value;

    if (node->name != nullptr)
    {
        node->name->setParent(node);
    }
    if (node->value != nullptr)
    {
        node->value->setParent(node);
    }
    return node;
}

void TableNameValueNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<TableNameValueNode>());
}
