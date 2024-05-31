#ifndef BLOCK_NODE_H
#define BLOCK_NODE_H

#include <utility>
#include <vector>
#include "expression_node.h"

class BlockNode final : public ExpressionNode
{
public:
    std::vector<ExpressionNode*> statements;

    explicit BlockNode(std::vector<ExpressionNode*> p_Statements) : ExpressionNode(AstKind::BlockNode), statements(std::move(p_Statements))
    {
        for (ExpressionNode* statement : statements)
        {
            if (statement) statement->parent = this;
        }
    }

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //BLOCK_NODE_H
