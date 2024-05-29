#include "while_stat_node.h"
#include "visitor/ast_visitor.h"

void WhileStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void WhileStatNode::destroy()
{
    condition->destroy();
    block->destroy();
    delete this;
}
