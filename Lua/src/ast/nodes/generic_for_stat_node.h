#pragma once
#include "ast_node.h"

class GenericForStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::GenericForStatNode;

public:
    std::shared_ptr<AstNode> nameList;
    std::shared_ptr<AstNode> expressionList;
    std::shared_ptr<AstNode> block;

    explicit GenericForStatNode() : AstNode(AstKind::GenericForStatNode) {}

    static std::shared_ptr<GenericForStatNode> create(const std::shared_ptr<AstNode>& p_NameList, const std::shared_ptr<AstNode>& p_ExpressionList, const std::shared_ptr<AstNode>& p_Block);
    void accept(AstVisitor& p_Visitor) override;
};
