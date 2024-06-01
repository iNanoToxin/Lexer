#ifndef ASSIGNMENT_STAT_NODE_H
#define ASSIGNMENT_STAT_NODE_H

#include <utility>

#include "ast_node.h"

class AssignmentStatNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> variableList;
    std::shared_ptr<AstNode> expressionList;

    explicit AssignmentStatNode() : AstNode(AstKind::AssignmentStatNode) {}

    static std::shared_ptr<AssignmentStatNode> create(std::shared_ptr<AstNode> p_VariableList, std::shared_ptr<AstNode> p_ExpressionList)
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
    static std::shared_ptr<AssignmentStatNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<AssignmentStatNode>(p_Node);
    }

    void accept(AstVisitor& p_Visitor) override;
};

#endif //ASSIGNMENT_STAT_NODE_H
