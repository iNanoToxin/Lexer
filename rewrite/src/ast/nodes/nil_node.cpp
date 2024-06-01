#include "nil_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NilNode> NilNode::create()
{
    return std::make_shared<NilNode>();
}

std::shared_ptr<NilNode> NilNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<NilNode>(p_Node);
}

void NilNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
