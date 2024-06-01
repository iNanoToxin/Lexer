#include "func_body_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FuncBodyNode> FuncBodyNode::create(std::shared_ptr<AstNode> p_ParameterList, std::shared_ptr<AstNode> p_Block)
{
    std::shared_ptr<FuncBodyNode> node = std::make_shared<FuncBodyNode>();
    node->parameters = std::move(p_ParameterList);
    node->block = std::move(p_Block);

    if (node->parameters != nullptr)
    {
        node->parameters->parent = node;
    }
    if (node->block != nullptr)
    {
        node->block->parent = node;
    }
    return node;
}

std::shared_ptr<FuncBodyNode> FuncBodyNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<FuncBodyNode>(p_Node);
}

void FuncBodyNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
