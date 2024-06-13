#include "break_stat.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<BreakStat> BreakStat::create()
{
    return std::make_shared<BreakStat>();
}

void BreakStat::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<BreakStat>());
}
