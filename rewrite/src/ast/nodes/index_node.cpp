#include "index_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<IndexNode> IndexNode::create(std::shared_ptr<AstNode> p_Root, std::shared_ptr<AstNode> p_Index)
{
    std::shared_ptr<IndexNode> node = std::make_shared<IndexNode>();
    node->root = std::move(p_Root);
    node->index = std::move(p_Index);

    if (node->root != nullptr)
    {
        node->root->setParent(node);
    }
    if (node->index != nullptr)
    {
        node->index->setParent(node);
    }
    return node;
}

std::shared_ptr<IndexNode> IndexNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<IndexNode>(p_Node);
}

void IndexNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
