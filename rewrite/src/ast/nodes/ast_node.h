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
private:
    std::weak_ptr<AstNode> m_Parent;
    std::weak_ptr<AstNode> m_Reference;
public:
    AstKind kind;

    explicit AstNode(const AstKind& p_Kind) : kind(p_Kind) {}
    virtual ~AstNode() = default;

    // explicit AstNode(const AstKind& p_Kind) : kind(p_Kind)
    // {
    //     std::cout << "Object `" << getKindName() << "` created." << std::endl;
    // }
    //
    // virtual ~AstNode()
    // {
    //     std::cout << "Object `" << getKindName() << "` destroyed." << std::endl;
    // }

    virtual void accept(AstVisitor& p_Visitor) = 0;
    void setReference(const std::shared_ptr<AstNode>& p_Reference);
    void setParent(const std::shared_ptr<AstNode>& p_Parent);
    std::shared_ptr<AstNode> getReference() const;
    std::shared_ptr<AstNode> getParent() const;
    std::string getKindName() const;

    std::shared_ptr<AstNode> getBlock() const
    {
        std::shared_ptr<AstNode> current = getParent();
        while (current != nullptr && current->kind != AstKind::BlockNode)
        {
            current = current->getParent();
        }
        return current;
    }

    std::shared_ptr<AstNode> getAncestor(const AstKind& p_Kind) const
    {
        std::shared_ptr<AstNode> current = getParent();
        while (current != nullptr && current->kind != AstKind::BlockNode && current->kind != p_Kind)
        {
            current = current->getParent();
        }
        return current != nullptr && current->kind == p_Kind ? current : nullptr;
    }
};
