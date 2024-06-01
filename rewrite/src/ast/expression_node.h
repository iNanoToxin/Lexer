#ifndef EXPRESSIONNODE_H
#define EXPRESSIONNODE_H

#include <iostream>
#include <memory>
#include "ast_node.h"

class ExpressionNode : public AstNode
{
public:
    explicit ExpressionNode(const AstKind& p_Kind) : AstNode(p_Kind) {}
    // ~ExpressionNode() override
    // {
    //     std::cout << "Object `" << get_kind_name() << "` destroyed." << std::endl;
    // }
};

using ExpressionPair = std::pair<std::shared_ptr<ExpressionNode>, std::shared_ptr<ExpressionNode>>;

#endif
