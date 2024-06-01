#ifndef ARGUMENT_LIST_NODE_H
#define ARGUMENT_LIST_NODE_H

#include <utility>
#include "expression_node.h"

class ArgumentListNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> list;

    explicit ArgumentListNode() : ExpressionNode(AstKind::ArgumentListNode) {}

    static std::shared_ptr<ArgumentListNode> create(std::shared_ptr<ExpressionNode> p_List)
    {
        std::shared_ptr<ArgumentListNode> node = std::make_shared<ArgumentListNode>();
        node->list = std::move(p_List);

        if (node->list != nullptr)
        {
            node->list->parent = node;
        }
        return node;
    }
    static std::shared_ptr<ArgumentListNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ArgumentListNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //ARGUMENT_LIST_NODE_H
