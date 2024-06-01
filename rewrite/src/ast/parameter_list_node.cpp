#include "parameter_list_node.h"
#include "visitor/ast_visitor.h"

void ParameterListNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
