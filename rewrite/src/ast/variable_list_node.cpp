#include "variable_list_node.h"
#include "visitor/ast_visitor.h"

void VariableListNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void VariableListNode::destroy()
{
    for (ExpressionNode* node : list)
    {
        node->destroy();
    }
    delete this;
}
