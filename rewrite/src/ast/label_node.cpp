#include "label_node.h"
#include "visitor/ast_visitor.h"

void LabelNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void LabelNode::destroy()
{
    label->destroy();
    delete this;
}
