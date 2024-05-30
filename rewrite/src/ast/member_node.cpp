#include "member_node.h"
#include "visitor/ast_visitor.h"

void MemberNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void MemberNode::destroy()
{
    root->destroy();
    member->destroy();
    delete this;
}
