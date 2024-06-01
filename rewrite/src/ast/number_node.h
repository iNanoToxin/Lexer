#ifndef NUMBERNODE_H
#define NUMBERNODE_H

#include <string>
#include "ast_node.h"

class NumberNode final : public AstNode {
public:
    int value{};

    explicit NumberNode() : AstNode(AstKind::NumberNode) {}

    static std::shared_ptr<NumberNode> create(const int p_Value)
    {
        std::shared_ptr<NumberNode> node = std::make_shared<NumberNode>();
        node->value = p_Value;
        return node;
    }
    static std::shared_ptr<NumberNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<NumberNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif
