#include "table_constructor_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableConstructorNode> TableConstructorNode::create(const std::shared_ptr<AstNode>& p_FieldList)
{
    std::shared_ptr<TableConstructorNode> node = std::make_shared<TableConstructorNode>();
    node->fields = p_FieldList;

    if (node->fields != nullptr)
    {
        node->fields->setParent(node);
    }
    return node;
}

void TableConstructorNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<TableConstructorNode>());
}
