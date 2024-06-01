#ifndef PARAMETER_LIST_NODE_H
#define PARAMETER_LIST_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class ParameterListNode final : public ExpressionNode
{
public:
    std::vector<std::shared_ptr<ExpressionNode>> list;

    explicit ParameterListNode() : ExpressionNode(AstKind::ParameterListNode) {}

    static std::shared_ptr<ParameterListNode> create(std::vector<std::shared_ptr<ExpressionNode>> p_List)
    {
        std::shared_ptr<ParameterListNode> node = std::make_shared<ParameterListNode>();
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
    static std::shared_ptr<ParameterListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ParameterListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //PARAMETER_LIST_NODE_H
