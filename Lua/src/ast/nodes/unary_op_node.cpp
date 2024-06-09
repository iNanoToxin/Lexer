#include "unary_op_node.h"
#include <utilities/assert.h>
#include "ast/visitors/ast_visitor.h"

UnaryOpKind get_unary_operator_kind(const std::string& p_Operator)
{
    if (p_Operator == "not") return UnaryOpKind::Not;
    if (p_Operator == "#") return UnaryOpKind::Length;
    if (p_Operator == "-") return UnaryOpKind::Negate;
    if (p_Operator == "~") return UnaryOpKind::BitNot;
    LL_failure("p_Operator != UnaryOpKind", "Invalid unary operator kind.", p_Operator.c_str());
    return UnaryOpKind{};
}

std::shared_ptr<UnaryOpNode> UnaryOpNode::create(const std::string& p_Operation, const std::shared_ptr<AstNode>& p_Value)
{
    std::shared_ptr<UnaryOpNode> node = std::make_shared<UnaryOpNode>();
    node->opKind = get_unary_operator_kind(p_Operation);
    node->op = p_Operation;
    node->value = p_Value;

    if (node->value != nullptr)
    {
        node->value->setParent(node);
    }
    return node;
}

void UnaryOpNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<UnaryOpNode>());
}
