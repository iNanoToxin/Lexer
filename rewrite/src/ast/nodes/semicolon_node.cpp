#include "semicolon_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<SemicolonNode> SemicolonNode::create()
{
    return std::make_shared<SemicolonNode>();
}

std::shared_ptr<SemicolonNode> SemicolonNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<SemicolonNode>(p_Node);
}

void SemicolonNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
