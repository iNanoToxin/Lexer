#ifndef LABEL_NODE_H
#define LABEL_NODE_H

#include <utility>

#include "expression_node.h"

class LabelNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> label;

    explicit LabelNode() : ExpressionNode(AstKind::LabelNode) {}

    static std::shared_ptr<LabelNode> create(std::shared_ptr<ExpressionNode> p_Label)
    {
        std::shared_ptr<LabelNode> node = std::make_shared<LabelNode>();
        node->label = std::move(p_Label);

        if (node->label != nullptr)
        {
            node->label->parent = node;
        }
        return node;
    }
    static std::shared_ptr<LabelNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<LabelNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //LABEL_NODE_H
