#pragma once
#include <iostream>
#include <memory>
#include <string>

class AstNode;
class AstVisitor;
using AstNodePair = std::pair<std::shared_ptr<AstNode>, std::shared_ptr<AstNode>>;

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
    AssignmentStatNode,
    BreakStat,
    ContinueStat,
    DoStatNode,
    GenericForStatNode,
    NumericForStatNode,
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

class AstNode : public std::enable_shared_from_this<AstNode>
{
public:
    std::weak_ptr<AstNode> parent;
    AstKind kind;
    explicit AstNode(const AstKind& p_Kind);
    virtual ~AstNode() = default;

    // virtual ~AstNode()
    // {
    //     std::cout << "Object `" << getKindName() << "` destroyed." << std::endl;
    // }

    virtual void accept(AstVisitor& p_Visitor) = 0;
    std::string getKindName() const;
};
