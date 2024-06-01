#ifndef ATTRIBUTE_LIST_NODE_H
#define ATTRIBUTE_LIST_NODE_H

#include <vector>
#include "ast_node.h"

class AttributeListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit AttributeListNode() : AstNode(AstKind::AttributeListNode) {}

    static std::shared_ptr<AttributeListNode> create(std::vector<std::shared_ptr<AstNode>> p_List)
    {
        std::shared_ptr<AttributeListNode> node = std::make_shared<AttributeListNode>();
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
    static std::shared_ptr<AttributeListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<AttributeListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //ATTRIBUTE_LIST_NODE_H
