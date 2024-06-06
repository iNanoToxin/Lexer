#include "variable_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<VariableListNode> VariableListNode::create(const std::vector<std::shared_ptr<AstNode>>& p_List)
{
    std::shared_ptr<VariableListNode> node = std::make_shared<VariableListNode>();
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

std::shared_ptr<VariableListNode> VariableListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<VariableListNode>(p_Node);
}

void VariableListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}

bool VariableListNode::remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index)
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

bool VariableListNode::remove(const std::size_t p_Index)
{
    if (p_Index >= list.size())
    {
        return false;
    }
    return remove(list[p_Index]);
}
