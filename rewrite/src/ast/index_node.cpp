#include "index_node.h"
#include "visitor/ast_visitor.h"

void IndexNode::accept(AstVisitor* p_Visitor) {
    p_Visitor->visit(this);
}

void IndexNode::destroy()
{
    root->destroy();
    index->destroy();
    delete this;
}
