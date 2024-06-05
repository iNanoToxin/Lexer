#include "block_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<BlockNode> BlockNode::create(std::list<std::shared_ptr<AstNode>> p_Statements)
{
    std::shared_ptr<BlockNode> node = std::make_shared<BlockNode>();
    node->statements = std::move(p_Statements);

    for (const std::shared_ptr<AstNode>& statement : node->statements)
    {
        if (statement != nullptr)
        {
            statement->setParent(node);
        }
    }
    return node;
}

std::shared_ptr<BlockNode> BlockNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<BlockNode>(p_Node);
}

void BlockNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
