#pragma once
#include <unordered_map>
#include "ast/scope/scope_tree.h"
#include "ast_visitor.h"
#include "ast/nodes/ast_node.h"

class EvalVisitor final : public AstVisitor
{
private:
    std::shared_ptr<AstNode> m_Result;
    std::unordered_map<std::shared_ptr<AstNode>, VariableInfo> m_Variables;

    bool getReference(std::shared_ptr<AstNode>& p_Reference, const std::shared_ptr<AstNode>& p_Node) const;

public:
    void setVariables(const std::unordered_map<std::shared_ptr<AstNode>, VariableInfo>& p_Variables);

protected:
    void visit(const std::shared_ptr<AttributeNode>& p_Node) override;
    void visit(const std::shared_ptr<BooleanNode>& p_Node) override;
    void visit(const std::shared_ptr<IdentifierNode>& p_Node) override;
    void visit(const std::shared_ptr<NilNode>& p_Node) override;
    void visit(const std::shared_ptr<NumberNode>& p_Node) override;
    void visit(const std::shared_ptr<StringNode>& p_Node) override;
    void visit(const std::shared_ptr<VarargsNode>& p_Node) override;
    void visit(const std::shared_ptr<BinaryOpNode>& p_Node) override;
    void visit(const std::shared_ptr<UnaryOpNode>& p_Node) override;
    void visit(const std::shared_ptr<ArgumentListNode>& p_Node) override;
    void visit(const std::shared_ptr<AttributeListNode>& p_Node) override;
    void visit(const std::shared_ptr<ExpressionListNode>& p_Node) override;
    void visit(const std::shared_ptr<FieldListNode>& p_Node) override;
    void visit(const std::shared_ptr<NameListNode>& p_Node) override;
    void visit(const std::shared_ptr<ParameterListNode>& p_Node) override;
    void visit(const std::shared_ptr<VariableListNode>& p_Node) override;
    void visit(const std::shared_ptr<BlockNode>& p_Node) override;
    void visit(const std::shared_ptr<ChunkNode>& p_Node) override;
    void visit(const std::shared_ptr<AssignmentStatNode>& p_Node) override;
    void visit(const std::shared_ptr<BreakStat>& p_Node) override;
    void visit(const std::shared_ptr<ContinueStat>& p_Node) override;
    void visit(const std::shared_ptr<DoStatNode>& p_Node) override;
    void visit(const std::shared_ptr<GenericForStatNode>& p_Node) override;
    void visit(const std::shared_ptr<GotoStatNode>& p_Node) override;
    void visit(const std::shared_ptr<IfStatNode>& p_Node) override;
    void visit(const std::shared_ptr<LocalStatNode>& p_Node) override;
    void visit(const std::shared_ptr<NumericForStatNode>& p_Node) override;
    void visit(const std::shared_ptr<RepeatStatNode>& p_Node) override;
    void visit(const std::shared_ptr<ReturnStatNode>& p_Node) override;
    void visit(const std::shared_ptr<WhileStatNode>& p_Node) override;
    void visit(const std::shared_ptr<IndexNode>& p_Node) override;
    void visit(const std::shared_ptr<MemberNode>& p_Node) override;
    void visit(const std::shared_ptr<MethodNode>& p_Node) override;
    void visit(const std::shared_ptr<TableConstructorNode>& p_Node) override;
    void visit(const std::shared_ptr<TableIndexValueNode>& p_Node) override;
    void visit(const std::shared_ptr<TableNameValueNode>& p_Node) override;
    void visit(const std::shared_ptr<TableValueNode>& p_Node) override;
    void visit(const std::shared_ptr<FuncBodyNode>& p_Node) override;
    void visit(const std::shared_ptr<FuncCallNode>& p_Node) override;
    void visit(const std::shared_ptr<FuncDefNode>& p_Node) override;
    void visit(const std::shared_ptr<FuncNameNode>& p_Node) override;
    void visit(const std::shared_ptr<LabelNode>& p_Node) override;
    void visit(const std::shared_ptr<SemicolonNode>& p_Node) override;
};

bool perform_binary_op(
    std::shared_ptr<AstNode>& p_Result,
    const std::shared_ptr<AstNode>& p_Lhs,
    double (*p_Operation)(double, double),
    const std::shared_ptr<AstNode>& p_Rhs,
    bool p_ForceDouble = false
);

bool perform_comparison(
    std::shared_ptr<AstNode>& p_Result,
    const std::shared_ptr<AstNode>& p_Lhs,
    bool (*p_Operation)(double, double),
    const std::shared_ptr<AstNode>& p_Rhs
);

bool perform_concatenation(
    std::shared_ptr<AstNode>& p_Result,
    const std::shared_ptr<AstNode>& p_Lhs,
    const std::shared_ptr<AstNode>& p_Rhs
);

bool is_allowed_comparison(const std::shared_ptr<AstNode>& p_Node);
bool convert_to_bool(bool* p_Bool, const std::shared_ptr<AstNode>& p_Node);

void merge_blocks(
    const std::shared_ptr<AstNode>& p_BlockA,
    const std::shared_ptr<AstNode>& p_BlockB,
    const std::shared_ptr<AstNode>& p_Node
);

std::vector<std::shared_ptr<AstNode>> get_variable_list(const std::shared_ptr<AstNode>& p_Node);

bool remove_assignment(const std::shared_ptr<AstNode>& p_Node);
