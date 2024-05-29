#ifndef LABEL_NODE_H
#define LABEL_NODE_H

#include <utility>

#include "expression_node.h"

class LabelNode final : public ExpressionNode
{
public:
    ExpressionNode* label;

    explicit LabelNode(ExpressionNode* p_Label) : label(p_Label) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //LABEL_NODE_H
