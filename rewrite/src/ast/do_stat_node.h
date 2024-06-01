#ifndef DO_STAT_NODE_H
#define DO_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class DoStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> block;

    explicit DoStatNode() : AstNode(AstKind::DoStatNode) {}

    static std::shared_ptr<DoStatNode> create(std::shared_ptr<AstNode> p_Block)
    {
        std::shared_ptr<DoStatNode> node = std::make_shared<DoStatNode>();
        node->block = std::move(p_Block);

        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        return node;
    }
    static std::shared_ptr<DoStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<DoStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //DO_STAT_NODE_H
