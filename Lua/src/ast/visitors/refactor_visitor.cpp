#include "refactor_visitor.h"
#include <algorithm>
#include <parser/token_stream.h>


void RefactorVisitor::pushLocal(const std::shared_ptr<AstNode>& p_Node)
{
    std::shared_ptr<IdentifierNode> identifier = nullptr;

    if (p_Node->kind == AstKind::IdentifierNode)
    {
        identifier = p_Node->cast<IdentifierNode>();
    }
    else if (p_Node->kind == AstKind::AttributeNode)
    {
        identifier = p_Node->cast<AttributeNode>()->value->cast<IdentifierNode>();
    }
    else
    {
        return;
    }

    // std::cout << "PUSHED: " << identifier->getName() << std::endl;
    m_ScopeTree.setLocal(identifier->getName(), identifier);
    m_ScopeTree.addUsage(identifier, identifier);
    m_ScopeTree.setConstant(identifier, true);

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
    // identifier->setName("v" + std::to_string(m_ScopeTree.totalCount()));
}

std::unordered_map<std::shared_ptr<AstNode>, VariableInfo> RefactorVisitor::getVariables() const
{
    return m_ScopeTree.getVariables();
}


void RefactorVisitor::visit(const std::shared_ptr<AttributeNode>& p_Node)
{
    p_Node->value->accept(*this);
    p_Node->attribute->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<BooleanNode>& p_Node) {}

void RefactorVisitor::visit(const std::shared_ptr<IdentifierNode>& p_Node)
{
    if (p_Node->getParent()->kind == AstKind::TableNameValueNode)
    {
        return;
    }

    if (const std::shared_ptr<AstNode>& value = m_ScopeTree.get(p_Node->getName()))
    {
        if (p_Node->getParent()->kind != AstKind::AttributeListNode)
        {
            p_Node->setReference(value);
            p_Node->setName(value->cast<IdentifierNode>()->getName());
            m_ScopeTree.addUsage(value, p_Node);

            if (p_Node->getParent<VariableListNode>() != nullptr)
            {
                m_ScopeTree.setConstant(value, false);
            }
            else
            {
                m_ScopeTree.incrementUseCount(value);
            }
        }
    }
}

void RefactorVisitor::visit(const std::shared_ptr<NilNode>& p_Node) {}
void RefactorVisitor::visit(const std::shared_ptr<NumberNode>& p_Node) {}
void RefactorVisitor::visit(const std::shared_ptr<StringNode>& p_Node) {}
void RefactorVisitor::visit(const std::shared_ptr<VarargsNode>& p_Node) {}

void RefactorVisitor::visit(const std::shared_ptr<BinaryOpNode>& p_Node)
{
    p_Node->lhs->accept(*this);
    p_Node->rhs->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    p_Node->value->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    if (p_Node->list != nullptr)
    {
        p_Node->list->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<AttributeListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        child->accept(*this);
        pushLocal(child);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<ExpressionListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        child->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<FieldListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        child->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<NameListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        child->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<ParameterListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        pushLocal(child);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<VariableListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        child->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<BlockNode>& p_Node)
{
    m_ScopeTree.push();
    for (std::shared_ptr<AstNode>& statement : p_Node->statements)
    {
        statement->accept(*this);
    }
    m_ScopeTree.pop();
}

void RefactorVisitor::visit(const std::shared_ptr<ChunkNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    p_Node->rValues->accept(*this);
    p_Node->lValues->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<BreakStat>& p_Node) {}
void RefactorVisitor::visit(const std::shared_ptr<ContinueStat>& p_Node) {}

void RefactorVisitor::visit(const std::shared_ptr<DoStatNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    p_Node->names->accept(*this);
    p_Node->expressions->accept(*this);
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<GotoStatNode>& p_Node)
{
    p_Node->label->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<IfStatNode>& p_Node)
{
    for (AstNodePair& pair : p_Node->blocks)
    {
        if (pair.first != nullptr)
        {
            pair.first->accept(*this);
        }
        if (pair.second != nullptr)
        {
            pair.second->accept(*this);
        }
    }
}

void RefactorVisitor::visit(const std::shared_ptr<LocalStatNode>& p_Node)
{
    p_Node->statement->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    m_ScopeTree.push();
    p_Node->init->accept(*this);
    p_Node->goal->accept(*this);

    if (p_Node->step != nullptr)
    {
        p_Node->step->accept(*this);
    }

    pushLocal(p_Node->name);

    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
    m_ScopeTree.pop();
}

void RefactorVisitor::visit(const std::shared_ptr<RepeatStatNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
    p_Node->condition->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    if (p_Node->args != nullptr)
    {
        p_Node->args->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<WhileStatNode>& p_Node)
{
    p_Node->condition->accept(*this);
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<IndexNode>& p_Node)
{
    p_Node->root->accept(*this);
    p_Node->index->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<MemberNode>& p_Node)
{
    p_Node->root->accept(*this);
    p_Node->member->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<MethodNode>& p_Node)
{
    p_Node->root->accept(*this);
    p_Node->method->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    if (p_Node->fields != nullptr)
    {
        p_Node->fields->accept(*this);
    }
}

void RefactorVisitor::visit(const std::shared_ptr<TableIndexValueNode>& p_Node)
{
    p_Node->index->accept(*this);
    p_Node->value->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<TableNameValueNode>& p_Node)
{
    p_Node->name->accept(*this);
    p_Node->value->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<TableValueNode>& p_Node)
{
    p_Node->value->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<FuncBodyNode>& p_Node)
{
    m_ScopeTree.push();
    if (p_Node->parameters != nullptr)
    {
        p_Node->parameters->accept(*this);
    }
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
    }
    m_ScopeTree.pop();
}

void RefactorVisitor::visit(const std::shared_ptr<FuncCallNode>& p_Node)
{
    p_Node->root->accept(*this);
    p_Node->args->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        if (p_Node->getParent()->kind == AstKind::LocalStatNode)
        {
            pushLocal(p_Node->name);
        }
        p_Node->name->accept(*this);
    }
    p_Node->body->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<FuncNameNode>& p_Node)
{
    p_Node->name->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<LabelNode>& p_Node)
{
    p_Node->label->accept(*this);
}

void RefactorVisitor::visit(const std::shared_ptr<SemicolonNode>& p_Node) {}
