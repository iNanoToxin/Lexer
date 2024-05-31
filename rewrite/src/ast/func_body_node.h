#ifndef FUNC_BODY_NODE_H
#define FUNC_BODY_NODE_H

#include "expression_node.h"

class FuncBodyNode final : public ExpressionNode
{
public:
    ExpressionNode* parameters;
    ExpressionNode* block;

    explicit FuncBodyNode(ExpressionNode* p_ParameterList, ExpressionNode* p_Block) : ExpressionNode(AstKind::FuncBodyNode), parameters(p_ParameterList), block(p_Block)
    {
        if (parameters) parameters->parent = this;
        if (block) block->parent = this;
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FUNC_BODY_NODE_H
