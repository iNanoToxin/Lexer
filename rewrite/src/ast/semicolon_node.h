#ifndef SEMICOLON_NODE_H
#define SEMICOLON_NODE_H

#include "expression_node.h"

class SemicolonNode final : public ExpressionNode
{
public:
    explicit SemicolonNode() : ExpressionNode(AstKind::SemicolonNode) {}

    static std::shared_ptr<SemicolonNode> create()
    {
        return std::make_shared<SemicolonNode>();
    }
    static std::shared_ptr<SemicolonNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<SemicolonNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //SEMICOLON_NODE_H
