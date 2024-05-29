#ifndef MEMBER_NODE_H
#define MEMBER_NODE_H

#include "expression_node.h"

class MemberNode final : public ExpressionNode
{
public:
    ExpressionNode* root;
    ExpressionNode* member;

    MemberNode(ExpressionNode* p_Root, ExpressionNode* p_Member) : root(p_Root), member(p_Member) {}

    void accept(AstVisitor* p_Visitor) override;
    void destroy() override;
};

#endif //MEMBER_NODE_H