#include "expression_list_node.h"
#include "visitor/ast_visitor.h"

void ExpressionListNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void ExpressionListNode::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
