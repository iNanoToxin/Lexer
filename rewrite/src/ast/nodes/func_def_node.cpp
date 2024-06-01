#include "func_def_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FuncDefNode> FuncDefNode::create(std::shared_ptr<AstNode> p_Name, std::shared_ptr<AstNode> p_Body)
{
    std::shared_ptr<FuncDefNode> node = std::make_shared<FuncDefNode>();
    node->name = std::move(p_Name);
    node->body = std::move(p_Body);

    if (node->name != nullptr)
    {
        node->name->parent = node;
    }
    if (node->body != nullptr)
    {
        node->body->parent = node;
    }
    return node;
}

std::shared_ptr<FuncDefNode> FuncDefNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<FuncDefNode>(p_Node);
}

void FuncDefNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
