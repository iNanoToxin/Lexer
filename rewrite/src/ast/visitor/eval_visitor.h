#ifndef EVALVISITOR_H
#define EVALVISITOR_H

#include "ast_visitor.h"
#include "../expression_node.h"

class EvalVisitor final : public AstVisitor
{
private:
    ExpressionNode* m_Result = nullptr;
public:
    void visit(AttributeNode* p_Node) override;
    void visit(BooleanNode* p_Node) override;
    void visit(IdentifierNode* p_Node) override;
    void visit(NilNode* p_Node) override;
    void visit(NumberNode* p_Node) override;
    void visit(StringNode* p_Node) override;
    void visit(VarargsNode* p_Node) override;
    void visit(BinaryOpNode* p_Node) override;
    void visit(UnaryOpNode* p_Node) override;
    void visit(ArgumentListNode* p_Node) override;
    void visit(AttributeListNode* p_Node) override;
    void visit(ExpressionListNode* p_Node) override;
    void visit(FieldListNode* p_Node) override;
    void visit(NameListNode* p_Node) override;
    void visit(ParameterListNode* p_Node) override;
    void visit(VariableListNode* p_Node) override;
    void visit(BlockNode* p_Node) override;
    void visit(ChunkNode* p_Node) override;
    void visit(AssignmentStatNode* p_Node) override;
    void visit(BreakStat* p_Node) override;
    void visit(ContinueStat* p_Node) override;
    void visit(DoStatNode* p_Node) override;
    void visit(GenericForStatNode* p_Node) override;
    void visit(GotoStatNode* p_Node) override;
    void visit(IfStatNode* p_Node) override;
    void visit(LocalStatNode* p_Node) override;
    void visit(NumericForStatNode* p_Node) override;
    void visit(RepeatStatNode* p_Node) override;
    void visit(ReturnStatNode* p_Node) override;
    void visit(WhileStatNode* p_Node) override;
    void visit(IndexNode* p_Node) override;
    void visit(MemberNode* p_Node) override;
    void visit(MethodNode* p_Node) override;
    void visit(TableConstructorNode* p_Node) override;
    void visit(TableIndexValueNode* p_Node) override;
    void visit(TableNameValueNode* p_Node) override;
    void visit(TableValueNode* p_Node) override;
    void visit(FuncBodyNode* p_Node) override;
    void visit(FuncCallNode* p_Node) override;
    void visit(FuncDefNode* p_Node) override;
    void visit(FuncNameNode* p_Node) override;
    void visit(LabelNode* p_Node) override;
    void visit(SemicolonNode* p_Node) override;

    [[nodiscard]] ExpressionNode* getResult() const
    {
        return m_Result;
    }
};

#endif
