#include "member_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<MemberNode> MemberNode::create(const std::shared_ptr<AstNode>& p_Root, const std::shared_ptr<AstNode>& p_Member)
{
    std::shared_ptr<MemberNode> node = std::make_shared<MemberNode>();
    node->root = p_Root;
    node->member = p_Member;

    if (node->root != nullptr)
    {
        node->root->setParent(node);
    }
    if (node->member != nullptr)
    {
        node->member->setParent(node);
    }
    return node;
}

std::shared_ptr<MemberNode> MemberNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<MemberNode>(p_Node);
}

void MemberNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
