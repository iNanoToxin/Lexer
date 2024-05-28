#ifndef EVALVISITOR_H
#define EVALVISITOR_H

#include "ast_visitor.h"

class EvalVisitor : public ASTVisitor {
public:
    void visit(BinaryOpNode& node) override;
    void visit(NumberNode& node) override;

    int getResult() const { return result; }

private:
    int result;
};

#endif
