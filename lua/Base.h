#ifndef LUA_BASE_H
#define LUA_BASE_H

#include <memory>
#include <vector>
#include <string>
#include "Kind.h"

class Base;
using p_Base = std::shared_ptr<Base>;
using p_BaseArray = std::vector<p_Base>;


class Base
{
public:
    p_Base m_Parent = nullptr;
    Kind m_Kind = Kind::Unknown;

    explicit Base() = default;

    // template <typename ...T>
    // auto get(Kind kind) -> Node<T...>*;

    virtual std::string toString(std::size_t depth = 0) const {
        return "";
    }
};

#endif
