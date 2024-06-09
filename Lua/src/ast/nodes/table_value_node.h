#pragma once
#include "ast_node.h"

class TableValueNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::TableValueNode;

public:
    std::shared_ptr<AstNode> value;

    explicit TableValueNode() : AstNode(AstKind::TableValueNode) {}

    static std::shared_ptr<TableValueNode> create(const std::shared_ptr<AstNode>& p_Value);
    void accept(AstVisitor& p_Visitor) override;
};
