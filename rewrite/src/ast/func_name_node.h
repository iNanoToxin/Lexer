#ifndef FUNC_NAME_NODE_H
#define FUNC_NAME_NODE_H

#include "expression_node.h"

class FuncNameNode final : public ExpressionNode
{
public:
    ExpressionNode* name;

    explicit FuncNameNode(ExpressionNode* p_Name) : ExpressionNode(AstKind::FuncNameNode), name(p_Name) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //FUNC_NAME_NODE_H
