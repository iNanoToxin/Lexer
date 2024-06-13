#include "varargs_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<VarargsNode> VarargsNode::create()
{
    return std::make_shared<VarargsNode>();
}

void VarargsNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<VarargsNode>());
}
