#ifndef LUA_LEXER_ASTNODE_H
#define LUA_LEXER_ASTNODE_H

#include <memory>
#include <vector>

class AstNode
{
public:
    virtual ~AstNode() = default;
    virtual void accept(class AstVisitor* p_Visitor) = 0;
    virtual void destroy() = 0;
};

#endif
