#pragma once
#include <list>
#include "ast_node.h"

class BlockNode final : public AstNode
{
public:
    std::list<std::shared_ptr<AstNode>> statements;

    explicit BlockNode() : AstNode(AstKind::BlockNode) {}

    static std::shared_ptr<BlockNode> create(const std::list<std::shared_ptr<AstNode>>& p_Statements);
    static std::shared_ptr<BlockNode> cast(const std::shared_ptr<AstNode>& p_Node);
    void accept(AstVisitor& p_Visitor) override;

    void remove(const std::shared_ptr<AstNode>& p_Statement)
    {
        for (auto it = statements.begin(); it != statements.end(); it++)
        {
            if (*it == p_Statement)
            {
                statements.erase(it);
                break;
            }
        }
    }
};
