#ifndef NIL_NODE_H
#define NIL_NODE_H

#include "ast_node.h"

class NilNode final : public AstNode
{
public:
    explicit NilNode() : AstNode(AstKind::NilNode) {}

    static std::shared_ptr<NilNode> create()
    {
        return std::make_shared<NilNode>();
    }
    static std::shared_ptr<NilNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<NilNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //NIL_NODE_H
