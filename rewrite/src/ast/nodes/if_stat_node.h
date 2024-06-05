#pragma once
#include <list>
#include "ast_node.h"

class IfStatNode final : public AstNode
{
public:
    std::list<AstNodePair> blocks;

    explicit IfStatNode() : AstNode(AstKind::IfStatNode) {}

    static std::shared_ptr<IfStatNode> create(const std::list<AstNodePair>& p_ConditionalBlocks);
    static std::shared_ptr<IfStatNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
