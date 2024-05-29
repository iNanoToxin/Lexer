#include "field_list_node.h"
#include "visitor/ast_visitor.h"

void FieldListNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void FieldListNode::destroy()
{
    for (ExpressionNode* node : list)
    {
        node->destroy();
    }
    delete this;
}
