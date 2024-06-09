#pragma once
#include "ast_node.h"

class AssignmentStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::AssignmentStatNode;

public:
    std::shared_ptr<AstNode> lValues;
    std::shared_ptr<AstNode> rValues;

    explicit AssignmentStatNode() : AstNode(AstKind::AssignmentStatNode) {}

    static std::shared_ptr<AssignmentStatNode> create(const std::shared_ptr<AstNode>& p_VariableList, const std::shared_ptr<AstNode>& p_ExpressionList);
    void accept(AstVisitor& p_Visitor) override;

    void remove(const std::shared_ptr<AstNode>& p_Node);
};
