#pragma once
#include "ast_node.h"

class TableIndexValueNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> index;
    std::shared_ptr<AstNode> value;

    explicit TableIndexValueNode() : AstNode(AstKind::TableIndexValueNode) {}

    static std::shared_ptr<TableIndexValueNode> create(const std::shared_ptr<AstNode>& p_Index, const std::shared_ptr<AstNode>& p_Value);
    static std::shared_ptr<TableIndexValueNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
