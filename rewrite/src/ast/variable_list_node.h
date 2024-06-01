#ifndef VARIABLE_LIST_NODE_H
#define VARIABLE_LIST_NODE_H

#include <vector>
#include "ast_node.h"

class VariableListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit VariableListNode() : AstNode(AstKind::VariableListNode) {}

    static std::shared_ptr<VariableListNode> create(std::vector<std::shared_ptr<AstNode>> p_List)
    {
        std::shared_ptr<VariableListNode> node = std::make_shared<VariableListNode>();
        node->list = std::move(p_List);

        for (const std::shared_ptr<AstNode>& child : node->list)
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
