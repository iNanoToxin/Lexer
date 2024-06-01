#ifndef EXPRESSION_LIST_NODE_H
#define EXPRESSION_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class ExpressionListNode final : public ExpressionNode
{
public:
    std::vector<std::shared_ptr<ExpressionNode>> list;

    explicit ExpressionListNode() : ExpressionNode(AstKind::ExpressionListNode) {}

    static std::shared_ptr<ExpressionListNode> create(std::vector<std::shared_ptr<ExpressionNode>> p_List)
    {
        std::shared_ptr<ExpressionListNode> node = std::make_shared<ExpressionListNode>();
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
    static std::shared_ptr<ExpressionListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ExpressionListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //EXPRESSION_LIST_NODE_H
