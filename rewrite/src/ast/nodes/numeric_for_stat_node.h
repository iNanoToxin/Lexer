#pragma once
#include "ast_node.h"

class NumericForStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> name;
    std::shared_ptr<AstNode> init;
    std::shared_ptr<AstNode> goal;
    std::shared_ptr<AstNode> step;
    std::shared_ptr<AstNode> block;

    explicit NumericForStatNode() : AstNode(AstKind::NumericForStatNode) {}

    static std::shared_ptr<NumericForStatNode> create(std::shared_ptr<AstNode> p_Name, std::shared_ptr<AstNode> p_Init, std::shared_ptr<AstNode> p_Goal, std::shared_ptr<AstNode> p_Step, std::shared_ptr<AstNode> p_Block);
    static std::shared_ptr<NumericForStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
