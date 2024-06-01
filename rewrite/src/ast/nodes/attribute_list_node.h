#pragma once
#include <vector>
#include "ast_node.h"

class AttributeListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit AttributeListNode() : AstNode(AstKind::AttributeListNode) {}

    static std::shared_ptr<AttributeListNode> create(std::vector<std::shared_ptr<AstNode>> p_List);
    static std::shared_ptr<AttributeListNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
