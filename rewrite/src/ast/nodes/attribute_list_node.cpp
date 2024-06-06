#include "attribute_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<AttributeListNode> AttributeListNode::create(const std::vector<std::shared_ptr<AstNode>>& p_List)
{
    std::shared_ptr<AttributeListNode> node = std::make_shared<AttributeListNode>();
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

std::shared_ptr<AttributeListNode> AttributeListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<AttributeListNode>(p_Node);
}

void AttributeListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}

bool AttributeListNode::remove(const std::shared_ptr<AstNode>& p_Node, std::size_t* p_Index)
{
    for (auto it = list.begin(); it != list.end(); it++)
    {
        if (p_Node->kind == AstKind::IdentifierNode && *it == p_Node->getParent() || *it == p_Node)
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

bool AttributeListNode::remove(const std::size_t p_Index)
{
    if (p_Index >= list.size())
    {
        return false;
    }
    return remove(list[p_Index]);
}
