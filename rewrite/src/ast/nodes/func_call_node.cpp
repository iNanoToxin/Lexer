#include "func_call_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FuncCallNode> FuncCallNode::create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Args)
{
    std::shared_ptr<FuncCallNode> node = std::make_shared<FuncCallNode>();
    node->root = p_Root;
    node->args = p_Args;

    if (node->root != nullptr)
    {
        node->root->setParent(node);
    }
    if (node->args != nullptr)
    {
        node->args->setParent(node);
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
