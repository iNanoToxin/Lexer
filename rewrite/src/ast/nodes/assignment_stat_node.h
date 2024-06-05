#pragma once
#include "ast_node.h"

class AssignmentStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> variableList;
    std::shared_ptr<AstNode> expressionList;

    explicit AssignmentStatNode() : AstNode(AstKind::AssignmentStatNode) {}

    static std::shared_ptr<AssignmentStatNode> create(const std::shared_ptr<AstNode>& p_VariableList, const std::shared_ptr<AstNode>& p_ExpressionList);
    static std::shared_ptr<AssignmentStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
