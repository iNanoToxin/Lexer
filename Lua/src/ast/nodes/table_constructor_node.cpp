#include "table_constructor_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<TableConstructorNode> TableConstructorNode::create(const std::shared_ptr<AstNode>& p_FieldList)
{
    std::shared_ptr<TableConstructorNode> node = std::make_shared<TableConstructorNode>();
    node->fieldList = p_FieldList;

    if (node->fieldList != nullptr)
    {
        node->fieldList->setParent(node);
    }
    return node;
}

void TableConstructorNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<TableConstructorNode>());
}
