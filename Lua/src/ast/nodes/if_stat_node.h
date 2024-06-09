#pragma once
#include <list>
#include "ast_node.h"

class IfStatNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::IfStatNode;

public:
    std::list<AstNodePair> blocks;

    explicit IfStatNode() : AstNode(AstKind::IfStatNode) {}

    static std::shared_ptr<IfStatNode> create(const std::list<AstNodePair>& p_ConditionalBlocks);
    void accept(AstVisitor& p_Visitor) override;
};
