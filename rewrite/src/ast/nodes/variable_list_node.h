#pragma once
#include <vector>
#include "ast_node.h"

class VariableListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit VariableListNode() : AstNode(AstKind::VariableListNode) {}

    static std::shared_ptr<VariableListNode> create(const std::vector<std::shared_ptr<AstNode>>& p_List);
    static std::shared_ptr<VariableListNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
