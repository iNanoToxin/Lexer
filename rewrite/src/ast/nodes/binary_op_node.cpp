#include "binary_op_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<BinaryOpNode> BinaryOpNode::create(std::shared_ptr<AstNode> p_Lhs, std::string p_Operator, std::shared_ptr<AstNode> p_Rhs)
{
    std::shared_ptr<BinaryOpNode> node = std::make_shared<BinaryOpNode>();
    node->lhs = std::move(p_Lhs);
    node->rhs = std::move(p_Rhs);
    node->op = std::move(p_Operator);

    if (node->lhs != nullptr)
    {
        node->lhs->parent = node;
    }
    if (node->rhs != nullptr)
    {
        node->rhs->parent = node;
    }
    return node;
}

std::shared_ptr<BinaryOpNode> BinaryOpNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<BinaryOpNode>(p_Node);
}

void BinaryOpNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
