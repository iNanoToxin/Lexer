#include "parameter_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ParameterListNode> ParameterListNode::create(const std::vector<std::shared_ptr<AstNode>>& p_List)
{
    std::shared_ptr<ParameterListNode> node = std::make_shared<ParameterListNode>();
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

void ParameterListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<ParameterListNode>());
}

bool ParameterListNode::remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index)
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

bool ParameterListNode::remove(const std::size_t p_Index)
{
    if (p_Index >= list.size())
    {
        return false;
    }
    return remove(list[p_Index]);
}
