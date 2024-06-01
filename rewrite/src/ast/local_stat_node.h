#ifndef LOCAL_STAT_NODE_H
#define LOCAL_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class LocalStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> statement;

    explicit LocalStatNode() : AstNode(AstKind::LocalStatNode) {}

    static std::shared_ptr<LocalStatNode> create(std::shared_ptr<AstNode> p_Statement)
    {
        std::shared_ptr<LocalStatNode> node = std::make_shared<LocalStatNode>();
        node->statement = std::move(p_Statement);

        if (node->statement != nullptr)
        {
            node->statement->parent = node;
        }
        return node;
    }
    static std::shared_ptr<LocalStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<LocalStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //LOCAL_STAT_NODE_H
