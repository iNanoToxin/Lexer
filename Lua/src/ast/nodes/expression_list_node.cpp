#include "expression_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ExpressionListNode> ExpressionListNode::create(const std::vector<std::shared_ptr<AstNode>>& p_List)
{
    std::shared_ptr<ExpressionListNode> node = std::make_shared<ExpressionListNode>();
    node->list = p_List;

    for (const std::shared_ptr<AstNode>& child : node->list)
    {
        if (child != nullptr)
        {
            child->setParent(node);
        }
    }
    return node;
}

void ExpressionListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<ExpressionListNode>());
}

bool ExpressionListNode::remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index)
{
    for (auto it = list.begin(); it != list.end(); it++)
    {
        if (*it == p_Node)
        {
            if (p_Index != nullptr)
            {
                *p_Index = std::distance(list.begin(), it);
            }
            list.erase(it);
            return true;
        }
    }
    return false;
}

bool ExpressionListNode::remove(const std::size_t p_Index)
{
    if (p_Index >= list.size())
    {
        return false;
    }
    return remove(list[p_Index]);
}
