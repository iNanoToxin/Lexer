#include "table_index_value_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableIndexValueNode> TableIndexValueNode::create(const std::shared_ptr<AstNode>& p_Index, const std::shared_ptr<AstNode>& p_Value)
{
    std::shared_ptr<TableIndexValueNode> node = std::make_shared<TableIndexValueNode>();
    node->index = p_Index;
    node->value = p_Value;

    if (node->index != nullptr)
    {
        node->index->setParent(node);
    }
    if (node->value != nullptr)
    {
        node->value->setParent(node);
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
