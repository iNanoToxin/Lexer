#pragma once
#include <vector>
#include "ast_node.h"

class AttributeListNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::AttributeListNode;

public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit AttributeListNode() : AstNode(AstKind::AttributeListNode) {}

    static std::shared_ptr<AttributeListNode> create(const std::vector<std::shared_ptr<AstNode>>& p_List);
    void accept(AstVisitor& p_Visitor) override;

    bool remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index = nullptr);
    bool remove(std::size_t p_Index);
};
