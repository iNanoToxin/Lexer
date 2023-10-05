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


    // explicit Node(token_type type) = default;

    explicit Node(Kind kind, T... args) : Base(kind) {
        mChildren = std::make_tuple(args...);
    }
};



#endif //LUA_NODE_H
