#ifndef IDENTIFIER_NODE_H
#define IDENTIFIER_NODE_H

#include <utility>
#include <string>

#include "expression_node.h"

class IdentifierNode final : public ExpressionNode
{
public:
    std::string value;

    explicit IdentifierNode() : ExpressionNode(AstKind::IdentifierNode) {}

    static std::shared_ptr<IdentifierNode> create(std::string p_Value)
    {
        std::shared_ptr<IdentifierNode> node = std::make_shared<IdentifierNode>();
        node->value = std::move(p_Value);
        return node;
    }
    static std::shared_ptr<IdentifierNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<IdentifierNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};



#endif //IDENTIFIER_NODE_H
