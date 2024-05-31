#include "continue_stat.h"
#include "visitor/ast_visitor.h"

void ContinueStat::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}
