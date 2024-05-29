#include "local_stat_node.h"
#include "visitor/ast_visitor.h"

void LocalStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void LocalStatNode::destroy()
{
    statement->destroy();
    delete this;
}
