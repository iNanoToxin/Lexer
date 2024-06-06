#pragma once
#include <vector>
#include "ast_node.h"

class NameListNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> list;

    explicit NameListNode() : AstNode(AstKind::NameListNode) {}

    static std::shared_ptr<NameListNode> create(const std::vector<std::shared_ptr<AstNode>>& p_List);
    static std::shared_ptr<NameListNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;

    bool remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index = nullptr);
    bool remove(const std::size_t p_Index);
};
