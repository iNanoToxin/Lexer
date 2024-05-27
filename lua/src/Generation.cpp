#include "Generation.h"

int get_unary_operation_count(const NodePointer& p_Node, OperatorKind p_OpKind)
{
    auto curr = p_Node;
    int i = 0;

    while (curr && curr->isKind(Kind::UnaryOperation) && curr->getChild<OperatorKind>(0) == p_OpKind)
    {
        curr = curr->getParent();
        i++;
    }
    return i;
}
