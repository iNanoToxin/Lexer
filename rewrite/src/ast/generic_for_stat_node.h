#ifndef GENERIC_FOR_STAT_NODE_H
#define GENERIC_FOR_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class GenericForStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> nameList;
    std::shared_ptr<AstNode> expressionList;
    std::shared_ptr<AstNode> block;

    explicit GenericForStatNode() : AstNode(AstKind::GenericForStatNode) {}

    static std::shared_ptr<GenericForStatNode> create(std::shared_ptr<AstNode> p_NameList, std::shared_ptr<AstNode> p_ExpressionList, std::shared_ptr<AstNode> p_Block)
    {
        std::shared_ptr<GenericForStatNode> node = std::make_shared<GenericForStatNode>();
        node->nameList = std::move(p_NameList);
        node->expressionList = std::move(p_ExpressionList);
        node->block = std::move(p_Block);

        if (node->nameList != nullptr)
        {
            node->nameList->parent = node;
        }
        if (node->expressionList != nullptr)
        {
            node->expressionList->parent = node;
        }
        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        return node;
    }
    static std::shared_ptr<GenericForStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<GenericForStatNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //GENERIC_FOR_STAT_NODE_H
