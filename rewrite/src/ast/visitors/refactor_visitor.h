#pragma once
#include <algorithm>
#include <parser/token_stream.h>
#include <utilities/assert.h>
#include "ast_visitor.h"
#include "ast/scope/scope_tree.h"


class RefactorVisitor final : public AstVisitor
{
private:
    std::shared_ptr<AstNode> m_Result;
    ScopeStack m_ScopeTree;

public:
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

    void pushLocal(const std::shared_ptr<AstNode>& p_Node)
    {
        std::shared_ptr<IdentifierNode> identifier = nullptr;

        if (p_Node->kind == AstKind::IdentifierNode)
        {
            identifier = IdentifierNode::cast(p_Node);
        }
        else if (p_Node->kind == AstKind::AttributeNode)
        {
            identifier = IdentifierNode::cast(AttributeNode::cast(p_Node)->value);
        }
        else
        {
            return;
        }

        // std::cout << "PUSHED: " << identifier->value << std::endl;

        m_ScopeTree.setLocal(identifier->getName(), identifier);

    RETRY:
        static int offset = 0;
        static const std::string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        std::size_t id = m_ScopeTree.totalCount() + offset;

        std::string str;

        while (id > 0)
        {
            id--;
            str += chars[id % chars.size()];
            id /= chars.size();
        }
        std::reverse(str.begin(), str.end());
        identifier->setName(str);

        if (is_keyword(str))
        {
            offset++;
            goto RETRY;
        }
    }

    std::map<std::shared_ptr<AstNode>, VariableInfo> getVariables() const
    {
        return m_ScopeTree.getVariables();
    }
};
