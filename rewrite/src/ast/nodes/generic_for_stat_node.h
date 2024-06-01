#pragma once
#include "ast_node.h"

class GenericForStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> nameList;
    std::shared_ptr<AstNode> expressionList;
    std::shared_ptr<AstNode> block;

    explicit GenericForStatNode() : AstNode(AstKind::GenericForStatNode) {}

    static std::shared_ptr<GenericForStatNode> create(std::shared_ptr<AstNode> p_NameList, std::shared_ptr<AstNode> p_ExpressionList, std::shared_ptr<AstNode> p_Block);
    static std::shared_ptr<GenericForStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
