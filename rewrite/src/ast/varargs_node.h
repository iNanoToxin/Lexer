#ifndef VARARGS_NODE_H
#define VARARGS_NODE_H

#include "ast_node.h"

class VarargsNode final : public AstNode
{
public:
    explicit VarargsNode() : AstNode(AstKind::VarargsNode) {}

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
