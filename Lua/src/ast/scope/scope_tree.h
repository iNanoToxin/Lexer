#pragma once
#include <list>
#include <unordered_map>
#include <vector>
#include "ast/nodes/ast_node.h"

struct VariableInfo
{
    std::vector<std::shared_ptr<AstNode>> usages;
    std::shared_ptr<AstNode> reference;
    std::shared_ptr<AstNode> node;
    std::shared_ptr<AstNode> value;
    std::shared_ptr<AstNode> currentBlock;
    bool constant = false;
    int useCount = 0;

    friend std::ostream& operator<<(std::ostream& p_Stream, const VariableInfo& p_Obj);
};

class ScopeStack
{
private:
    struct Node
    {
        std::unordered_map<std::string, std::shared_ptr<AstNode>> map;
        std::size_t count = 0;
    };

    std::list<Node> m_List;
    std::size_t m_TotalCount = 0;
    std::size_t m_Count = 0;
    std::unordered_map<std::shared_ptr<AstNode>, VariableInfo> m_Variables;

public:
    ScopeStack() = default;

    void push();
    void pop();
    void incrementUseCount(const std::shared_ptr<AstNode>& p_Key);
    void addUsage(const std::shared_ptr<AstNode>& p_Key, const std::shared_ptr<AstNode>& p_Node);
    void setConstant(const std::shared_ptr<AstNode>& p_Key, bool p_Constant);
    void setGlobal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value);
    void setLocal(const std::string& p_Key, const std::shared_ptr<AstNode>& p_Value);
    std::shared_ptr<AstNode> get(const std::string& p_Key);
    std::size_t count() const;
    std::size_t totalCount() const;
    std::unordered_map<std::shared_ptr<AstNode>, VariableInfo> getVariables() const;
};
