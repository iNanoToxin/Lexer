#include "if_stat_node.h"
#include "visitor/ast_visitor.h"

void IfStatNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void IfStatNode::destroy()
{
    for (ExpressionNode* node : conditionalBlocks)
    {
        node->destroy();
    }
    delete this;
}
