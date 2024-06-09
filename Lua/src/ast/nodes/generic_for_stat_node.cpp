#include "generic_for_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<GenericForStatNode> GenericForStatNode::create(const std::shared_ptr<AstNode>& p_NameList, const std::shared_ptr<AstNode>& p_ExpressionList, const std::shared_ptr<AstNode>& p_Block)
{
    std::shared_ptr<GenericForStatNode> node = std::make_shared<GenericForStatNode>();
    node->nameList = p_NameList;
    node->expressionList = p_ExpressionList;
    node->block = p_Block;

    if (node->nameList != nullptr)
    {
        node->nameList->setParent(node);
    }
    if (node->expressionList != nullptr)
    {
        node->expressionList->setParent(node);
    }
    if (node->block != nullptr)
    {
        node->block->setParent(node);
    }
    return node;
}

void GenericForStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<GenericForStatNode>());
}
