#include "func_body_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FuncBodyNode> FuncBodyNode::create(const std::shared_ptr<AstNode>& p_ParameterList, const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<FuncBodyNode> node = std::make_shared<FuncBodyNode>();
    node->parameters = p_ParameterList;
    node->block = p_Block;

    if (node->parameters != nullptr)
    {
        node->parameters->setParent(node);
    }
    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

void FuncBodyNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<FuncBodyNode>());
}
