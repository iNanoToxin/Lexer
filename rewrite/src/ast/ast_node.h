#ifndef LUA_LEXER_ASTNODE_H
#define LUA_LEXER_ASTNODE_H

#include <string>

enum class AstKind
{
    AttributeNode,
    BooleanNode,
    IdentifierNode,
    NilNode,
    NumberNode,
    StringNode,
    VarargsNode,
    BinaryOpNode,
    UnaryOpNode,
    ArgumentListNode,
    AttributeListNode,
    ExpressionListNode,
    FieldListNode,
    NameListNode,
    ParameterListNode,
    VariableListNode,
    BlockNode,
    ChunkNode,
    ConditionalBlockNode,
    AssignmentStatNode,
    BreakStat,
    DoStatNode,
    ForStatNode,
    GotoStatNode,
    IfStatNode,
    LocalStatNode,
    RepeatStatNode,
    ReturnStatNode,
    WhileStatNode,
    IndexNode,
    MemberNode,
    MethodNode,
    TableConstructorNode,
    TableIndexValueNode,
    TableNameValueNode,
    TableValueNode,
    FuncBodyNode,
    FuncCallNode,
    FuncDefNode,
    FuncNameNode,
    LabelNode,
    SemicolonNode
};

class AstNode
{
public:
    AstKind kind;
    explicit AstNode(const AstKind& p_Kind) : kind(p_Kind) {}
    virtual ~AstNode() = default;
    virtual void accept(class AstVisitor* p_Visitor) = 0;
    virtual void destroy() = 0;

    [[nodiscard]] bool is(const AstKind& p_Kind) const
    {
        return kind == p_Kind;
    }

    [[nodiscard]] std::string get_kind_name() const
    {
        switch (kind)
        {
            case AstKind::AttributeNode: return "AttributeNode";
            case AstKind::BooleanNode: return "BooleanNode";
            case AstKind::IdentifierNode: return "IdentifierNode";
            case AstKind::NilNode: return "NilNode";
            case AstKind::NumberNode: return "NumberNode";
            case AstKind::StringNode: return "StringNode";
            case AstKind::VarargsNode: return "VarargsNode";
            case AstKind::BinaryOpNode: return "BinaryOpNode";
            case AstKind::UnaryOpNode: return "UnaryOpNode";
            case AstKind::ArgumentListNode: return "ArgumentListNode";
            case AstKind::AttributeListNode: return "AttributeListNode";
            case AstKind::ExpressionListNode: return "ExpressionListNode";
            case AstKind::FieldListNode: return "FieldListNode";
            case AstKind::NameListNode: return "NameListNode";
            case AstKind::ParameterListNode: return "ParameterListNode";
            case AstKind::VariableListNode: return "VariableListNode";
            case AstKind::BlockNode: return "BlockNode";
            case AstKind::ChunkNode: return "ChunkNode";
            case AstKind::ConditionalBlockNode: return "ConditionalBlockNode";
            case AstKind::AssignmentStatNode: return "AssignmentStatNode";
            case AstKind::BreakStat: return "BreakStat";
            case AstKind::DoStatNode: return "DoStatNode";
            case AstKind::ForStatNode: return "ForStatNode";
            case AstKind::GotoStatNode: return "GotoStatNode";
            case AstKind::IfStatNode: return "IfStatNode";
            case AstKind::LocalStatNode: return "LocalStatNode";
            case AstKind::RepeatStatNode: return "RepeatStatNode";
            case AstKind::ReturnStatNode: return "ReturnStatNode";
            case AstKind::WhileStatNode: return "WhileStatNode";
            case AstKind::IndexNode: return "IndexNode";
            case AstKind::MemberNode: return "MemberNode";
            case AstKind::MethodNode: return "MethodNode";
            case AstKind::TableConstructorNode: return "TableConstructorNode";
            case AstKind::TableIndexValueNode: return "TableIndexValueNode";
            case AstKind::TableNameValueNode: return "TableNameValueNode";
            case AstKind::TableValueNode: return "TableValueNode";
            case AstKind::FuncBodyNode: return "FuncBodyNode";
            case AstKind::FuncCallNode: return "FuncCallNode";
            case AstKind::FuncDefNode: return "FuncDefNode";
            case AstKind::FuncNameNode: return "FuncNameNode";
            case AstKind::LabelNode: return "LabelNode";
            case AstKind::SemicolonNode: return "SemicolonNode";
        }
        return "__UNKNOWN__";
    }
};

#endif
