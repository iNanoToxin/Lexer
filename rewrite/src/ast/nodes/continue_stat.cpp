#include "continue_stat.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<ContinueStat> ContinueStat::create()
{
    return std::make_shared<ContinueStat>();
}

std::shared_ptr<ContinueStat> ContinueStat::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<ContinueStat>(p_Node);
}

void ContinueStat::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
