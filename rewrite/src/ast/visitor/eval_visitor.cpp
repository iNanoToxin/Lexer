#include "eval_visitor.h"
#include "../binary_op_node.h"
#include "../number_node.h"

#include <stdexcept>

ExpressionNode* EvalVisitor::visit(BinaryOpNode* p_Node)
{
    // p_Node->lhs->accept(this);
    // const NodeValue left_value = m_Result;
    // p_Node->rhs->accept(this);
    // const NodeValue right_value = m_Result;
    //
    // switch (p_Node->op)
    // {
    //     case '+':
    //         m_Result = std::get<int>(left_value) + std::get<int>(right_value);
    //         break;
    //     case '-':
    //         m_Result = std::get<int>(left_value) - std::get<int>(right_value);
    //         break;
    //     case '*':
    //         m_Result = std::get<int>(left_value) * std::get<int>(right_value);
    //         break;
    //     case '/':
    //         m_Result = std::get<int>(left_value) / std::get<int>(right_value);
    //         break;
    //     default:
    //         throw std::runtime_error("Unknown operator");
    // }
    return p_Node;
}

ExpressionNode* EvalVisitor::visit(NumberNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(IdentifierNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(StringNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(BooleanNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(AttributeNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(NilNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(VarargsNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(UnaryOpNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ArgumentListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(AttributeListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ExpressionListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(FieldListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(NameListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ParameterListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(VariableListNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(BlockNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ChunkNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ConditionalBlockNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(AssignmentStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(BreakStat* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(DoStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ForStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(GotoStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(IfStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(LocalStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(RepeatStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(ReturnStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(WhileStatNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(IndexNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(MemberNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(MethodNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(TableConstructorNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(TableIndexValueNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(TableNameValueNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(TableValueNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(FuncBodyNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(FuncCallNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(FuncDefNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(FuncNameNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(LabelNode* p_Node) { return p_Node; }
ExpressionNode* EvalVisitor::visit(SemicolonNode* p_Node) { return p_Node; }
