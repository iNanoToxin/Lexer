#ifndef TABLE_VALUE_NODE_H
#define TABLE_VALUE_NODE_H

#include <utility>

#include "expression_node.h"

class TableValueNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> value;

    explicit TableValueNode() : ExpressionNode(AstKind::TableValueNode) {}

    static std::shared_ptr<TableValueNode> create(std::shared_ptr<ExpressionNode> p_Value)
    {
        std::shared_ptr<TableValueNode> node = std::make_shared<TableValueNode>();
        node->value = std::move(p_Value);

        if (node->value != nullptr)
        {
            node->value->parent = node;
        }
        return node;
    }
    static std::shared_ptr<TableValueNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<TableValueNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //TABLE_VALUE_NODE_H
