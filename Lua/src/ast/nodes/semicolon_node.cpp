#include "semicolon_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<SemicolonNode> SemicolonNode::create()
{
    return std::make_shared<SemicolonNode>();
}

void SemicolonNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<SemicolonNode>());
}
