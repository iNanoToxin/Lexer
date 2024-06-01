#ifndef NIL_NODE_H
#define NIL_NODE_H

#include "expression_node.h"

class NilNode final : public ExpressionNode
{
public:
    explicit NilNode() : ExpressionNode(AstKind::NilNode) {}

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
