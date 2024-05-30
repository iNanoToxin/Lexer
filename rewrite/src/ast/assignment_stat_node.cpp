#include "assignment_stat_node.h"
#include "visitor/ast_visitor.h"

void AssignmentStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void AssignmentStatNode::destroy()
{
    variableList->destroy();
    expressionList->destroy();
    delete this;
}
