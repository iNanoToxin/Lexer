#include "table_value_node.h"
#include "visitor/ast_visitor.h"

void TableValueNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void TableValueNode::destroy()
{
    value->destroy();
    delete this;
}
