#ifndef BOOLEAN_NODE_H
#define BOOLEAN_NODE_H

#include "ast_node.h"

class BooleanNode final : public AstNode
{
public:
    bool value{};

    explicit BooleanNode() : AstNode(AstKind::BooleanNode) {}

    static std::shared_ptr<BooleanNode> create(const bool p_Value)
    {
        std::shared_ptr<BooleanNode> node = std::make_shared<BooleanNode>();
        node->value = p_Value;
        return node;
    }
    static std::shared_ptr<BooleanNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<BooleanNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};



#endif //BOOLEAN_NODE_H
