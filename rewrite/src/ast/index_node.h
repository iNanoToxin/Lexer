#ifndef INDEX_NODE_H
#define INDEX_NODE_H

#include "expression_node.h"

class IndexNode final : public ExpressionNode
{
public:
    ExpressionNode* root;
    ExpressionNode* index;

    IndexNode(ExpressionNode* p_Root, ExpressionNode* p_Index) : root(p_Root), index(p_Index) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //INDEX_NODE_H
