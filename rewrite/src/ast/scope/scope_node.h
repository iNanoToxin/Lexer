#pragma once
#include <map>
#include <memory>

template <class Key, class Value>
class ScopeNode
{
private:
    std::map<Key, Value> m_Map;
    std::size_t m_Count = 0;
public:
    std::shared_ptr<ScopeNode> next;
    std::weak_ptr<ScopeNode> prev;

    explicit ScopeNode() : next(nullptr) {};
    explicit ScopeNode(const std::shared_ptr<ScopeNode>& p_Prev) : next(nullptr), prev(p_Prev) {}

    Value get(const Key& p_Index)
    {
        return m_Map[p_Index];
    }

    void set(const Key& p_Index, const Value& p_Value)
    {
        m_Count++;
        m_Map[p_Index] = p_Value;
    }

    bool contains(const Key& p_Index)
    {
        return m_Map.contains(p_Index);
    }

    std::size_t count() const
    {
        return m_Count;
    }
};
