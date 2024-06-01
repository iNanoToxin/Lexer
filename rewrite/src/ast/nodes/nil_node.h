#pragma once
#include "ast_node.h"

class NilNode final : public AstNode
{
public:
    explicit NilNode() : AstNode(AstKind::NilNode) {}

    static std::shared_ptr<NilNode> create();
    static std::shared_ptr<NilNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
