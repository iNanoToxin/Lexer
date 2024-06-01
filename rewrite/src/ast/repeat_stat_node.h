#ifndef REPEAT_STAT_NODE_H
#define REPEAT_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class RepeatStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> block;
    std::shared_ptr<AstNode> condition;

    explicit RepeatStatNode() : AstNode(AstKind::RepeatStatNode) {}

    static std::shared_ptr<RepeatStatNode> create(std::shared_ptr<AstNode> p_Block, std::shared_ptr<AstNode> p_Condition)
    {
        std::shared_ptr<RepeatStatNode> node = std::make_shared<RepeatStatNode>();
        node->block = std::move(p_Block);
        node->condition = std::move(p_Condition);

        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        if (node->condition != nullptr)
        {
            node->condition->parent = node;
        }
        return node;
    }
    static std::shared_ptr<RepeatStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<RepeatStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //REPEAT_STAT_NODE_H
