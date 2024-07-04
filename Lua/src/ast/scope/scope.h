#pragma once
#include <list>
#include <set>
#include "ast/nodes/ast_node.h"

class VarData
{
public:

};

class ScopeData
{
private:
    std::set<VarData> m_Vars;
    bool m_Static = true;

public:
    void insert(const std::shared_ptr<AstNode>& p_Var)
    {

    }
};

class Scope
{
private:
    std::list<ScopeData> m_Stack;

public:
    void push()
    {
        m_Stack.push_back(ScopeData());
    }
};
