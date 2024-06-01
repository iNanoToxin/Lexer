#include "if_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<IfStatNode> IfStatNode::create(std::vector<AstNodePair> p_ConditionalBlocks)
{
    std::shared_ptr<IfStatNode> node = std::make_shared<IfStatNode>();
    node->conditionalBlocks = std::move(p_ConditionalBlocks);

    for (const AstNodePair& pair : node->conditionalBlocks)
    {
        if (pair.first != nullptr)
        {
            pair.first->parent = node;
        }
        if (pair.second != nullptr)
        {
            pair.second->parent = node;
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
