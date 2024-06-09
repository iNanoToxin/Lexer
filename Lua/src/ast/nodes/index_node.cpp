#include "index_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<IndexNode> IndexNode::create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Index)
{
    std::shared_ptr<IndexNode> node = std::make_shared<IndexNode>();
    node->root = p_Root;
    node->index = p_Index;

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

void IndexNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<IndexNode>());
}
