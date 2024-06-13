#include "ast_visitor.h"
#include "utilities/assert.h"

#define assert_node_pointer(p_Class, p_Pointer) LL_assert(p_Pointer != nullptr, #p_Class ": `" #p_Pointer "` is `nullptr`.")

#define assert_node_list(p_Class, p_Pointer)                                                                                       \
do                                                                                                                                 \
{                                                                                                                                  \
    LL_assert(!p_Pointer.empty(), #p_Class ": `" #p_Pointer "` is empty.");                                                           \
    std::size_t i = 0;                                                                                                             \
    for (const auto& object : p_Pointer)                                                                                           \
    {                                                                                                                              \
        LL_assert(object != nullptr, std::string(#p_Class) + ": `" + #p_Pointer + "[" + std::to_string(i++) + "]` is `nullptr`."); \
    }                                                                                                                              \
}                                                                                                                                  \
while (false)


void AstVisitor::visitNode(const std::shared_ptr<AttributeNode>& p_Node)
{
    assert_node_pointer(AttributeNode, p_Node->value);
    assert_node_pointer(AttributeNode, p_Node->attribute);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<BooleanNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<IdentifierNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<NilNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<NumberNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<StringNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<VarargsNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<BinaryOpNode>& p_Node)
{
    assert_node_pointer(BinaryOpNode, p_Node->lhs);
    assert_node_pointer(BinaryOpNode, p_Node->rhs);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    assert_node_pointer(UnaryOpNode, p_Node->value);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<AttributeListNode>& p_Node)
{
    assert_node_list(ArgumentListNode, p_Node->list);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<ExpressionListNode>& p_Node)
{
    assert_node_list(ExpressionListNode, p_Node->list);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<FieldListNode>& p_Node)
{
    assert_node_list(FieldListNode, p_Node->list);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<NameListNode>& p_Node)
{
    assert_node_list(NameListNode, p_Node->list);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<ParameterListNode>& p_Node)
{
    assert_node_list(ParameterListNode, p_Node->list);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<VariableListNode>& p_Node)
{
    assert_node_list(VariableListNode, p_Node->list);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<BlockNode>& p_Node)
{
    assert_node_list(BlockNode, p_Node->statements);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<ChunkNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    assert_node_pointer(AssignmentStatNode, p_Node->lValues);
    assert_node_pointer(AssignmentStatNode, p_Node->rValues);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<BreakStat>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<ContinueStat>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<DoStatNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    assert_node_pointer(GenericForStatNode, p_Node->names);
    assert_node_pointer(GenericForStatNode, p_Node->expressions);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<GotoStatNode>& p_Node)
{
    assert_node_pointer(GotoStatNode, p_Node->label);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<IfStatNode>& p_Node)
{
    LL_assert(!p_Node->blocks.empty(), "IfStatNode: `p_Node->blocks` is empty.");
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<LocalStatNode>& p_Node)
{
    assert_node_pointer(LocalStatNode, p_Node->statement);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    assert_node_pointer(NumericForStatNode, p_Node->name);
    assert_node_pointer(NumericForStatNode, p_Node->init);
    assert_node_pointer(NumericForStatNode, p_Node->goal);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<RepeatStatNode>& p_Node)
{
    assert_node_pointer(RepeatStatNode, p_Node->condition);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<WhileStatNode>& p_Node)
{
    assert_node_pointer(WhileStatNode, p_Node->condition);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<IndexNode>& p_Node)
{
    assert_node_pointer(IndexNode, p_Node->root);
    assert_node_pointer(IndexNode, p_Node->index);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<MemberNode>& p_Node)
{
    assert_node_pointer(MemberNode, p_Node->root);
    assert_node_pointer(MemberNode, p_Node->member);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<MethodNode>& p_Node)
{
    assert_node_pointer(MethodNode, p_Node->root);
    assert_node_pointer(MethodNode, p_Node->method);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<TableIndexValueNode>& p_Node)
{
    assert_node_pointer(TableIndexValueNode, p_Node->index);
    assert_node_pointer(TableIndexValueNode, p_Node->value);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<TableNameValueNode>& p_Node)
{
    assert_node_pointer(TableNameValueNode, p_Node->name);
    assert_node_pointer(TableNameValueNode, p_Node->value);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<TableValueNode>& p_Node)
{
    assert_node_pointer(TableValueNode, p_Node->value);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<FuncBodyNode>& p_Node)
{
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<FuncCallNode>& p_Node)
{
    assert_node_pointer(FuncCallNode, p_Node->root);
    assert_node_pointer(FuncCallNode, p_Node->args);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<FuncDefNode>& p_Node)
{
    assert_node_pointer(FuncDefNode, p_Node->body);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<FuncNameNode>& p_Node)
{
    assert_node_pointer(FuncCallNode, p_Node->name);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<LabelNode>& p_Node)
{
    assert_node_pointer(LabelNode, p_Node->label);
    visit(p_Node);
}

void AstVisitor::visitNode(const std::shared_ptr<SemicolonNode>& p_Node)
{
    visit(p_Node);
}
