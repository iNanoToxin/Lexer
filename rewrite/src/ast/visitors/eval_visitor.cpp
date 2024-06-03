#include "eval_visitor.h"
#include <cmath>
#include <limits>
#include <utilities/assert.h>

void EvalVisitor::visit(const std::shared_ptr<AttributeNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<BooleanNode>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<IdentifierNode>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<NilNode>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<NumberNode>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<StringNode>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<VarargsNode>& p_Node)
{
    m_Result = p_Node;
}

template <typename T>
std::shared_ptr<NumberNode> do_op(const std::shared_ptr<NumberNode>& p_Lhs, const T& p_Operation, const std::shared_ptr<NumberNode>& p_Rhs, bool p_ForceDouble = false)
{
    LuaDouble lhs_value = p_Lhs->isInteger ? static_cast<LuaDouble>(p_Lhs->numInteger) : p_Lhs->numDouble;
    LuaDouble rhs_value = p_Rhs->isInteger ? static_cast<LuaDouble>(p_Rhs->numInteger) : p_Rhs->numDouble;
    lhs_value *= p_Lhs->isNegative ? -1.0 : 1.0;
    rhs_value *= p_Rhs->isNegative ? -1.0 : 1.0;
    const LuaDouble result = p_Operation(lhs_value, rhs_value);

    if (!p_ForceDouble &&
        result >= std::numeric_limits<LuaInteger>::min() &&
        result <= std::numeric_limits<LuaInteger>::max() &&
        std::floor(result) == result
    )
    {
        return NumberNode::create(static_cast<LuaInteger>(result));
    }
    return NumberNode::create(result);
}

void EvalVisitor::visit(const std::shared_ptr<BinaryOpNode>& p_Node)
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

    if (p_Node->lhs->kind == AstKind::NumberNode && p_Node->rhs->kind == AstKind::NumberNode)
    {
        const std::shared_ptr<NumberNode>& lhs = NumberNode::cast(p_Node->lhs);
        const std::shared_ptr<NumberNode>& rhs = NumberNode::cast(p_Node->rhs);

        switch (p_Node->opKind)
        {
            case BinaryOpKind::Plus:
            {
                m_Result = do_op(lhs, std::plus(), rhs);
                break;
            }
            case BinaryOpKind::Minus:
            {
                m_Result = do_op(lhs, std::minus(), rhs);
                break;
            }
            case BinaryOpKind::Multiply:
            {
                m_Result = do_op(lhs, std::multiplies(), rhs);
                break;
            }
            case BinaryOpKind::FloatDivision:
            {
                m_Result = do_op(lhs, std::divides(), rhs, true);
                break;
            }
            case BinaryOpKind::FloorDivision:
            {
                const std::shared_ptr<NumberNode> number = do_op(lhs, std::divides(), rhs);

                if (!number->isInteger)
                {
                    number->numDouble = std::floor(number->numDouble);
                }
                m_Result = number;
                break;
            }
            case BinaryOpKind::Modulus:
            {
                m_Result = do_op(lhs, [](LuaDouble x, LuaDouble y) -> LuaInteger
                {
                    return x - std::floor(x / y) * y;
                }, rhs);
                break;
            }
            case BinaryOpKind::Power:
            {
                m_Result = do_op(lhs, [](LuaDouble x, LuaDouble y) -> LuaDouble
                {
                    return std::pow(x, y);
                }, rhs, true);
                break;
            }

            case BinaryOpKind::Or:
            case BinaryOpKind::And:
            case BinaryOpKind::LessThan:
            case BinaryOpKind::GreaterThan:
            case BinaryOpKind::LessEqual:
            case BinaryOpKind::GreaterEqual:
            case BinaryOpKind::NotEqual:
            case BinaryOpKind::Equal:
            case BinaryOpKind::BitOr:
            case BinaryOpKind::BitExOr:
            case BinaryOpKind::BitAnd:
            case BinaryOpKind::LeftShift:
            case BinaryOpKind::RightShift:
            case BinaryOpKind::Concat:
            default:
            {
                m_Result = p_Node;
                break;
            }
        }
        return;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }

    if (p_Node->value->kind == AstKind::NumberNode)
    {
        const std::shared_ptr<NumberNode> number = NumberNode::cast(p_Node->value);

        switch (p_Node->opKind)
        {
            case UnaryOpKind::Negate:
            {
                if (number->isInteger)
                {
                    number->numInteger *= -1;
                }
                else
                {
                    number->numDouble *= -1;
                }
                break;
            }
            case UnaryOpKind::Not:
            {
                m_Result = BooleanNode::create(false);
                break;
            }
            case UnaryOpKind::BitNot:
            {
                LL_assert(number->isInteger, "Unary operation `BitNot` cannot be performed on double.");
                number->numInteger = ~number->numInteger;
                break;
            }
            default:
            {
                m_Result = p_Node;
                break;
            }
        }
        return;
    }
    m_Result = p_Node;
}

void EvalVisitor::visit(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    if (p_Node->list != nullptr)
    {
        p_Node->list->accept(*this);
        p_Node->list = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<AttributeListNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<ExpressionListNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<FieldListNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<NameListNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<ParameterListNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<VariableListNode>& p_Node)
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

void EvalVisitor::visit(const std::shared_ptr<BlockNode>& p_Node)
{
    for (std::shared_ptr<AstNode>& statement : p_Node->statements)
    {
        if (statement != nullptr)
        {
            statement->accept(*this);
            statement = m_Result;
        }
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<ChunkNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}

void EvalVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    if (p_Node->variableList != nullptr)
    {
        p_Node->variableList->accept(*this);
        p_Node->variableList = m_Result;
    }
    if (p_Node->expressionList != nullptr)
    {
        p_Node->expressionList->accept(*this);
        p_Node->expressionList = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<BreakStat>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<ContinueStat>& p_Node)
{
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<DoStatNode>& p_Node)
{
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<GotoStatNode>& p_Node)
{
    if (p_Node->label != nullptr)
    {
        p_Node->label->accept(*this);
        p_Node->label = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<IfStatNode>& p_Node)
{
    for (AstNodePair& pair : p_Node->conditionalBlocks)
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
void EvalVisitor::visit(const std::shared_ptr<LocalStatNode>& p_Node)
{
    if (p_Node->statement != nullptr)
    {
        p_Node->statement->accept(*this);
        p_Node->statement = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        p_Node->name->accept(*this);
        p_Node->name = m_Result;
    }
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
    if (p_Node->block != nullptr)
    {
        p_Node->block->accept(*this);
        p_Node->block = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<RepeatStatNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    if (p_Node->args != nullptr)
    {
        p_Node->args->accept(*this);
        p_Node->args = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<WhileStatNode>& p_Node)
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

void EvalVisitor::visit(const std::shared_ptr<IndexNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<MemberNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<MethodNode>& p_Node)
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

void EvalVisitor::visit(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    if (p_Node->fieldList != nullptr)
    {
        p_Node->fieldList->accept(*this);
        p_Node->fieldList = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<TableIndexValueNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<TableNameValueNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<TableValueNode>& p_Node)
{
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }
    m_Result = p_Node;
}

void EvalVisitor::visit(const std::shared_ptr<FuncBodyNode>& p_Node)
{
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
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<FuncCallNode>& p_Node)
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
void EvalVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        p_Node->name->accept(*this);
        p_Node->name = m_Result;
    }
    if (p_Node->body != nullptr)
    {
        p_Node->body->accept(*this);
        p_Node->body = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<FuncNameNode>& p_Node)
{
    if (p_Node->name != nullptr)
    {
        p_Node->name->accept(*this);
        p_Node->name = m_Result;
    }
    m_Result = p_Node;
}

void EvalVisitor::visit(const std::shared_ptr<LabelNode>& p_Node)
{
    if (p_Node->label != nullptr)
    {
        p_Node->label->accept(*this);
        p_Node->label = m_Result;
    }
    m_Result = p_Node;
}
void EvalVisitor::visit(const std::shared_ptr<SemicolonNode>& p_Node)
{
    m_Result = p_Node;
}
