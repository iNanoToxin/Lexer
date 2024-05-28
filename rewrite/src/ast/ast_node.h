#ifndef LUA_LEXER_ASTNODE_H
#define LUA_LEXER_ASTNODE_H

#include <memory>
#include <vector>

class ASTNode
{
public:
    virtual ~ASTNode() = default;
    virtual void accept(class ASTVisitor& visitor) = 0;
};

#endif
