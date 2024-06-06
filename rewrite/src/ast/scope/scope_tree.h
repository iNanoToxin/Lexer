#pragma once
#include <list>
#include <map>
#include <ranges>
#include <vector>
#include "ast/nodes/ast_node.h"

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
    std::vector<std::shared_ptr<AstNode>> m_Variables;

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

    void setGlobal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value)
    {
        LL_assert(p_Value->kind == AstKind::IdentifierNode, "Expected `p_Value` to be kind `AstKind::IdentifierNode`.");
        LL_assert(!m_List.empty(), "ScopeTree is empty.");
        m_TotalCount++;
        m_Count++;
        m_List.front().count++;
        m_List.front().map[p_Key] = p_Value;
        m_Variables.push_back(p_Value);
    }

    void setLocal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value)
    {
        LL_assert(p_Value->kind == AstKind::IdentifierNode, "Expected `p_Value` to be kind `AstKind::IdentifierNode`.");
        LL_assert(!m_List.empty(), "ScopeTree is empty.");
        m_TotalCount++;
        m_Count++;
        m_List.back().count++;
        m_List.back().map[p_Key] = p_Value;
        m_Variables.push_back(p_Value);
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

    std::vector<std::shared_ptr<AstNode>> getVaribles() const
    {
        return m_Variables;
    }
};
