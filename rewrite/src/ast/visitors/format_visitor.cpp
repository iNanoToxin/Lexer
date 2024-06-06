#include "format_visitor.h"

#include <cmath>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include "../../utilities/util.h"
#include "../../utilities/assert.h"

#define TAB_WIDTH 4
// #define FPRINT_ALL

void FormatVisitor::visit(const std::shared_ptr<AttributeNode>& p_Node)
{
    std::stringstream stream;
    p_Node->value->accept(*this);
    stream << m_Result;
    stream << "<";
    p_Node->attribute->accept(*this);
    stream << m_Result;
    stream << ">";
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<BooleanNode>& p_Node)
{
    m_Result = p_Node->value ? "true" : "false";
}
void FormatVisitor::visit(const std::shared_ptr<IdentifierNode>& p_Node)
{
    m_Result = p_Node->getName();
}
void FormatVisitor::visit(const std::shared_ptr<NilNode>& p_Node)
{
    m_Result = "nil";
}
void FormatVisitor::visit(const std::shared_ptr<NumberNode>& p_Node)
{
    if (p_Node->isInt())
    {
        m_Result = std::to_string(p_Node->getInt());
    }
    else
    {
        // std::ostringstream stream;
        // stream << std::setprecision(15);
        // stream << std::noshowpoint;
        // stream << p_Node->getDouble();

        // if (std::floor(p_Node->getDouble()) == p_Node->getDouble())
        // {
        //     stream << ".0";
        // }
        // m_Result = stream.str();
        m_Result = std::to_string(p_Node->getDouble());
    }
}
void FormatVisitor::visit(const std::shared_ptr<StringNode>& p_Node)
{
    m_Result = p_Node->getString();
}
void FormatVisitor::visit(const std::shared_ptr<VarargsNode>& p_Node)
{
    m_Result = "...";
}

void FormatVisitor::visit(const std::shared_ptr<BinaryOpNode>& p_Node)
{
    std::stringstream stream;
    p_Node->lhs->accept(*this);

    if (p_Node->lhs->kind == AstKind::BinaryOpNode)
    {
        const std::shared_ptr<BinaryOpNode>& lhs = BinaryOpNode::cast(p_Node->lhs);

        if (lhs->op == "^" || lhs->op == ".." || Util::get_precedence(lhs->op) < Util::get_precedence(p_Node->op))
        {
            m_Result = Util::string_wrap('(', m_Result, ')');
        }
    }

    stream << m_Result;
    stream << " " << p_Node->op << " ";
    p_Node->rhs->accept(*this);

    if (p_Node->rhs->kind == AstKind::BinaryOpNode)
    {
        const std::shared_ptr<BinaryOpNode>& rhs = BinaryOpNode::cast(p_Node->rhs);

        if (Util::get_precedence(p_Node->op) >= Util::get_precedence(rhs->op))
        {
            m_Result = Util::string_wrap('(', m_Result, ')');
        }
    }

    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    std::stringstream stream;

    stream << p_Node->op;
    p_Node->value->accept(*this);

    switch (p_Node->value->kind)
    {
        case AstKind::UnaryOpNode:
        {
            const std::string& unary_op = UnaryOpNode::cast(p_Node->value)->op;

            if (p_Node->op == "-" && p_Node->op == unary_op)
            {
                m_Result = Util::string_wrap('(', m_Result, ')');
            }
            break;
        }
        case AstKind::BinaryOpNode:
        {
            const std::string& binary_op = BinaryOpNode::cast(p_Node->value)->op;

            if (Util::get_precedence(binary_op) < Util::get_precedence(true))
            {
                m_Result = Util::string_wrap('(', m_Result, ')');
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

void FormatVisitor::visit(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    std::stringstream stream;
    stream << "(";

    if (p_Node->list != nullptr)
    {
        p_Node->list->accept(*this);
        stream << m_Result;
    }

    stream << ")";
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<AttributeListNode>& p_Node)
{
    std::stringstream stream;
    std::string separator;

    for (const std::shared_ptr<AstNode>& child : p_Node->list)
    {
        LL_assert(child != nullptr, "Found `nullptr` in `AstNode` array.");
        stream << separator;
        child->accept(*this);
        stream << m_Result;
        separator = ", ";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<ExpressionListNode>& p_Node)
{
    std::stringstream stream;
    std::string separator;

    for (const std::shared_ptr<AstNode>& child : p_Node->list)
    {
        LL_assert(child != nullptr, "Found `nullptr` in `AstNode` array.");
        stream << separator;
        child->accept(*this);
        stream << m_Result;
        separator = ", ";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<FieldListNode>& p_Node)
{
    std::stringstream stream;

    for (const std::shared_ptr<AstNode>& node : p_Node->list)
    {
        node->accept(*this);

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
void FormatVisitor::visit(const std::shared_ptr<NameListNode>& p_Node)
{
    std::stringstream stream;
    std::string separator;

    for (const std::shared_ptr<AstNode>& child : p_Node->list)
    {
        LL_assert(child != nullptr, "Found `nullptr` in `AstNode` array.");
        stream << separator;
        child->accept(*this);
        stream << m_Result;
        separator = ", ";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<ParameterListNode>& p_Node)
{
    std::stringstream stream;
    std::string separator;

    for (const std::shared_ptr<AstNode>& child : p_Node->list)
    {
        LL_assert(child != nullptr, "Found `nullptr` in `AstNode` array.");
        stream << separator;
        child->accept(*this);
        stream << m_Result;
        separator = ", ";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<VariableListNode>& p_Node)
{
    std::stringstream stream;
    std::string separator;

    for (const std::shared_ptr<AstNode>& child : p_Node->list)
    {
        LL_assert(child != nullptr, "Found `nullptr` in `AstNode` array.");
        stream << separator;
        child->accept(*this);
        stream << m_Result;
        separator = ", ";
    }
    m_Result = stream.str();
}

void FormatVisitor::visit(const std::shared_ptr<BlockNode>& p_Node)
{
    std::stringstream stream;

    for (const std::shared_ptr<AstNode>& node : p_Node->statements)
    {
        node->accept(*this);

        std::stringstream input_steam(m_Result);
        std::string split;
        while (std::getline(input_steam, split, '\n'))
        {
            if (node->kind == AstKind::SemicolonNode)
            {
                stream.seekp(-1, std::stringstream::cur);
            }
            else if (p_Node->getParent()->kind != AstKind::ChunkNode)
            {
                stream << std::string(TAB_WIDTH, ' ');
            }
            stream << split;
            stream << "\n";
        }
    }

    m_Result = stream.str();

    if (p_Node->getParent()->kind == AstKind::ChunkNode && m_Result.back() == '\n')
    {
        m_Result.pop_back();
    }
}
void FormatVisitor::visit(const std::shared_ptr<ChunkNode>& p_Node)
{
    m_Result.clear();
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
}

void FormatVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    std::stringstream stream;
    p_Node->variables->accept(*this);
    stream << m_Result;
    stream << " = ";
    p_Node->values->accept(*this);
    stream << m_Result;

    #ifdef FPRINT_ALL
    std::vector<std::shared_ptr<AstNode>> list;

    if (p_Node->variables->kind == AstKind::VariableListNode)
    {
        list = VariableListNode::cast(p_Node->variables)->list;
    }
    else
    {
        list = AttributeListNode::cast(p_Node->variables)->list;
    }


    std::string seperator;
    if (!list.empty())
    {
        stream << "\ninsert_log(";

        stream << "\"ASSIGN: ";
        for (const std::shared_ptr<AstNode>& child : list)
        {
            stream << seperator;
            if (false)
            {
                const std::shared_ptr<IndexNode> node = IndexNode::cast(child);
                node->root->accept(*this);
                stream << m_Result;
                stream << "[\" .. ";
                node->index->accept(*this);
                stream << m_Result;
                stream << " .. \"]";
            }
            else
            {
                child->accept(*this);
                stream << m_Result;
            }
            seperator = ", ";
        }
        stream << " = \", ";

        seperator.clear();
        for (const std::shared_ptr<AstNode>& child : list)
        {
            stream << seperator;
            child->accept(*this);
            stream << m_Result;
            seperator = ", ";
        }

        /*for (const std::shared_ptr<AstNode>& child : list)
        {
            stream << seperator;
            stream << "\"";

            if (child->kind == AstKind::IndexNode)
            {
                const std::shared_ptr<IndexNode> node = IndexNode::cast(child);
                node->root->accept(*this);
                stream << m_Result;
                stream << "[\" .. ";
                node->index->accept(*this);
                stream << m_Result;
                stream << " .. \"]";
            }
            else
            {
                child->accept(*this);
                stream << m_Result;
            }

            stream << " = \"..tostring(";
            stream << m_Result;
            stream << ")";
            seperator = ", ";
        }*/
        stream << ")";
    }
    #endif

    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<BreakStat>& p_Node)
{
    m_Result = "break";
}
void FormatVisitor::visit(const std::shared_ptr<ContinueStat>& p_Node)
{
    m_Result = "continue";
}
void FormatVisitor::visit(const std::shared_ptr<DoStatNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        std::stringstream stream;
        stream << "do\n";
        p_Node->block->accept(*this);
        stream << m_Result;
        stream << "end";
        m_Result = stream.str();
    }
    else
    {
        m_Result = "do end";
    }
}
void FormatVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    std::stringstream stream;
    stream << "for ";
    p_Node->nameList->accept(*this);
    stream << m_Result;
    stream << " in ";
    p_Node->expressionList->accept(*this);
    stream << m_Result;

    if (p_Node->block != nullptr)
    {
        stream << " do\n";
        p_Node->block->accept(*this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " do end";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<GotoStatNode>& p_Node)
{
    std::stringstream stream;
    stream << "goto ";
    p_Node->label->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<IfStatNode>& p_Node)
{
    std::stringstream stream;

    for (const AstNodePair& pair : p_Node->blocks)
    {
        if (pair.first == nullptr)
        {
            stream << "else\n";
        }
        else
        {
            if (pair != p_Node->blocks.front())
            {
                stream << "else";
            }
            stream << "if ";
            pair.first->accept(*this);
            stream << m_Result;
            stream << " then\n";

            #ifdef FPRINT_ALL
            stream << std::string(TAB_WIDTH, ' ');
            stream << "insert_log(\"EQ: ";
            stream << m_Result;
            stream << "\")\n";
            #endif
        }

        if (pair.second != nullptr)
        {
            pair.second->accept(*this);
            stream << m_Result;
        }
    }

    stream << "end";
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<LocalStatNode>& p_Node)
{
    std::stringstream stream;
    stream << "local ";
    p_Node->statement->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    std::stringstream stream;
    stream << "for ";
    p_Node->name->accept(*this);
    stream << m_Result;
    stream << " = ";
    p_Node->init->accept(*this);
    stream << m_Result;
    stream << ", ";
    p_Node->goal->accept(*this);
    stream << m_Result;

    if (p_Node->step != nullptr)
    {
        stream << ", ";
        p_Node->step->accept(*this);
        stream << m_Result;
    }

    if (p_Node->block != nullptr)
    {
        stream << " do\n";
        p_Node->block->accept(*this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " do end";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<RepeatStatNode>& p_Node)
{
    std::stringstream stream;

    if (p_Node->block != nullptr)
    {
        stream << "repeat\n";
        p_Node->block->accept(*this);
        stream << m_Result;
    }
    else
    {
        stream << "repeat ";
    }

    stream << "until ";
    p_Node->condition->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    std::stringstream stream;
    stream << "return";

    if (p_Node->args != nullptr)
    {
        stream << " ";
        p_Node->args->accept(*this);
        stream << m_Result;
    }

    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<WhileStatNode>& p_Node)
{
    std::stringstream stream;
    stream << "while ";
    p_Node->condition->accept(*this);
    stream << m_Result;

    if (p_Node->block != nullptr)
    {
        stream << " do\n";
        p_Node->block->accept(*this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " do end";
    }
    m_Result = stream.str();
}

void FormatVisitor::visit(const std::shared_ptr<IndexNode>& p_Node)
{
    std::stringstream stream;
    p_Node->root->accept(*this);
    stream << m_Result;
    stream << "[";
    p_Node->index->accept(*this);
    stream << m_Result;
    stream << "]";
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<MemberNode>& p_Node)
{
    std::stringstream stream;
    p_Node->root->accept(*this);
    stream << m_Result;
    stream << ".";
    p_Node->member->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<MethodNode>& p_Node)
{
    std::stringstream stream;
    p_Node->root->accept(*this);
    stream << m_Result;
    stream << ":";
    p_Node->method->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    if (p_Node->fieldList != nullptr)
    {
        std::stringstream stream;
        stream << "{\n";
        p_Node->fieldList->accept(*this);
        stream << m_Result;
        stream << "}";
        m_Result = stream.str();
    }
    else
    {
        m_Result = "{}";
    }
}
void FormatVisitor::visit(const std::shared_ptr<TableIndexValueNode>& p_Node)
{
    std::stringstream stream;
    stream << "[";
    p_Node->index->accept(*this);
    stream << m_Result;
    stream << "]";
    stream << " = ";
    p_Node->value->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<TableNameValueNode>& p_Node)
{
    std::stringstream stream;
    p_Node->name->accept(*this);
    stream << m_Result;
    stream << " = ";
    p_Node->value->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<TableValueNode>& p_Node)
{
    std::stringstream stream;
    p_Node->value->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}

void FormatVisitor::visit(const std::shared_ptr<FuncBodyNode>& p_Node)
{
    std::stringstream stream;
    stream << "(";

    if (p_Node->parameters != nullptr)
    {
        p_Node->parameters->accept(*this);
        stream << m_Result;
    }

    stream << ")";

    if (p_Node->block != nullptr)
    {
        stream << "\n";
        p_Node->block->accept(*this);
        stream << m_Result;
        stream << "end";
    }
    else
    {
        stream << " end";
    }
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<FuncCallNode>& p_Node)
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
            p_Node->root->accept(*this);
            stream << m_Result;
            p_Node->args->accept(*this);
            stream << m_Result;
            m_Result = stream.str();
            break;
        }
        default:
        {
            std::stringstream stream;
            stream << "(";
            p_Node->root->accept(*this);
            stream << m_Result;
            stream << ")";
            p_Node->args->accept(*this);
            stream << m_Result;
            m_Result = stream.str();
            break;
        }
    }

    #ifdef FPRINT_ALL
    if (p_Node->getParent()->kind != AstKind::BlockNode)
    {
        return;
    }

    std::stringstream stream;
    stream << m_Result;
    stream << "\ninsert_log(\"CALL: ";
    stream << m_Result << std::endl;
    stream.seekp(-1, std::stringstream::cur);
    stream << "\")";
    m_Result = stream.str();
    #endif
}
void FormatVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    std::stringstream stream;
    stream << "function";

    if (p_Node->name != nullptr)
    {
        stream << " ";
        p_Node->name->accept(*this);
        stream << m_Result;
    }

    p_Node->body->accept(*this);
    stream << m_Result;
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<FuncNameNode>& p_Node)
{
    p_Node->name->accept(*this);
}

void FormatVisitor::visit(const std::shared_ptr<LabelNode>& p_Node)
{
    std::stringstream stream;
    stream << "::";
    p_Node->label->accept(*this);
    stream << m_Result;
    stream << "::";
    m_Result = stream.str();
}
void FormatVisitor::visit(const std::shared_ptr<SemicolonNode>& p_Node)
{
    m_Result = ";";
}

std::string FormatVisitor::getResult() const
{
    return m_Result;
}
