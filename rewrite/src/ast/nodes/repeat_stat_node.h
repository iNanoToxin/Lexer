#pragma once
#include "ast_node.h"

class RepeatStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> block;
    std::shared_ptr<AstNode> condition;

    explicit RepeatStatNode() : AstNode(AstKind::RepeatStatNode) {}

    static std::shared_ptr<RepeatStatNode> create(std::shared_ptr<AstNode> p_Block, std::shared_ptr<AstNode> p_Condition);
    static std::shared_ptr<RepeatStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
