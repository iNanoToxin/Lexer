#include "goto_stat_node.h"
#include "visitor/ast_visitor.h"

void GotoStatNode::accept(AstVisitor& p_Visitor) {
    p_Visitor.visit(cast(shared_from_this()));
}
