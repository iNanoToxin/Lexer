#ifndef METHOD_NODE_H
#define METHOD_NODE_H

#include <utility>

#include "expression_node.h"

class MethodNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> root;
    std::shared_ptr<ExpressionNode> method;

    explicit MethodNode() : ExpressionNode(AstKind::MethodNode) {}

    static std::shared_ptr<MethodNode> create(std::shared_ptr<ExpressionNode> p_Root, std::shared_ptr<ExpressionNode> p_Name)
    {
        std::shared_ptr<MethodNode> node = std::make_shared<MethodNode>();
        node->root = std::move(p_Root);
        node->method = std::move(p_Name);

        if (node->root != nullptr)
        {
            node->root->parent = node;
        }
        if (node->method != nullptr)
        {
            node->method->parent = node;
        }
        return node;
    }
    static std::shared_ptr<MethodNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<MethodNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //METHOD_NODE_H
