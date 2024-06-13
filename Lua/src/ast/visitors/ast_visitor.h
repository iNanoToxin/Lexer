#pragma once
#include "ast/node_headers.h"

/*
Members that can be nullptr.

ArgumentListNode:     {list}
ChunkNode:            {block}
DoStatNode:           {block}
GenericForStatNode:   {block}
IfStatNode:           {condition, block}
NumericForStatNode:   {step, block}
RepeatStatNode:       {block}
ReturnStatNode:       {args}
WhileStatNode:        {block}
TableConstructorNode: {fields}
FuncBodyNode:         {parameters, block}
FuncDefNode:          {name}
*/

class AstVisitor
{
public:
    virtual ~AstVisitor() = default;

    void visitNode(const std::shared_ptr<AttributeNode>& p_Node);
    void visitNode(const std::shared_ptr<BooleanNode>& p_Node);
    void visitNode(const std::shared_ptr<IdentifierNode>& p_Node);
    void visitNode(const std::shared_ptr<NilNode>& p_Node);
    void visitNode(const std::shared_ptr<NumberNode>& p_Node);
    void visitNode(const std::shared_ptr<StringNode>& p_Node);
    void visitNode(const std::shared_ptr<VarargsNode>& p_Node);
    void visitNode(const std::shared_ptr<BinaryOpNode>& p_Node);
    void visitNode(const std::shared_ptr<UnaryOpNode>& p_Node);
    void visitNode(const std::shared_ptr<ArgumentListNode>& p_Node);
    void visitNode(const std::shared_ptr<AttributeListNode>& p_Node);
    void visitNode(const std::shared_ptr<ExpressionListNode>& p_Node);
    void visitNode(const std::shared_ptr<FieldListNode>& p_Node);
    void visitNode(const std::shared_ptr<NameListNode>& p_Node);
    void visitNode(const std::shared_ptr<ParameterListNode>& p_Node);
    void visitNode(const std::shared_ptr<VariableListNode>& p_Node);
    void visitNode(const std::shared_ptr<BlockNode>& p_Node);
    void visitNode(const std::shared_ptr<ChunkNode>& p_Node);
    void visitNode(const std::shared_ptr<AssignmentStatNode>& p_Node);
    void visitNode(const std::shared_ptr<BreakStat>& p_Node);
    void visitNode(const std::shared_ptr<ContinueStat>& p_Node);
    void visitNode(const std::shared_ptr<DoStatNode>& p_Node);
    void visitNode(const std::shared_ptr<GenericForStatNode>& p_Node);
    void visitNode(const std::shared_ptr<GotoStatNode>& p_Node);
    void visitNode(const std::shared_ptr<IfStatNode>& p_Node);
    void visitNode(const std::shared_ptr<LocalStatNode>& p_Node);
    void visitNode(const std::shared_ptr<NumericForStatNode>& p_Node);
    void visitNode(const std::shared_ptr<RepeatStatNode>& p_Node);
    void visitNode(const std::shared_ptr<ReturnStatNode>& p_Node);
    void visitNode(const std::shared_ptr<WhileStatNode>& p_Node);
    void visitNode(const std::shared_ptr<IndexNode>& p_Node);
    void visitNode(const std::shared_ptr<MemberNode>& p_Node);
    void visitNode(const std::shared_ptr<MethodNode>& p_Node);
    void visitNode(const std::shared_ptr<TableConstructorNode>& p_Node);
    void visitNode(const std::shared_ptr<TableIndexValueNode>& p_Node);
    void visitNode(const std::shared_ptr<TableNameValueNode>& p_Node);
    void visitNode(const std::shared_ptr<TableValueNode>& p_Node);
    void visitNode(const std::shared_ptr<FuncBodyNode>& p_Node);
    void visitNode(const std::shared_ptr<FuncCallNode>& p_Node);
    void visitNode(const std::shared_ptr<FuncDefNode>& p_Node);
    void visitNode(const std::shared_ptr<FuncNameNode>& p_Node);
    void visitNode(const std::shared_ptr<LabelNode>& p_Node);
    void visitNode(const std::shared_ptr<SemicolonNode>& p_Node);

protected:
    virtual void visit(const std::shared_ptr<AttributeNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BooleanNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<IdentifierNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NilNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NumberNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<StringNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<VarargsNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BinaryOpNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<UnaryOpNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ArgumentListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<AttributeListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ExpressionListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FieldListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NameListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ParameterListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<VariableListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BlockNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ChunkNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<AssignmentStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BreakStat>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ContinueStat>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<DoStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<GenericForStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<GotoStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<IfStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<LocalStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NumericForStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<RepeatStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ReturnStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<WhileStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<IndexNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<MemberNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<MethodNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableConstructorNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableIndexValueNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableNameValueNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableValueNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncBodyNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncCallNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncDefNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncNameNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<LabelNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<SemicolonNode>& p_Node) = 0;
};
