#include "func_name_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<FuncNameNode> FuncNameNode::create(const std::shared_ptr<AstNode>& p_Name)
{
    std::shared_ptr<FuncNameNode> node = std::make_shared<FuncNameNode>();
    node->name = p_Name;

    if (node->name != nullptr)
    {
        node->name->setParent(node);
    }
    return node;
}

std::shared_ptr<FuncNameNode> FuncNameNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<FuncNameNode>(p_Node);
}

void FuncNameNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
