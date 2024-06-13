#include "assignment_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AssignmentStatNode> AssignmentStatNode::create(const std::shared_ptr<AstNode>& p_VariableList, const std::shared_ptr<AstNode>& p_ExpressionList)
{
    std::shared_ptr<AssignmentStatNode> node = std::make_shared<AssignmentStatNode>();
    node->lValues = p_VariableList;
    node->rValues = p_ExpressionList;

    if (node->lValues != nullptr)
    {
        node->lValues->setParent(node);
    }
    if (node->rValues != nullptr)
    {
        node->rValues->setParent(node);
    }
    return node;
}

void AssignmentStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<AssignmentStatNode>());
}

void AssignmentStatNode::remove(const std::shared_ptr<AstNode>& p_Node)
{
    if (lValues->kind == AstKind::AttributeListNode)
    {
        const std::shared_ptr<AttributeListNode>& l_values = lValues->cast<AttributeListNode>();
        const std::shared_ptr<ExpressionListNode>& r_values = rValues->cast<ExpressionListNode>();

        std::size_t index;
        if (l_values->remove(p_Node, &index))
        {
            r_values->remove(index);

            if (l_values->list.empty())
            {
                p_Node->getBlock()->remove(getParent<LocalStatNode>());
            }
            else if (r_values->list.empty())
            {
                getParent<LocalStatNode>()->statement = lValues;
            }
        }
    }
    else if (lValues->kind == AstKind::VariableListNode)
    {
        const std::shared_ptr<VariableListNode>& l_values = lValues->cast<VariableListNode>();
        const std::shared_ptr<ExpressionListNode>& r_values = rValues->cast<ExpressionListNode>();

        std::size_t index;
        if (l_values->remove(p_Node, &index))
        {
            r_values->remove(index);

            if (l_values->list.empty())
            {
                p_Node->getBlock()->remove(shared_from_this());
            }
        }
    }
}
