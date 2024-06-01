#ifndef PARAMETER_LIST_NODE_H
#define PARAMETER_LIST_NODE_H

#include <utility>
#include <vector>
#include "ast_node.h"

class ParameterListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit ParameterListNode() : AstNode(AstKind::ParameterListNode) {}

    static std::shared_ptr<ParameterListNode> create(std::vector<std::shared_ptr<AstNode>> p_List)
    {
        std::shared_ptr<ParameterListNode> node = std::make_shared<ParameterListNode>();
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
    static std::shared_ptr<ParameterListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ParameterListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //PARAMETER_LIST_NODE_H
