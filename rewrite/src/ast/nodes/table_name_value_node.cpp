#include "table_name_value_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableNameValueNode> TableNameValueNode::create(std::shared_ptr<AstNode> p_Name, std::shared_ptr<AstNode> p_Value)
{
    std::shared_ptr<TableNameValueNode> node = std::make_shared<TableNameValueNode>();
    node->name = std::move(p_Name);
    node->value = std::move(p_Value);

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

std::shared_ptr<TableNameValueNode> TableNameValueNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<TableNameValueNode>(p_Node);
}

void TableNameValueNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
