#include "ast_node.h"
#include "../../utilities/assert.h"

AstNode::AstNode(const AstKind& p_Kind) : kind(p_Kind) {}

std::string AstNode::getKindName() const
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
        case AstKind::AssignmentStatNode: return "AssignmentStatNode";
        case AstKind::BreakStat: return "BreakStat";
        case AstKind::ContinueStat: return "ContinueStat";
        case AstKind::DoStatNode: return "DoStatNode";
        case AstKind::GenericForStatNode: return "GenericForStatNode";
        case AstKind::NumericForStatNode: return "NumericForStatNode";
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
    LL_failure("kind != AstKind", "Unknown AstKind.");
    return std::string{};
}
