#include "attribute_node.h"
#include "visitor/ast_visitor.h"

void AttributeNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void AttributeNode::destroy()
{
    value->destroy();
    attribute->destroy();
    delete this;
}
