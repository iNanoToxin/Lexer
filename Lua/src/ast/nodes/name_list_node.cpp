#include "name_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NameListNode> NameListNode::create(const std::vector<std::shared_ptr<AstNode>>& p_List)
{
    std::shared_ptr<NameListNode> node = std::make_shared<NameListNode>();
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

void NameListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<NameListNode>());
}

bool NameListNode::remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index)
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

bool NameListNode::remove(const std::size_t p_Index)
{
    if (p_Index >= list.size())
    {
        return false;
    }
    return remove(list[p_Index]);
}
