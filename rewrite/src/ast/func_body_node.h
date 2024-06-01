#ifndef FUNC_BODY_NODE_H
#define FUNC_BODY_NODE_H

#include <utility>

#include "ast_node.h"

class FuncBodyNode final : public AstNode
{
public:
    std::shared_ptr<AstNode> parameters;
    std::shared_ptr<AstNode> block;

    explicit FuncBodyNode() : AstNode(AstKind::FuncBodyNode) {}

    static std::shared_ptr<FuncBodyNode> create(std::shared_ptr<AstNode> p_ParameterList, std::shared_ptr<AstNode> p_Block)
    {
        std::shared_ptr<FuncBodyNode> node = std::make_shared<FuncBodyNode>();
        node->parameters = std::move(p_ParameterList);
        node->block = std::move(p_Block);

        if (node->parameters != nullptr)
        {
            node->parameters->parent = node;
        }
        if (node->block != nullptr)
        {
            node->block->parent = node;
        }
        return node;
    }
    static std::shared_ptr<FuncBodyNode> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<FuncBodyNode>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //FUNC_BODY_NODE_H
