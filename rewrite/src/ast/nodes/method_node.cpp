#include "method_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<MethodNode> MethodNode::create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Name)
{
    std::shared_ptr<MethodNode> node = std::make_shared<MethodNode>();
    node->root = p_Root;
    node->method = p_Name;

    if (node->root != nullptr)
    {
        node->root->setParent(node);
    }
    if (node->method != nullptr)
    {
        node->method->setParent(node);
    }
    return node;
}

std::shared_ptr<MethodNode> MethodNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<MethodNode>(p_Node);
}

void MethodNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
