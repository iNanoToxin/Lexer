#ifndef FIELD_LIST_NODE_H
#define FIELD_LIST_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class FieldListNode final : public ExpressionNode
{
public:
    std::vector<std::shared_ptr<ExpressionNode>> list;

    explicit FieldListNode() : ExpressionNode(AstKind::FieldListNode) {}

    static std::shared_ptr<FieldListNode> create(std::vector<std::shared_ptr<ExpressionNode>> p_List)
    {
        std::shared_ptr<FieldListNode> node = std::make_shared<FieldListNode>();
        node->list = std::move(p_List);

        for (const std::shared_ptr<ExpressionNode>& child : node->list)
        {
            if (child != nullptr)
            {
                child->parent = node;
            }
        }
        return node;
    }
    static std::shared_ptr<FieldListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<FieldListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //FIELD_LIST_NODE_H
