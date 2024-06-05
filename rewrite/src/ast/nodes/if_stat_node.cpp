#include "if_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<IfStatNode> IfStatNode::create(const std::list<AstNodePair>& p_ConditionalBlocks)
{
    std::shared_ptr<IfStatNode> node = std::make_shared<IfStatNode>();
    node->blocks = p_ConditionalBlocks;

    for (const AstNodePair& pair : node->blocks)
    {
        if (pair.first != nullptr)
        {
            pair.first->setParent(node);
        }
        if (pair.second != nullptr)
        {
            pair.second->setParent(node);
        }
    }
    return node;
}

std::shared_ptr<IfStatNode> IfStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<IfStatNode>(p_Node);
}

void IfStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
