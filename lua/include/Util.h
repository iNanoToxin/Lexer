#ifndef LUA_UTIL_H
#define LUA_UTIL_H

#include <Node.h>

static const std::vector<std::string> operators{
    "+",
    "-",
    "*",
    "/",
    "//",
    "%",
    "^",
    "-",
    "&",
    "|",
    "~",
    "~",
    "<<",
    ">>",
    "..",
    "#",
    "<",
    "<=",
    ">",
    ">=",
    "==",
    "~=",
    "not",
    "and",
    "or"
};

namespace Util
{
    static OperatorKind getOperator(const std::string& opStr)
    {
        for (int i = 0; i < operators.size(); i++)
        {
            if (operators[i] == opStr)
            {
                return static_cast<OperatorKind>(i);
            }
        }
        throw std::invalid_argument("operator not found");
    }

    static std::string getOperator(OperatorKind opKind)
    {
        return operators[static_cast<int>(opKind)];
    }
};


#endif
