#include "scope_tree.h"
#include <ranges>
#include "ast/visitors/format_visitor.h"
#include "utilities/ansi.h"
#include "utilities/assert.h"

std::ostream& operator<<(std::ostream& p_Stream, const VariableInfo& p_Obj)
{
    FormatVisitor formatter;

    p_Stream << "{";
    p_Stream << Ansi(AnsiColor::Gray, "var");
    p_Stream << ": ";
    if (p_Obj.node != nullptr)
    {
        p_Obj.node->accept(formatter);
        p_Stream << Ansi(AnsiColor::Cyan, formatter.getResult());
    }
    else
    {
        p_Stream << Ansi(AnsiColor::Red, "nullptr");
    }

    p_Stream << ", ";
    p_Stream << Ansi(AnsiColor::Gray, "val");
    p_Stream << ": ";
    if (p_Obj.value != nullptr)
    {
        p_Obj.value->accept(formatter);
        p_Stream << Ansi(AnsiColor::Cyan, formatter.getResult());
    }
    else
    {
        p_Stream << Ansi(AnsiColor::Red, "nullptr");
    }

    p_Stream << ", ";
    p_Stream << Ansi(AnsiColor::Gray, "uses");
    p_Stream << ": ";
    p_Stream << Ansi(AnsiColor::Yellow, p_Obj.useCount);

    p_Stream << ", ";
    p_Stream << Ansi(AnsiColor::Gray, "const");
    p_Stream << ": ";
    p_Stream << Ansi(AnsiColor::Yellow, p_Obj.constant ? "true" : "false");
    p_Stream << "}";
    return p_Stream;
}

void ScopeStack::push()
{
    m_List.emplace_back();
}

void ScopeStack::pop()
{
    LL_assert(!m_List.empty(), "ScopeTree is empty.");
    m_Count -= m_List.back().count;
    m_List.pop_back();
}

void ScopeStack::incrementUseCount(const std::shared_ptr<AstNode>& p_Key)
{
    LL_assert(m_Variables.contains(p_Key), "`p_Key` is not found in variable list");
    m_Variables[p_Key].useCount++;
}

void ScopeStack::addUsage(const std::shared_ptr<AstNode>& p_Key, const std::shared_ptr<AstNode>& p_Node)
{
    LL_assert(m_Variables.contains(p_Key), "`p_Key` is not found in variable list");
    m_Variables[p_Key].usages.push_back(p_Node);
}

void ScopeStack::setConstant(const std::shared_ptr<AstNode>& p_Key, const bool p_Constant)
{
    LL_assert(m_Variables.contains(p_Key), "`p_Key` is not found in variable list");
    m_Variables[p_Key].constant = p_Constant;
}

void ScopeStack::setGlobal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value)
{
    LL_assert(p_Value->kind == AstKind::IdentifierNode, "Expected `p_Value` to be kind `AstKind::IdentifierNode`.");
    LL_assert(!m_List.empty(), "ScopeTree is empty.");
    m_TotalCount++;
    m_Count++;
    m_List.front().count++;
    m_List.front().map[p_Key] = p_Value;
    m_Variables[p_Value] = VariableInfo{.useCount = 0};
}

void ScopeStack::setLocal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value)
{
    LL_assert(p_Value->kind == AstKind::IdentifierNode, "Expected `p_Value` to be kind `AstKind::IdentifierNode`.");
    LL_assert(!m_List.empty(), "ScopeTree is empty.");
    m_TotalCount++;
    m_Count++;
    m_List.back().count++;
    m_List.back().map[p_Key] = p_Value;
    m_Variables[p_Value] = VariableInfo{.useCount = 0};
}

std::shared_ptr<AstNode> ScopeStack::get(const std::string& p_Key)
{
    for (Node& node : m_List | std::views::reverse)
    {
        if (node.map.contains(p_Key))
        {
            return node.map[p_Key];
        }
    }
    return nullptr;
}

std::size_t ScopeStack::count() const
{
    return m_Count;
}

std::size_t ScopeStack::totalCount() const
{
    return m_TotalCount;
}

std::unordered_map<std::shared_ptr<AstNode>, VariableInfo> ScopeStack::getVariables() const
{
    return m_Variables;
}
