#pragma once
#include <vector>
#include "ast_node.h"

class IfStatNode final : public AstNode
{
public:
    std::vector<AstNodePair> conditionalBlocks;

    explicit IfStatNode() : AstNode(AstKind::IfStatNode) {}

    static std::shared_ptr<IfStatNode> create(std::vector<AstNodePair> p_ConditionalBlocks);
    static std::shared_ptr<IfStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
