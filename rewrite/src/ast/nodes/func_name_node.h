#pragma once
#include "ast_node.h"

class FuncNameNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> name;

    explicit FuncNameNode() : AstNode(AstKind::FuncNameNode) {}

    static std::shared_ptr<FuncNameNode> create(std::shared_ptr<AstNode> p_Name);
    static std::shared_ptr<FuncNameNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
