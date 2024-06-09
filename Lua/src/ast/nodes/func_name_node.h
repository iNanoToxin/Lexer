#pragma once
#include "ast_node.h"

class FuncNameNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::FuncNameNode;

public:
    std::shared_ptr<AstNode> name;

    explicit FuncNameNode() : AstNode(AstKind::FuncNameNode) {}

    static std::shared_ptr<FuncNameNode> create(const std::shared_ptr<AstNode>& p_Name);
    void accept(AstVisitor& p_Visitor) override;
};
