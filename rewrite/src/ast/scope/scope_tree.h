#pragma once
#include "scope_node.h"

template <class Key, class Value>
class ScopeTree
{
private:
    std::size_t m_TotalCount = 0;
    std::size_t m_Count = 0;
public:
    std::shared_ptr<ScopeNode<Key, Value>> head = nullptr;
    std::shared_ptr<ScopeNode<Key, Value>> tail = nullptr;

    ScopeTree() = default;

    void push()
    {
        if (head == nullptr)
        {
            head = std::make_shared<ScopeNode<Key, Value>>();
            tail = head;
        }
        else
        {
            head->next = std::make_shared<ScopeNode<Key, Value>>(head);
            head = head->next;
        }
    }

    void pop()
    {
        LL_assert(head != nullptr, "ScopeTree `head` is `nullptr`.");
        m_Count -= head->count();
        head = head->prev.lock();
    }

    void setBack(const Key& p_Key, const Value& p_Value)
    {
        LL_assert(tail != nullptr, "ScopeTree `tail` is `tail`.");
        m_TotalCount++;
        m_Count++;
        tail->set(p_Key, p_Value);
    }

    void setFront(const Key& p_Key, const Value& p_Value)
    {
        LL_assert(head != nullptr, "ScopeTree `head` is `nullptr`.");
        m_TotalCount++;
        m_Count++;
        head->set(p_Key, p_Value);
    }

    Value get(const Key& p_Key) const
    {
        std::shared_ptr<ScopeNode<Key, Value>> temp = head;

        while (temp != nullptr && !temp->contains(p_Key))
        {
            temp = temp->prev.lock();
        }
        if (temp != nullptr)
        {
            return temp->get(p_Key);
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
};
