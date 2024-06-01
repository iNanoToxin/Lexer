#pragma once
#include "ast_node.h"

class WhileStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> condition;
    std::shared_ptr<AstNode> block;

    explicit WhileStatNode() : AstNode(AstKind::WhileStatNode) {}

    static std::shared_ptr<WhileStatNode> create(std::shared_ptr<AstNode> p_Condition, std::shared_ptr<AstNode> p_Block);
    static std::shared_ptr<WhileStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
