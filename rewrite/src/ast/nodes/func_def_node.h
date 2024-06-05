#pragma once
#include "ast_node.h"

class FuncDefNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> name;
    std::shared_ptr<AstNode> body;

    explicit FuncDefNode() : AstNode(AstKind::FuncDefNode) {}

    static std::shared_ptr<FuncDefNode> create(const std::shared_ptr<AstNode>& p_Name, const std::shared_ptr<AstNode>& p_Body);
    static std::shared_ptr<FuncDefNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
