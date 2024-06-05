#pragma once
#include "ast_node.h"

class TableConstructorNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> fieldList;

    explicit TableConstructorNode() : AstNode(AstKind::TableConstructorNode) {}

    static std::shared_ptr<TableConstructorNode> create(const std::shared_ptr<AstNode>& p_FieldList);
    static std::shared_ptr<TableConstructorNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
