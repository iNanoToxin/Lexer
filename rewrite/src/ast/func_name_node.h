#ifndef FUNC_NAME_NODE_H
#define FUNC_NAME_NODE_H

#include <utility>

#include "expression_node.h"

class FuncNameNode final : public ExpressionNode
{
public:
    std::shared_ptr<ExpressionNode> name;

    explicit FuncNameNode() : ExpressionNode(AstKind::FuncNameNode) {}

    static std::shared_ptr<FuncNameNode> create(std::shared_ptr<ExpressionNode> p_Name)
    {
        std::shared_ptr<FuncNameNode> node = std::make_shared<FuncNameNode>();
        node->name = std::move(p_Name);

        if (node->name != nullptr)
        {
            node->name->parent = node;
        }
        return node;
    }
    static std::shared_ptr<FuncNameNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<FuncNameNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //FUNC_NAME_NODE_H
