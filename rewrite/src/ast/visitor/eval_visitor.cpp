#include "eval_visitor.h"
#include "../binary_op_node.h"
#include "../number_node.h"

#include <stdexcept>

void EvalVisitor::visit(BinaryOpNode* p_Node)
{
    p_Node->lhs->accept(this);
    const NodeValue left_value = m_Result;
    p_Node->rhs->accept(this);
    const NodeValue right_value = m_Result;

    switch (p_Node->op)
    {
        case '+':
            m_Result = std::get<int>(left_value) + std::get<int>(right_value);
            break;
        case '-':
            m_Result = std::get<int>(left_value) - std::get<int>(right_value);
            break;
        case '*':
            m_Result = std::get<int>(left_value) * std::get<int>(right_value);
            break;
        case '/':
            m_Result = std::get<int>(left_value) / std::get<int>(right_value);
            break;
        default:
            throw std::runtime_error("Unknown operator");
    }
}

void EvalVisitor::visit(NumberNode* p_Node)
{
    m_Result = p_Node->value;
}

void EvalVisitor::visit(IdentifierNode* p_Node)
{
    m_Result = p_Node->value;
}

void EvalVisitor::visit(StringNode* p_Node)
{
    m_Result = p_Node->value;
}

void EvalVisitor::visit(BooleanNode* p_Node)
{
    m_Result = p_Node->value;
}

void EvalVisitor::visit(AttributeNode* p_Node) {}
void EvalVisitor::visit(NilNode* p_Node) {}


void EvalVisitor::visit(VarargsNode* p_Node) {}
void EvalVisitor::visit(UnaryOpNode* p_Node) {}
void EvalVisitor::visit(ArgumentListNode* p_Node) {}
void EvalVisitor::visit(AttributeListNode* p_Node) {}
void EvalVisitor::visit(ExpressionListNode* p_Node) {}
void EvalVisitor::visit(FieldListNode* p_Node) {}
void EvalVisitor::visit(NameListNode* p_Node) {}
void EvalVisitor::visit(ParameterListNode* p_Node) {}
void EvalVisitor::visit(VariableListNode* p_Node) {}
void EvalVisitor::visit(BlockNode* p_Node) {}
void EvalVisitor::visit(ChunkNode* p_Node) {}
void EvalVisitor::visit(ConditionalBlockNode* p_Node) {}
void EvalVisitor::visit(AssignmentStatNode* p_Node) {}
void EvalVisitor::visit(BreakStat* p_Node) {}
void EvalVisitor::visit(DoStatNode* p_Node) {}
void EvalVisitor::visit(ForStatNode* p_Node) {}
void EvalVisitor::visit(GotoStatNode* p_Node) {}
void EvalVisitor::visit(IfStatNode* p_Node) {}
void EvalVisitor::visit(LocalStatNode* p_Node) {}
void EvalVisitor::visit(RepeatStatNode* p_Node) {}
void EvalVisitor::visit(ReturnStatNode* p_Node) {}
void EvalVisitor::visit(WhileStatNode* p_Node) {}
void EvalVisitor::visit(IndexNode* p_Node) {}
void EvalVisitor::visit(MemberNode* p_Node) {}
void EvalVisitor::visit(MethodNode* p_Node) {}
void EvalVisitor::visit(TableConstructorNode* p_Node) {}
void EvalVisitor::visit(TableIndexValueNode* p_Node) {}
void EvalVisitor::visit(TableNameValueNode* p_Node) {}
void EvalVisitor::visit(TableValueNode* p_Node) {}
void EvalVisitor::visit(FuncBodyNode* p_Node) {}
void EvalVisitor::visit(FuncCallNode* p_Node) {}
void EvalVisitor::visit(FuncDefNode* p_Node) {}
void EvalVisitor::visit(FuncNameNode* p_Node) {}
void EvalVisitor::visit(LabelNode* p_Node) {}
void EvalVisitor::visit(SemicolonNode* p_Node) {}
