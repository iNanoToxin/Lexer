#include "format_visitor.h"

#include <iostream>
#include <sstream>
#include <string>

#include "../binary_op_node.h"
#include "../number_node.h"
#include "../../utilities/util.h"

#define TAB_WIDTH 4

using Util::string_wrap;
using Util::get_precedence;





void FormatVisitor::visit(AttributeNode* p_Node)
{
    std::stringstream stream;
    p_Node->value->accept(this);
    stream << m_Result;
    stream << "<";
    p_Node->attribute->accept(this);
    stream << m_Result;
    stream << ">";
    m_Result = stream.str();
}
void FormatVisitor::visit(BooleanNode* p_Node)
{
    m_Result = p_Node->value ? "true" : "false";
}
void FormatVisitor::visit(IdentifierNode* p_Node)
{
    m_Result = p_Node->value;
}
void FormatVisitor::visit(NilNode* p_Node)
{
    m_Result = "nil";
}
void FormatVisitor::visit(NumberNode* p_Node)
{
    m_Result = std::to_string(p_Node->value);
}
void FormatVisitor::visit(StringNode* p_Node)
{
    m_Result = p_Node->value;
}
void FormatVisitor::visit(VarargsNode* p_Node)
{
    m_Result = "...";
}

void FormatVisitor::visit(BinaryOpNode* p_Node)
{
    std::stringstream stream;
    p_Node->lhs->accept(this);

    if (p_Node->lhs->is(AstKind::BinaryOpNode))
    {
        const BinaryOpNode* lhs = dynamic_cast<BinaryOpNode*>(p_Node->lhs);

        if (lhs->op == "^" || lhs->op == ".." || get_precedence(lhs->op) < get_precedence(p_Node->op))
        {
            m_Result = string_wrap('(', m_Result, ')');
        }
    }

    stream << m_Result;
    stream << " " << p_Node->op << " ";
    p_Node->rhs->accept(this);

    if (p_Node->rhs->is(AstKind::BinaryOpNode))
    {
        const BinaryOpNode* rhs = dynamic_cast<BinaryOpNode*>(p_Node->rhs);

        if (get_precedence(rhs->op) < get_precedence(p_Node->op))
        {
            m_Result = string_wrap('(', m_Result, ')');
        }
    }

    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(UnaryOpNode* p_Node)
{
    std::stringstream stream;

    stream << p_Node->op;
    p_Node->value->accept(this);

    switch (p_Node->value->kind)
    {
        case AstKind::UnaryOpNode:
        {
            const UnaryOpNode* value = dynamic_cast<UnaryOpNode*>(p_Node->value);
            if (p_Node->op == "-" && p_Node->op == value->op)
            {
                m_Result = string_wrap('(', m_Result, ')');
            }
            break;
        }
        case AstKind::BinaryOpNode:
        {
            const BinaryOpNode* value = dynamic_cast<BinaryOpNode*>(p_Node->value);
            if (get_precedence(value->op) < get_precedence(true))
            {
                m_Result = string_wrap('(', m_Result, ')');
            }
            break;
        }
        default:
        {
            break;
        }
    }

    if (p_Node->op == "not")
    {
        stream << " ";
    }
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(ArgumentListNode* p_Node)
{
    std::stringstream stream;
    stream << "(";

    if (p_Node->list != nullptr)
    {
        p_Node->list->accept(this);
        stream << m_Result;
    }

    stream << ")";
    m_Result = stream.str();
}
void FormatVisitor::visit(AttributeListNode* p_Node)
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
void FormatVisitor::visit(FieldListNode* p_Node)
{
    std::stringstream stream;

    for (ExpressionNode* node : p_Node->list)
    {
        node->accept(this);

        std::stringstream input_steam(m_Result);
        std::string split;
        while (std::getline(input_steam, split, '\n'))
        {
            stream << std::string(TAB_WIDTH, ' ');
            stream << split;

            if (input_steam.eof() && node != p_Node->list.back())
            {
                stream << ",";
            }
            stream << "\n";
        }
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(NameListNode* p_Node)
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
void FormatVisitor::visit(ParameterListNode* p_Node)
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

    for (ExpressionNode* node : p_Node->statements)
    {
        node->accept(this);

        std::stringstream input_steam(m_Result);
        std::string split;
        while (std::getline(input_steam, split, '\n'))
        {
            if (node->is(AstKind::SemicolonNode))
            {
                stream.seekp(-1, std::stringstream::cur);
            }
            else if (!p_Node->parent->is(AstKind::ChunkNode))
            {
                stream << std::string(TAB_WIDTH, ' ');
            }
            stream << split;
            stream << "\n";
        }
    }

    m_Result = stream.str();

    if (p_Node->parent->is(AstKind::ChunkNode) && m_Result.back() == '\n')
    {
        m_Result.pop_back();
    }
}
void FormatVisitor::visit(ChunkNode* p_Node)
{
    m_Result.clear();
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(this);
    }
}

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
void FormatVisitor::visit(BreakStat* p_Node)
{
    m_Result = "break";
}
void FormatVisitor::visit(ContinueStat* p_Node)
{
    m_Result = "continue";
}
void FormatVisitor::visit(DoStatNode* p_Node)
{
    if (p_Node->block != nullptr)
    {
        std::stringstream stream;
        stream << "do\n";
        p_Node->block->accept(this);
        stream << m_Result;
        stream << "end";
        m_Result = stream.str();
    }
    else
    {
        m_Result = "do end";
    }
}
void FormatVisitor::visit(GenericForStatNode* p_Node)
{
    std::stringstream stream;
    stream << "for ";
    p_Node->nameList->accept(this);
    stream << m_Result;
    stream << " in ";
    p_Node->expressionList->accept(this);
    stream << m_Result;

    if (p_Node->block != nullptr)
    {
        stream << " do\n";
        p_Node->block->accept(this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " do end";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(GotoStatNode* p_Node)
{
    std::stringstream stream;
    stream << "goto ";
    p_Node->label->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(IfStatNode* p_Node)
{
    std::stringstream stream;

    for (const ExpressionPair& pair : p_Node->conditionalBlocks)
    {
        if (pair.first == nullptr)
        {
            stream << "else\n";
        }
        else
        {
            if (pair != p_Node->conditionalBlocks.front())
            {
                stream << "else";
            }
            stream << "if ";
            pair.first->accept(this);
            stream << m_Result;
            stream << " then\n";
        }

        if (pair.second != nullptr)
        {
            pair.second->accept(this);
            stream << m_Result;
        }
    }

    stream << "end";
    m_Result = stream.str();
}
void FormatVisitor::visit(LocalStatNode* p_Node)
{
    std::stringstream stream;
    stream << "local ";
    p_Node->statement->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(NumericForStatNode* p_Node)
{
    std::stringstream stream;
    stream << "for ";
    p_Node->name->accept(this);
    stream << m_Result;
    stream << " = ";
    p_Node->init->accept(this);
    stream << m_Result;
    stream << ", ";
    p_Node->goal->accept(this);
    stream << m_Result;

    if (p_Node->step != nullptr)
    {
        stream << ", ";
        p_Node->name->accept(this);
        stream << m_Result;
    }

    if (p_Node->block != nullptr)
    {
        stream << " do\n";
        p_Node->block->accept(this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " do end";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(RepeatStatNode* p_Node)
{
    std::stringstream stream;

    if (p_Node->block != nullptr)
    {
        stream << "repeat\n";
        p_Node->block->accept(this);
        stream << m_Result;
    }
    else
    {
        stream << "repeat ";
    }

    stream << "until ";
    p_Node->condition->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(ReturnStatNode* p_Node)
{
    std::stringstream stream;
    stream << "return";

    if (p_Node->args != nullptr)
    {
        stream << " ";
        p_Node->args->accept(this);
        stream << m_Result;
    }

    m_Result = stream.str();
}
void FormatVisitor::visit(WhileStatNode* p_Node)
{
    std::stringstream stream;
    stream << "while ";
    p_Node->condition->accept(this);
    stream << m_Result;

    if (p_Node->block != nullptr)
    {
        stream << " do\n";
        p_Node->block->accept(this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " do end";
    }
    m_Result = stream.str();
}

void FormatVisitor::visit(IndexNode* p_Node)
{
    std::stringstream stream;
    p_Node->root->accept(this);
    stream << m_Result;
    stream << "[";
    p_Node->index->accept(this);
    stream << m_Result;
    stream << "]";
    m_Result = stream.str();
}
void FormatVisitor::visit(MemberNode* p_Node)
{
    std::stringstream stream;
    p_Node->root->accept(this);
    stream << m_Result;
    stream << ".";
    p_Node->member->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(MethodNode* p_Node)
{
    std::stringstream stream;
    p_Node->root->accept(this);
    stream << m_Result;
    stream << ":";
    p_Node->method->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(TableConstructorNode* p_Node)
{
    if (p_Node->fieldList != nullptr)
    {
        std::stringstream stream;
        stream << "{\n";
        p_Node->fieldList->accept(this);
        stream << m_Result;
        stream << "}";
        m_Result = stream.str();
    }
    else
    {
        m_Result = "{}";
    }
}
void FormatVisitor::visit(TableIndexValueNode* p_Node)
{
    std::stringstream stream;
    stream << "[";
    p_Node->index->accept(this);
    stream << m_Result;
    stream << "]";
    stream << " = ";
    p_Node->value->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(TableNameValueNode* p_Node)
{
    std::stringstream stream;
    p_Node->name->accept(this);
    stream << m_Result;
    stream << " = ";
    p_Node->value->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(TableValueNode* p_Node)
{
    std::stringstream stream;
    p_Node->value->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(FuncBodyNode* p_Node)
{
    std::stringstream stream;
    stream << "(";

    if (p_Node->parameters != nullptr)
    {
        p_Node->parameters->accept(this);
        stream << m_Result;
    }

    stream << ")";

    if (p_Node->block != nullptr)
    {
        stream << "\n";
        p_Node->block->accept(this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " end";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(FuncCallNode* p_Node)
{
    switch (p_Node->root->kind)
    {
        case AstKind::IdentifierNode:
        case AstKind::MemberNode:
        case AstKind::MethodNode:
        case AstKind::IndexNode:
        case AstKind::FuncCallNode:
        {
            std::stringstream stream;
            p_Node->root->accept(this);
            stream << m_Result;
            p_Node->args->accept(this);
            stream << m_Result;
            m_Result = stream.str();
            break;
        }
        default:
        {
            std::stringstream stream;
            stream << "(";
            p_Node->root->accept(this);
            stream << m_Result;
            stream << ")";
            p_Node->args->accept(this);
            stream << m_Result;
            m_Result = stream.str();
            break;
        }
    }
}
void FormatVisitor::visit(FuncDefNode* p_Node)
{
    std::stringstream stream;
    stream << "function";

    if (p_Node->name != nullptr)
    {
        stream << " ";
        p_Node->name->accept(this);
        stream << m_Result;
    }

    p_Node->body->accept(this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(FuncNameNode* p_Node)
{
    p_Node->name->accept(this);
}

void FormatVisitor::visit(LabelNode* p_Node)
{
    std::stringstream stream;
    stream << "::";
    p_Node->label->accept(this);
    stream << m_Result;
    stream << "::";
    m_Result = stream.str();
}
void FormatVisitor::visit(SemicolonNode* p_Node)
{
    m_Result = ";";
}
