#include "binary_op_node.h"
#include <utilities/assert.h>
#include "ast/visitors/ast_visitor.h"

BinaryOpKind get_binary_operator_kind(const std::string& p_Operator)
{
    if (p_Operator == "+") return BinaryOpKind::Plus;
    if (p_Operator == "-") return BinaryOpKind::Minus;
    if (p_Operator == "*") return BinaryOpKind::Multiply;
    if (p_Operator == "/") return BinaryOpKind::FloatDivision;
    if (p_Operator == "//") return BinaryOpKind::FloorDivision;
    if (p_Operator == "^") return BinaryOpKind::Power;
    if (p_Operator == "%") return BinaryOpKind::Modulus;
    if (p_Operator == "&") return BinaryOpKind::BitAnd;
    if (p_Operator == "~") return BinaryOpKind::BitExOr;
    if (p_Operator == "|") return BinaryOpKind::BitOr;
    if (p_Operator == ">>") return BinaryOpKind::RightShift;
    if (p_Operator == "<<") return BinaryOpKind::LeftShift;
    if (p_Operator == "..") return BinaryOpKind::Concat;
    if (p_Operator == "<") return BinaryOpKind::LessThan;
    if (p_Operator == "<=") return BinaryOpKind::LessEqual;
    if (p_Operator == ">") return BinaryOpKind::GreaterThan;
    if (p_Operator == ">=") return BinaryOpKind::GreaterEqual;
    if (p_Operator == "==") return BinaryOpKind::Equal;
    if (p_Operator == "~=") return BinaryOpKind::NotEqual;
    if (p_Operator == "and") return BinaryOpKind::And;
    if (p_Operator == "or") return BinaryOpKind::Or;
    LL_failure("p_Operator != BinaryOpKind", "Invalid binary operator kind.", p_Operator.c_str());
    return BinaryOpKind{};
}

std::shared_ptr<BinaryOpNode> BinaryOpNode::create(const std::shared_ptr<AstNode>& p_Lhs, const std::string& p_Operator, const std::shared_ptr<AstNode>& p_Rhs)
{
    std::shared_ptr<BinaryOpNode> node = std::make_shared<BinaryOpNode>();
    node->opKind = get_binary_operator_kind(p_Operator);
    node->op = p_Operator;
    node->lhs = p_Lhs;
    node->rhs = p_Rhs;

    if (node->lhs != nullptr)
    {
        node->lhs->setParent(node);
    }
    if (node->rhs != nullptr)
    {
        node->rhs->setParent(node);
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
