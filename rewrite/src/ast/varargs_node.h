#ifndef VARARGS_NODE_H
#define VARARGS_NODE_H

#include "expression_node.h"

class VarargsNode final : public ExpressionNode
{
public:
    explicit VarargsNode() : ExpressionNode(AstKind::VarargsNode) {}

    static std::shared_ptr<VarargsNode> create()
    {
        return std::make_shared<VarargsNode>();
    }
    static std::shared_ptr<VarargsNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<VarargsNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //VARARGS_NODE_H
