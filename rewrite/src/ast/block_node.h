#ifndef BLOCK_NODE_H
#define BLOCK_NODE_H

#include <utility>
#include <vector>
#include "ast_node.h"

class BlockNode final : public AstNode
{
public:
    std::vector<std::shared_ptr<AstNode>> statements;

    explicit BlockNode() : AstNode(AstKind::BlockNode) {}

    static std::shared_ptr<BlockNode> create(std::vector<std::shared_ptr<AstNode>> p_Statements)
    {
        std::shared_ptr<BlockNode> node = std::make_shared<BlockNode>();
        node->statements = std::move(p_Statements);

        for (const std::shared_ptr<AstNode>& statement : node->statements)
        {
            if (statement)
            {
                statement->parent = node;
            }
        }
        return node;
    }
    static std::shared_ptr<BlockNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<BlockNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //BLOCK_NODE_H
