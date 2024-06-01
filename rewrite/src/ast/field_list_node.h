#ifndef FIELD_LIST_NODE_H
#define FIELD_LIST_NODE_H

#include <utility>
#include <vector>
#include "ast_node.h"

class FieldListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit FieldListNode() : AstNode(AstKind::FieldListNode) {}

    static std::shared_ptr<FieldListNode> create(std::vector<std::shared_ptr<AstNode>> p_List)
    {
        std::shared_ptr<FieldListNode> node = std::make_shared<FieldListNode>();
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
    static std::shared_ptr<FieldListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<FieldListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //FIELD_LIST_NODE_H
