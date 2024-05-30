#include "table_index_value_node.h"
#include "visitor/ast_visitor.h"

void TableIndexValueNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void TableIndexValueNode::destroy()
{
    index->destroy();
    value->destroy();
    delete this;
}
