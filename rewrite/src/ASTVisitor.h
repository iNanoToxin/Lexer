#ifndef ASTVISITOR_H
#define ASTVISITOR_H

class BinaryOpNode;
class NumberNode;

class ASTVisitor {
public:
    virtual ~ASTVisitor() = default;
    virtual void visit(BinaryOpNode& node) = 0;
    virtual void visit(NumberNode& node) = 0;
};

#endif // ASTVISITOR_H
