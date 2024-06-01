#include "table_constructor_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableConstructorNode> TableConstructorNode::create(std::shared_ptr<AstNode> p_FieldList)
{
    std::shared_ptr<TableConstructorNode> node = std::make_shared<TableConstructorNode>();
    node->fieldList = std::move(p_FieldList);

    if (node->fieldList != nullptr)
    {
        node->fieldList->parent = node;
    }
    return node;
}

std::shared_ptr<TableConstructorNode> TableConstructorNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<TableConstructorNode>(p_Node);
}

void TableConstructorNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
