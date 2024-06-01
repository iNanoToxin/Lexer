#ifndef INDEX_NODE_H
#define INDEX_NODE_H

#include <utility>

#include "ast_node.h"

class IndexNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> root;
    std::shared_ptr<AstNode> index;

    explicit IndexNode() : AstNode(AstKind::IndexNode) {}

    static std::shared_ptr<IndexNode> create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Index)
    {
        std::shared_ptr<IndexNode> node = std::make_shared<IndexNode>();
        node->root = std::move(p_Root);
        node->index = std::move(p_Index);

        if (node->root != nullptr)
        {
            node->root->parent = node;
        }
        if (node->index != nullptr)
        {
            node->index->parent = node;
        }
        return node;
    }
    static std::shared_ptr<IndexNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<IndexNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //INDEX_NODE_H
