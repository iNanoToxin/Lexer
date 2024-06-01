#ifndef STRING_NODE_H
#define STRING_NODE_H

#include <utility>
#include <string>

#include "expression_node.h"

class StringNode final : public ExpressionNode
{
public:
    std::string value;

    explicit StringNode() : ExpressionNode(AstKind::StringNode) {}

    static std::shared_ptr<StringNode> create(std::string p_Value)
    {
        std::shared_ptr<StringNode> node = std::make_shared<StringNode>();
        node->value = std::move(p_Value);
        return node;
    }
    static std::shared_ptr<StringNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<StringNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};



#endif //STRING_NODE_H
