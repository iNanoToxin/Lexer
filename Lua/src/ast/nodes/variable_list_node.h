#pragma once
#include <vector>
#include "ast_node.h"

class VariableListNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::VariableListNode;

public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit VariableListNode() : AstNode(AstKind::VariableListNode) {}

    static std::shared_ptr<VariableListNode> create(const std::vector<std::shared_ptr<AstNode>>& p_List);
    void accept(AstVisitor& p_Visitor) override;

    bool remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index = nullptr);
    bool remove(std::size_t p_Index);
};
