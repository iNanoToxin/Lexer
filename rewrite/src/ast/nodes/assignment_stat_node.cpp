#include "assignment_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AssignmentStatNode> AssignmentStatNode::create(const std::shared_ptr<AstNode>& p_VariableList, const std::shared_ptr<AstNode>& p_ExpressionList)
{
    std::shared_ptr<AssignmentStatNode> node = std::make_shared<AssignmentStatNode>();
    node->variables = p_VariableList;
    node->values = p_ExpressionList;

    if (node->variables != nullptr)
    {
        node->variables->setParent(node);
    }
    if (node->values != nullptr)
    {
        node->values->setParent(node);
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

void AssignmentStatNode::remove(const std::shared_ptr<AstNode>& p_Node) {
    if (variables->kind == AstKind::AttributeListNode)
    {
        const std::shared_ptr<AttributeListNode>& attribute_list = AttributeListNode::cast(variables);
        const std::shared_ptr<VariableListNode>& vars = VariableListNode::cast(values);

        // std::size_t index = 0;
        // if (attribute_list->remove(p_Node, &index))
        // {
        //     std::cout << "CAN REMOVE: " << index << std::endl;
        //     // vars->remove(0);
        // }

        vars->remove(0);

        if (getParent()->kind == AstKind::LocalStatNode)
        {
            // block->remove(assignment->getParent());
        }
    }
}
