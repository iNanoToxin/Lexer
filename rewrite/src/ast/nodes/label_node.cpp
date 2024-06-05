#include "label_node.h"
#include "ast/visitors/ast_visitor.h"

std::shared_ptr<LabelNode> LabelNode::create(std::shared_ptr<AstNode> p_Label)
{
    std::shared_ptr<LabelNode> node = std::make_shared<LabelNode>();
    node->label = std::move(p_Label);

    if (node->label != nullptr)
    {
        node->label->setParent(node);
    }
    return node;
}

std::shared_ptr<LabelNode> LabelNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<LabelNode>(p_Node);
}

void LabelNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}
