#include "generic_for_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<GenericForStatNode> GenericForStatNode::create(const std::shared_ptr<AstNode>& p_NameList, const std::shared_ptr<AstNode>& p_ExpressionList, const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<GenericForStatNode> node = std::make_shared<GenericForStatNode>();
    node->names = p_NameList;
    node->expressions = p_ExpressionList;
    node->block = p_Block;

    if (node->names != nullptr)
    {
        node->names->setParent(node);
    }
    if (node->expressions != nullptr)
    {
        node->expressions->setParent(node);
    }
    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

void GenericForStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<GenericForStatNode>());
}
