#include "local_stat_node.h"
#include "visitor/ast_visitor.h"

void LocalStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void LocalStatNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
