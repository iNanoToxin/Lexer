#include "nil_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<NilNode> NilNode::create()
{
    return std::make_shared<NilNode>();
}

void NilNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<NilNode>());
}
