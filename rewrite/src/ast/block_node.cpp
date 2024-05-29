#include "block_node.h"
#include "visitor/ast_visitor.h"

void BlockNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void BlockNode::destroy()
{
    for (ExpressionNode* node : statements)
    {
        node->destroy();
    }
    delete this;
}
