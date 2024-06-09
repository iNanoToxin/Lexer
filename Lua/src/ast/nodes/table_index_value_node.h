#pragma once
#include "ast_node.h"

class TableIndexValueNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::TableIndexValueNode;

public:
    std::shared_ptr<AstNode> index;
    std::shared_ptr<AstNode> value;

    explicit TableIndexValueNode() : AstNode(AstKind::TableIndexValueNode) {}

    static std::shared_ptr<TableIndexValueNode> create(const std::shared_ptr<AstNode>& p_Index, const std::shared_ptr<AstNode>& p_Value);
    void accept(AstVisitor& p_Visitor) override;
};
