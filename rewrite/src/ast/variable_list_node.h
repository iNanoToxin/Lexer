#ifndef VARIABLE_LIST_NODE_H
#define VARIABLE_LIST_NODE_H

#include <vector>
#include "expression_node.h"

class VariableListNode final : public ExpressionNode
{
public:
    std::vector<std::shared_ptr<ExpressionNode>> list;

    explicit VariableListNode() : ExpressionNode(AstKind::VariableListNode) {}

    static std::shared_ptr<VariableListNode> create(std::vector<std::shared_ptr<ExpressionNode>> p_List)
    {
        std::shared_ptr<VariableListNode> node = std::make_shared<VariableListNode>();
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
    static std::shared_ptr<VariableListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<VariableListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //VARIABLE_LIST_NODE_H
