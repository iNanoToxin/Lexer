#include "format_visitor.h"

#include <iostream>

#include "../binary_op_node.h"
#include "../number_node.h"

#include <sstream>
#include <string>

#define TAB_WIDTH 4

void FormatVisitor::visit(BinaryOpNode* p_Node)
{
    std::stringstream stream;
    p_Node->lhs->accept(this);
    stream << m_Result;
    stream << " " << p_Node->op << " ";
    p_Node->rhs->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(NumberNode* p_Node)
{
    m_Result = std::to_string(p_Node->value);
}

void FormatVisitor::visit(IdentifierNode* p_Node)
{
    m_Result = p_Node->value;
}

void FormatVisitor::visit(StringNode* p_Node) {}
void FormatVisitor::visit(BooleanNode* p_Node) {}
void FormatVisitor::visit(AttributeNode* p_Node) {}
void FormatVisitor::visit(NilNode* p_Node) {}
void FormatVisitor::visit(VarargsNode* p_Node) {}
void FormatVisitor::visit(UnaryOpNode* p_Node) {}
void FormatVisitor::visit(ArgumentListNode* p_Node) {}
void FormatVisitor::visit(AttributeListNode* p_Node) {}

void FormatVisitor::visit(ExpressionListNode* p_Node)
{
    std::stringstream stream;

    for (ExpressionNode* node : p_Node->list)
    {
        node->accept(this);
        stream << m_Result;

        if (node != p_Node->list.back())
        {
            stream << ", ";
        }
    }
    m_Result = stream.str();
}

void FormatVisitor::visit(FieldListNode* p_Node) {}
void FormatVisitor::visit(NameListNode* p_Node) {}
void FormatVisitor::visit(ParameterListNode* p_Node) {}

void FormatVisitor::visit(VariableListNode* p_Node)
{
    std::stringstream stream;

    for (ExpressionNode* node : p_Node->list)
    {
        node->accept(this);
        stream << m_Result;

        if (node != p_Node->list.back())
        {
            stream << ", ";
        }
    }
    m_Result = stream.str();
}

void FormatVisitor::visit(BlockNode* p_Node)
{
    std::stringstream stream;
    m_Depth++;

    for (ExpressionNode* node : p_Node->statements)
    {
        node->accept(this);

        std::stringstream input_steam(m_Result);
        std::string split;
        while (std::getline(input_steam, split, '\n'))
        {
            stream << std::string(4, ' ');
            stream << split;
            stream << '\n';
        }
    }

    m_Depth--;
    m_Result = stream.str();
}

void FormatVisitor::visit(ChunkNode* p_Node)
{
    p_Node->block->accept(this);
}

void FormatVisitor::visit(ConditionalBlockNode* p_Node) {}

void FormatVisitor::visit(AssignmentStatNode* p_Node)
{
    std::stringstream stream;
    p_Node->variableList->accept(this);
    stream << m_Result;
    stream << " = ";
    p_Node->expressionList->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(BreakStat* p_Node) {}
void FormatVisitor::visit(DoStatNode* p_Node) {}
void FormatVisitor::visit(ForStatNode* p_Node) {}
void FormatVisitor::visit(GotoStatNode* p_Node) {}
void FormatVisitor::visit(IfStatNode* p_Node) {}
void FormatVisitor::visit(LocalStatNode* p_Node) {}
void FormatVisitor::visit(RepeatStatNode* p_Node) {}
void FormatVisitor::visit(ReturnStatNode* p_Node) {}

void FormatVisitor::visit(WhileStatNode* p_Node)
{
    std::stringstream stream;
    stream << "while ";
    p_Node->condition->accept(this);
    stream << m_Result;
    stream << " do\n";
    p_Node->block->accept(this);
    stream << m_Result;
    stream << "end";
    m_Result = stream.str();
}

void FormatVisitor::visit(IndexNode* p_Node) {}
void FormatVisitor::visit(MemberNode* p_Node) {}
void FormatVisitor::visit(MethodNode* p_Node) {}
void FormatVisitor::visit(TableConstructorNode* p_Node) {}
void FormatVisitor::visit(TableIndexValueNode* p_Node) {}
void FormatVisitor::visit(TableNameValueNode* p_Node) {}
void FormatVisitor::visit(TableValueNode* p_Node) {}
void FormatVisitor::visit(FuncBodyNode* p_Node) {}
void FormatVisitor::visit(FuncCallNode* p_Node) {}
void FormatVisitor::visit(FuncDefNode* p_Node) {}
void FormatVisitor::visit(FuncNameNode* p_Node) {}
void FormatVisitor::visit(LabelNode* p_Node) {}
void FormatVisitor::visit(SemicolonNode* p_Node) {}
