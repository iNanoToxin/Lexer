#include "expression_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ExpressionListNode> ExpressionListNode::create(std::vector<std::shared_ptr<AstNode>> p_List)
{
    std::shared_ptr<ExpressionListNode> node = std::make_shared<ExpressionListNode>();
    node->list = std::move(p_List);

    for (const std::shared_ptr<AstNode>& child : node->list)
    {
        if (child != nullptr)
        {
            child->parent = node;
        }
    }
    return node;
}

std::shared_ptr<ExpressionListNode> ExpressionListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<ExpressionListNode>(p_Node);
}

void ExpressionListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
