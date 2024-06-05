#include "parameter_list_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ParameterListNode> ParameterListNode::create(std::vector<std::shared_ptr<AstNode>> p_List)
{
    std::shared_ptr<ParameterListNode> node = std::make_shared<ParameterListNode>();
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

std::shared_ptr<ParameterListNode> ParameterListNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<ParameterListNode>(p_Node);
}

void ParameterListNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
