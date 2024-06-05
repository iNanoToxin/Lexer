#include "goto_stat_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<GotoStatNode> GotoStatNode::create(const std::shared_ptr<AstNode>& p_Label)
{
    std::shared_ptr<GotoStatNode> node = std::make_shared<GotoStatNode>();
    node->label = p_Label;

    if (node->label != nullptr)
    {
        node->label->setParent(node);
    }
    return node;
}

std::shared_ptr<GotoStatNode> GotoStatNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<GotoStatNode>(p_Node);
}

void GotoStatNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
