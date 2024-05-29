#include "break_stat.h"
#include "visitor/ast_visitor.h"

void BreakStat::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void BreakStat::destroy()
{
    ptr1->destroy();
    ptr2->destroy();
    delete this;
}
