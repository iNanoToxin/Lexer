#pragma once
#include <vector>
#include "ast_node.h"

class ParameterListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit ParameterListNode() : AstNode(AstKind::ParameterListNode) {}

    static std::shared_ptr<ParameterListNode> create(const std::vector<std::shared_ptr<AstNode>>& p_List);
    static std::shared_ptr<ParameterListNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
