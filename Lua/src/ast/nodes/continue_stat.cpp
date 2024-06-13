#include "continue_stat.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ContinueStat> ContinueStat::create()
{
    return std::make_shared<ContinueStat>();
}

void ContinueStat::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visitNode(cast<ContinueStat>());
}
