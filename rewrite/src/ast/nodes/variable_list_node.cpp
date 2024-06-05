#include "variable_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<VariableListNode> VariableListNode::create(std::vector<std::shared_ptr<AstNode>> p_List)
{
    std::shared_ptr<VariableListNode> node = std::make_shared<VariableListNode>();
    node->list = std::move(p_List);

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
