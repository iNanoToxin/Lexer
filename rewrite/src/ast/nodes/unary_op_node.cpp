#include "unary_op_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<UnaryOpNode> UnaryOpNode::create(std::string p_Operation, std::shared_ptr<AstNode> p_Value)
{
    std::shared_ptr<UnaryOpNode> node = std::make_shared<UnaryOpNode>();
    node->op = std::move(p_Operation);
    node->value = std::move(p_Value);

    if (node->value != nullptr)
    {
        node->value->parent = node;
    }
    return node;
}

std::shared_ptr<UnaryOpNode> UnaryOpNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<UnaryOpNode>(p_Node);
}

void UnaryOpNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
