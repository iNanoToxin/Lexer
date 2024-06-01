#ifndef GOTO_STAT_NODE_H
#define GOTO_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class GotoStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> label;

    explicit GotoStatNode() : AstNode(AstKind::GotoStatNode) {}

    static std::shared_ptr<GotoStatNode> create(std::shared_ptr<AstNode> p_Label)
    {
        std::shared_ptr<GotoStatNode> node = std::make_shared<GotoStatNode>();
        node->label = std::move(p_Label);

        if (node->label != nullptr)
        {
            node->label->parent = node;
        }
        return node;
    }
    static std::shared_ptr<GotoStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<GotoStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //GOTO_STAT_NODE_H
