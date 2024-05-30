#include "Generation.h"

int get_unary_operation_count(const NodePointer& p_Node, OperatorKind p_OpKind)
{
    NodePointer curr = p_Node;
    int i = 0;

    while (curr && curr->isKind(Kind::UnaryOperation) && curr->getChild<OperatorKind>(0) == p_OpKind)
    {
        curr = curr->getParent();
        i++;
    }
    return i;
}

std::function<void(const Kind&, const NodeChildren&)> set_node_wrapper(const NodePointer& p_Node, const NodePointer& p_Lhs, const NodePointer& p_Rhs)
{
    return [=](const Kind& p_Kind, const NodeChildren& p_Children) -> void
    {
        p_Node->setKind(p_Kind);
        p_Node->setChildren(p_Children);
        Node::reset(p_Lhs);
        Node::reset(p_Rhs);
    };
}
