#include "name_list_node.h"
#include "visitor/ast_visitor.h"

void NameListNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void NameListNode::destroy()
{
    for (ExpressionNode* node : list)
    {
        node->destroy();
    }
    delete this;
}
