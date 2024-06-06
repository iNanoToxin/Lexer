#pragma once
#include <list>
#include <map>
#include <ranges>
#include <vector>
#include "utilities/assert.h"
#include "ast/nodes/ast_node.h"

struct VariableInfo
{
    std::vector<std::shared_ptr<AstNode>> usages;
    std::shared_ptr<AstNode> reference;
    std::shared_ptr<AstNode> node;
    std::shared_ptr<AstNode> value;
    std::shared_ptr<AstNode> currentBlock;
    bool constant;
    int useCount;
};

class ScopeStack
{
private:
    struct Node
    {
        std::map<std::string, std::shared_ptr<AstNode>> map;
        std::size_t count = 0;
    };

    std::list<Node> m_List;
    std::size_t m_TotalCount = 0;
    std::size_t m_Count = 0;
    std::map<std::shared_ptr<AstNode>, VariableInfo> m_Variables;

public:
    ScopeStack() = default;

    void push()
    {
        m_List.emplace_back();
    }

    void pop()
    {
        LL_assert(!m_List.empty(), "ScopeTree is empty.");
        m_Count -= m_List.back().count;
        m_List.pop_back();
    }

    void incrementUseCount(const std::shared_ptr<AstNode>& p_Key)
    {
        LL_assert(m_Variables.contains(p_Key), "`p_Key` is not found in variable list");
        m_Variables[p_Key].useCount++;
    }

    void addUsage(const std::shared_ptr<AstNode>& p_Key, const std::shared_ptr<AstNode>& p_Node)
    {
        LL_assert(m_Variables.contains(p_Key), "`p_Key` is not found in variable list");
        m_Variables[p_Key].usages.push_back(p_Node);
    }

    void setGlobal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value)
    {
        LL_assert(p_Value->kind == AstKind::IdentifierNode, "Expected `p_Value` to be kind `AstKind::IdentifierNode`.");
        LL_assert(!m_List.empty(), "ScopeTree is empty.");
        m_TotalCount++;
        m_Count++;
        m_List.front().count++;
        m_List.front().map[p_Key] = p_Value;
        m_Variables[p_Value] = VariableInfo{.useCount = 0};
    }

    void setLocal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value)
    {
        LL_assert(p_Value->kind == AstKind::IdentifierNode, "Expected `p_Value` to be kind `AstKind::IdentifierNode`.");
        LL_assert(!m_List.empty(), "ScopeTree is empty.");
        m_TotalCount++;
        m_Count++;
        m_List.back().count++;
        m_List.back().map[p_Key] = p_Value;
        m_Variables[p_Value] = VariableInfo{.useCount = 0};
    }

    std::shared_ptr<AstNode> get(const std::string& p_Key)
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

    std::size_t count() const
    {
        return m_Count;
    }

    std::size_t totalCount() const
    {
        return m_TotalCount;
    }

    std::map<std::shared_ptr<AstNode>, VariableInfo> getVariables() const
    {
        return m_Variables;
    }
};
