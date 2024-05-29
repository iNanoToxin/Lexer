#ifndef EVALVISITOR_H
#define EVALVISITOR_H

#include <string>
#include <variant>

#include "ast_visitor.h"
#include "../expression_node.h"

using NodeValue = std::variant<int, bool, std::string>;

class EvalVisitor final : public AstVisitor
{
private:
    NodeValue m_Result{};
public:
    ExpressionNode* visit(AttributeNode* p_Node) override;
    ExpressionNode* visit(BooleanNode* p_Node) override;
    ExpressionNode* visit(IdentifierNode* p_Node) override;
    ExpressionNode* visit(NilNode* p_Node) override;
    ExpressionNode* visit(NumberNode* p_Node) override;
    ExpressionNode* visit(StringNode* p_Node) override;
    ExpressionNode* visit(VarargsNode* p_Node) override;
    ExpressionNode* visit(BinaryOpNode* p_Node) override;
    ExpressionNode* visit(UnaryOpNode* p_Node) override;
    ExpressionNode* visit(ArgumentListNode* p_Node) override;
    ExpressionNode* visit(AttributeListNode* p_Node) override;
    ExpressionNode* visit(ExpressionListNode* p_Node) override;
    ExpressionNode* visit(FieldListNode* p_Node) override;
    ExpressionNode* visit(NameListNode* p_Node) override;
    ExpressionNode* visit(ParameterListNode* p_Node) override;
    ExpressionNode* visit(VariableListNode* p_Node) override;
    ExpressionNode* visit(BlockNode* p_Node) override;
    ExpressionNode* visit(ChunkNode* p_Node) override;
    ExpressionNode* visit(ConditionalBlockNode* p_Node) override;
    ExpressionNode* visit(AssignmentStatNode* p_Node) override;
    ExpressionNode* visit(BreakStat* p_Node) override;
    ExpressionNode* visit(DoStatNode* p_Node) override;
    ExpressionNode* visit(ForStatNode* p_Node) override;
    ExpressionNode* visit(GotoStatNode* p_Node) override;
    ExpressionNode* visit(IfStatNode* p_Node) override;
    ExpressionNode* visit(LocalStatNode* p_Node) override;
    ExpressionNode* visit(RepeatStatNode* p_Node) override;
    ExpressionNode* visit(ReturnStatNode* p_Node) override;
    ExpressionNode* visit(WhileStatNode* p_Node) override;
    ExpressionNode* visit(IndexNode* p_Node) override;
    ExpressionNode* visit(MemberNode* p_Node) override;
    ExpressionNode* visit(MethodNode* p_Node) override;
    ExpressionNode* visit(TableConstructorNode* p_Node) override;
    ExpressionNode* visit(TableIndexValueNode* p_Node) override;
    ExpressionNode* visit(TableNameValueNode* p_Node) override;
    ExpressionNode* visit(TableValueNode* p_Node) override;
    ExpressionNode* visit(FuncBodyNode* p_Node) override;
    ExpressionNode* visit(FuncCallNode* p_Node) override;
    ExpressionNode* visit(FuncDefNode* p_Node) override;
    ExpressionNode* visit(FuncNameNode* p_Node) override;
    ExpressionNode* visit(LabelNode* p_Node) override;
    ExpressionNode* visit(SemicolonNode* p_Node) override;

    [[nodiscard]] NodeValue getResult() const
    {
        return m_Result;
    }
};

#endif
