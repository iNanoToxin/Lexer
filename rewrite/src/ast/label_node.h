#ifndef LABEL_NODE_H
#define LABEL_NODE_H

#include <utility>

#include "expression_node.h"

class LabelNode final : public ExpressionNode
{
public:
    ExpressionNode* label;

    explicit LabelNode(ExpressionNode* p_Label) : ExpressionNode(AstKind::LabelNode), label(p_Label)
    {
        if (label) label->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //LABEL_NODE_H
