#include "assignment_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AssignmentStatNode> AssignmentStatNode::create(std::shared_ptr<AstNode> p_VariableList, std::shared_ptr<AstNode> p_ExpressionList)
{
    std::shared_ptr<AssignmentStatNode> node = std::make_shared<AssignmentStatNode>();
    node->variableList = std::move(p_VariableList);
    node->expressionList = std::move(p_ExpressionList);

    if (node->variableList != nullptr)
    {
        node->variableList->parent = node;
    }
    if (node->expressionList != nullptr)
    {
        node->expressionList->parent = node;
    }
    return node;
}

std::shared_ptr<AssignmentStatNode> AssignmentStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<AssignmentStatNode>(p_Node);
}

void AssignmentStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
