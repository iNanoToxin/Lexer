#ifndef TABLE_CONSTRUCTOR_NODE_H
#define TABLE_CONSTRUCTOR_NODE_H

#include <utility>

#include "expression_node.h"

class TableConstructorNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> fieldList;

    explicit TableConstructorNode() : ExpressionNode(AstKind::TableConstructorNode) {}

    static std::shared_ptr<TableConstructorNode> create(std::shared_ptr<ExpressionNode> p_FieldList)
    {
        std::shared_ptr<TableConstructorNode> node = std::make_shared<TableConstructorNode>();
        node->fieldList = std::move(p_FieldList);

        if (node->fieldList != nullptr)
        {
            node->fieldList->parent = node;
        }
        return node;
    }
    static std::shared_ptr<TableConstructorNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<TableConstructorNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //TABLE_CONSTRUCTOR_NODE_H
