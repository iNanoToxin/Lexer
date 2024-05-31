#include "generic_for_stat_node.h"
#include "visitor/ast_visitor.h"

void GenericForStatNode::accept(AstVisitor* p_Visitor)
{
    p_Visitor->visit(this);
}

void GenericForStatNode::destroy()
{
    nameList->destroy();
    expressionList->destroy();
    block->destroy();
    delete this;
}
