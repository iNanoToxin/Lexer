#include "table_index_value_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableIndexValueNode> TableIndexValueNode::create(std::shared_ptr<AstNode> p_Index, std::shared_ptr<AstNode> p_Value)
{
    std::shared_ptr<TableIndexValueNode> node = std::make_shared<TableIndexValueNode>();
    node->index = std::move(p_Index);
    node->value = std::move(p_Value);

    if (node->index != nullptr)
    {
        node->index->parent = node;
    }
    if (node->value != nullptr)
    {
        node->value->parent = node;
    }
    return node;
}

std::shared_ptr<TableIndexValueNode> TableIndexValueNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<TableIndexValueNode>(p_Node);
}

void TableIndexValueNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
