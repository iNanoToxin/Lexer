#ifndef CONTINUE_STAT_H
#define CONTINUE_STAT_H

#include "ast_node.h"

class ContinueStat final : public AstNode
{
public:
    explicit ContinueStat() : AstNode(AstKind::ContinueStat) {}

    static std::shared_ptr<ContinueStat> create()
    {
        return std::make_shared<ContinueStat>();
    }
    static std::shared_ptr<ContinueStat> cast(const std::shared_ptr<AstNode>& p_Node)
    {
        return std::dynamic_pointer_cast<ContinueStat>(p_Node);
    }
    void accept(AstVisitor& p_Visitor) override;
};

#endif //CONTINUE_STAT_H
