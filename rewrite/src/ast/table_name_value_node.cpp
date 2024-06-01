#include "table_name_value_node.h"
#include "visitor/ast_visitor.h"

void TableNameValueNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
