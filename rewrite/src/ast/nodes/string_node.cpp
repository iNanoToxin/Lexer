#include "string_node.h"
#include "ast/visitors/ast_visitor.h"
#include "utilities/string.h"

std::shared_ptr<StringNode> StringNode::create(std::string p_Value)
{
    std::shared_ptr<StringNode> node = std::make_shared<StringNode>();
    node->value = std::move(p_Value);
    return node;
}

std::shared_ptr<StringNode> StringNode::cast(const std::shared_ptr<AstNode>& p_Node)
{
    return std::dynamic_pointer_cast<StringNode>(p_Node);
}

void StringNode::accept(AstVisitor& p_Visitor)
{
    p_Visitor.visit(cast(shared_from_this()));
}

std::string StringNode::unquote() const
{
    return String::unquote(value);
}
