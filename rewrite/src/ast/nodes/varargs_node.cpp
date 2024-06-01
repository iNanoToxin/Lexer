#include "varargs_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<VarargsNode> VarargsNode::create()
{
    return std::make_shared<VarargsNode>();
}

std::shared_ptr<VarargsNode> VarargsNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<VarargsNode>(p_Node);
}

void VarargsNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
