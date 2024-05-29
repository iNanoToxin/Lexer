#include "repeat_stat_node.h"
#include "visitor/ast_visitor.h"

void RepeatStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void RepeatStatNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
