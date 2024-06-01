#include "func_call_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FuncCallNode> FuncCallNode::create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Args)
{
    std::shared_ptr<FuncCallNode> node = std::make_shared<FuncCallNode>();
    node->root = std::move(p_Root);
    node->args = std::move(p_Args);

    if (node->root != nullptr)
    {
        node->root->parent = node;
    }
    if (node->args != nullptr)
    {
        node->args->parent = node;
    }
    return node;
}

std::shared_ptr<FuncCallNode> FuncCallNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<FuncCallNode>(p_Node);
}

void FuncCallNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
