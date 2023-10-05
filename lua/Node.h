//
// Created by Dylan Daniel on 10/5/23.
//

#ifndef LUA_NODE_H
#define LUA_NODE_H

#include "Parser.h"

template <typename ...T>
class Node : public Base
{
public:
    std::tuple<T...> mChildren;

    explicit Node() = default;
};



#endif //LUA_NODE_H
