#include "break_stat.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<BreakStat> BreakStat::create()
{
    return std::make_shared<BreakStat>();
}

std::shared_ptr<BreakStat> BreakStat::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<BreakStat>(p_Node);
}

void BreakStat::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
