#ifndef TABLE_NAME_VALUE_NODE_H
#define TABLE_NAME_VALUE_NODE_H

#include <utility>

#include "expression_node.h"

class TableNameValueNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> name;
    std::shared_ptr<ExpressionNode> value;

    explicit TableNameValueNode() : ExpressionNode(AstKind::TableNameValueNode) {}

    static std::shared_ptr<TableNameValueNode> create(std::shared_ptr<ExpressionNode> p_Name, std::shared_ptr<ExpressionNode> p_Value)
    {
        std::shared_ptr<TableNameValueNode> node = std::make_shared<TableNameValueNode>();
        node->name = std::move(p_Name);
        node->value = std::move(p_Value);

        if (node->name != nullptr)
        {
            node->name->parent = node;
        }
        if (node->value != nullptr)
        {
            node->value->parent = node;
        }
        return node;
    }
    static std::shared_ptr<TableNameValueNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<TableNameValueNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //TABLE_NAME_VALUE_NODE_H
