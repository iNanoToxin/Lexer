#ifndef NAME_LIST_NODE_H
#define NAME_LIST_NODE_H

#include <utility>
#include <vector>
#include "ast_node.h"

class NameListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit NameListNode() : AstNode(AstKind::NameListNode) {}

    static std::shared_ptr<NameListNode> create(std::vector<std::shared_ptr<AstNode>> p_List)
    {
        std::shared_ptr<NameListNode> node = std::make_shared<NameListNode>();
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
    static std::shared_ptr<NameListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<NameListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //NAME_LIST_NODE_H
