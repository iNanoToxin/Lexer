#pragma once
#include "ast_node.h"

class TableNameValueNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> name;
    std::shared_ptr<AstNode> value;

    explicit TableNameValueNode() : AstNode(AstKind::TableNameValueNode) {}

    static std::shared_ptr<TableNameValueNode> create(const std::shared_ptr<AstNode>& p_Name, const std::shared_ptr<AstNode>& p_Value);
    static std::shared_ptr<TableNameValueNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
