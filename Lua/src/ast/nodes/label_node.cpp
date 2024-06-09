#include "label_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<LabelNode> LabelNode::create(const std::shared_ptr<AstNode>& p_Label)
{
    std::shared_ptr<LabelNode> node = std::make_shared<LabelNode>();
    node->label = p_Label;

    if (node->label != nullptr)
    {
        node->label->setParent(node);
    }
    return node;
}

void LabelNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast<LabelNode>());
}
