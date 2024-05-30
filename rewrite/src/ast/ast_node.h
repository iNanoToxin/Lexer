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
};

#endif
