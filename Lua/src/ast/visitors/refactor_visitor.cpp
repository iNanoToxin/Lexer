#include "refactor_visitor.h"
#include <algorithm>
#include <parser/token_stream.h>

void RefactorVisitor::visit(const std::shared_ptr<AttributeNode>& p_Node)
{
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }
    if (p_Node->attribute != nullptr)
    {
        p_Node->attribute->accept(*this);
        p_Node->attribute = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<BooleanNode>& p_Node)
{
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<IdentifierNode>& p_Node)
{
    m_Result = p_Node;

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
void RefactorVisitor::visit(const std::shared_ptr<NilNode>& p_Node)
{
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<NumberNode>& p_Node)
{
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<StringNode>& p_Node)
{
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<VarargsNode>& p_Node)
{
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<BinaryOpNode>& p_Node)
{
    if (p_Node->lhs != nullptr)
    {
        p_Node->lhs->accept(*this);
        p_Node->lhs = m_Result;
    }
    if (p_Node->rhs != nullptr)
    {
        p_Node->rhs->accept(*this);
        p_Node->rhs = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    if (p_Node->list != nullptr)
    {
        p_Node->list->accept(*this);
        p_Node->list = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<AttributeListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        if (child != nullptr)
        {
            child->accept(*this);
            child = m_Result;
            pushLocal(child);
        }
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<ExpressionListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        if (child != nullptr)
        {
            child->accept(*this);
            child = m_Result;
        }
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<FieldListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        if (child != nullptr)
        {
            child->accept(*this);
            child = m_Result;
        }
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<NameListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        if (child != nullptr)
        {
            child->accept(*this);
            child = m_Result;
        }
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<ParameterListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        if (child != nullptr)
        {
            // child->accept(*this);
            // child = m_Result;
            pushLocal(child);
        }
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<VariableListNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& child : p_Node->list)
    {
        if (child != nullptr)
        {
            child->accept(*this);
            child = m_Result;
        }
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<BlockNode>& p_Node)
{
    m_ScopeTree.push();
    for (std::shared_ptr<AstNode>& statement : p_Node->statements)
    {
        if (statement != nullptr)
        {
            statement->accept(*this);
            statement = m_Result;
        }
    }
    m_ScopeTree.pop();
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<ChunkNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    if (p_Node->rValues != nullptr)
    {
        p_Node->rValues->accept(*this);
        p_Node->rValues = m_Result;
    }
    if (p_Node->lValues != nullptr)
    {
        p_Node->lValues->accept(*this);
        p_Node->lValues = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<BreakStat>& p_Node)
{
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<ContinueStat>& p_Node)
{
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<DoStatNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    if (p_Node->nameList != nullptr)
    {
        p_Node->nameList->accept(*this);
        p_Node->nameList = m_Result;
    }
    if (p_Node->expressionList != nullptr)
    {
        p_Node->expressionList->accept(*this);
        p_Node->expressionList = m_Result;
    }
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<GotoStatNode>& p_Node)
{
    if (p_Node->label != nullptr)
    {
        p_Node->label->accept(*this);
        p_Node->label = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<IfStatNode>& p_Node)
{
    for (AstNodePair& pair : p_Node->blocks)
    {
        if (pair.first != nullptr)
        {
            pair.first->accept(*this);
            pair.first = m_Result;
        }
        if (pair.second != nullptr)
        {
            pair.second->accept(*this);
            pair.second = m_Result;
        }
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<LocalStatNode>& p_Node)
{
    if (p_Node->statement != nullptr)
    {
        p_Node->statement->accept(*this);
        p_Node->statement = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    m_ScopeTree.push();
    if (p_Node->init != nullptr)
    {
        p_Node->init->accept(*this);
        p_Node->init = m_Result;
    }
    if (p_Node->goal != nullptr)
    {
        p_Node->goal->accept(*this);
        p_Node->goal = m_Result;
    }
    if (p_Node->step != nullptr)
    {
        p_Node->step->accept(*this);
        p_Node->step = m_Result;
    }
    if (p_Node->name != nullptr)
    {
        // p_Node->name->accept(*this);
        // p_Node->name = m_Result;
        pushLocal(p_Node->name);
    }
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_ScopeTree.pop();
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<RepeatStatNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    if (p_Node->condition != nullptr)
    {
        p_Node->condition->accept(*this);
        p_Node->condition = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    if (p_Node->args != nullptr)
    {
        p_Node->args->accept(*this);
        p_Node->args = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<WhileStatNode>& p_Node)
{
    if (p_Node->condition != nullptr)
    {
        p_Node->condition->accept(*this);
        p_Node->condition = m_Result;
    }
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<IndexNode>& p_Node)
{
    if (p_Node->root != nullptr)
    {
        p_Node->root->accept(*this);
        p_Node->root = m_Result;
    }
    if (p_Node->index != nullptr)
    {
        p_Node->index->accept(*this);
        p_Node->index = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<MemberNode>& p_Node)
{
    if (p_Node->root != nullptr)
    {
        p_Node->root->accept(*this);
        p_Node->root = m_Result;
    }
    if (p_Node->member != nullptr)
    {
        p_Node->member->accept(*this);
        p_Node->member = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<MethodNode>& p_Node)
{
    if (p_Node->root != nullptr)
    {
        p_Node->root->accept(*this);
        p_Node->root = m_Result;
    }
    if (p_Node->method != nullptr)
    {
        p_Node->method->accept(*this);
        p_Node->method = m_Result;
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    if (p_Node->fieldList != nullptr)
    {
        p_Node->fieldList->accept(*this);
        p_Node->fieldList = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<TableIndexValueNode>& p_Node)
{
    if (p_Node->index != nullptr)
    {
        p_Node->index->accept(*this);
        p_Node->index = m_Result;
    }
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<TableNameValueNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        p_Node->name->accept(*this);
        p_Node->name = m_Result;
    }
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<TableValueNode>& p_Node)
{
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<FuncBodyNode>& p_Node)
{
    m_ScopeTree.push();
    if (p_Node->parameters != nullptr)
    {
        p_Node->parameters->accept(*this);
        p_Node->parameters = m_Result;
    }
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_ScopeTree.pop();
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<FuncCallNode>& p_Node)
{
    if (p_Node->root != nullptr)
    {
        p_Node->root->accept(*this);
        p_Node->root = m_Result;
    }
    if (p_Node->args != nullptr)
    {
        p_Node->args->accept(*this);
        p_Node->args = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        p_Node->name->accept(*this);
        p_Node->name = m_Result;

        if (p_Node->getParent()->kind == AstKind::LocalStatNode)
        {
            pushLocal(p_Node->name);
        }
    }
    if (p_Node->body != nullptr)
    {
        p_Node->body->accept(*this);
        p_Node->body = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<FuncNameNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        p_Node->name->accept(*this);
        p_Node->name = m_Result;
    }
    m_Result = p_Node;
}

void RefactorVisitor::visit(const std::shared_ptr<LabelNode>& p_Node)
{
    if (p_Node->label != nullptr)
    {
        p_Node->label->accept(*this);
        p_Node->label = m_Result;
    }
    m_Result = p_Node;
}
void RefactorVisitor::visit(const std::shared_ptr<SemicolonNode>& p_Node)
{
    m_Result = p_Node;
}

void RefactorVisitor::pushLocal(const std::shared_ptr<AstNode>& p_Node) {
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
