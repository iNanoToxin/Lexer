#pragma once
#include "ast_node.h"

class ArgumentListNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> list;

    explicit ArgumentListNode() : AstNode(AstKind::ArgumentListNode) {}

    static std::shared_ptr<ArgumentListNode> create(std::shared_ptr<AstNode> p_List);
    static std::shared_ptr<ArgumentListNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;
};
