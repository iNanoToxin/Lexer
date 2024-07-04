#include "eval_visitor.h"
#include <algorithm>
#include <cmath>
#include <sstream>
#include "format_visitor.h"
#include "utilities/assert.h"
#include "utilities/math.h"
#include "utilities/node.h"

bool EvalVisitor::getReference(std::shared_ptr<AstNode>& p_Reference, const std::shared_ptr<AstNode>& p_Node) const
{
    if (m_Variables.contains(p_Node))
    {
        p_Reference = p_Node;
        return true;
    }
    else if (m_Variables.contains(p_Node->getReference()))
    {
        p_Reference = p_Node->getReference();
        return true;
    }
    return false;
}

void EvalVisitor::setVariables(const std::unordered_map<std::shared_ptr<AstNode>, VariableInfo>& p_Variables)
{
    for (const auto& pair : p_Variables)
    {
        VariableInfo info = pair.second;
        info.reference = pair.first;
        info.node = pair.first;
        info.value = nullptr;
        info.currentBlock = nullptr;
        m_Variables[pair.first] = info;

        // std::cout << Ansi(AnsiColor::Cyan, "INIT: ") << info << std::endl;
    }
}


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

    const std::shared_ptr<AstNode>& reference = p_Node->getReference();

    if (reference != nullptr && m_Variables.contains(reference) && m_Variables[reference].value != nullptr)
    {
        int depth_1, depth_2;
        const std::shared_ptr<BlockNode>& block_a = p_Node->getBlock(&depth_1);
        const std::shared_ptr<BlockNode>& block_b = m_Variables[reference].node->getBlock(&depth_2);
        if (depth_1 < depth_2)
        {
            return;
        }

        if (m_Variables[reference].value->kind == AstKind::BinaryOpNode && m_Variables[reference].useCount > 1)
        {
            return;
        }

        const std::shared_ptr<BlockNode>& reference_block = reference->getBlock();
        std::shared_ptr<AstNode> current = p_Node;
        bool pass = true;

        while (current != nullptr && current->kind != AstKind::BlockNode && !current->isExpression())
        {
            if (current->kind == AstKind::VariableListNode || current->kind == AstKind::AttributeListNode)
            {
                pass = false;
                break;
            }
            current = current->getParent();
        }

        while (block_a != block_b && current != nullptr && current != reference_block)
        {
            if (current->kind == AstKind::FuncBodyNode ||
                current->kind == AstKind::GenericForStatNode ||
                current->kind == AstKind::NumericForStatNode ||
                current->kind == AstKind::IfStatNode ||
                current->kind == AstKind::WhileStatNode ||
                current->kind == AstKind::RepeatStatNode
            )
            {
                pass = false;
                break;
            }
            current = current->getParent();
        }

        if (!m_Variables[reference].constant && !pass)
        {
            // Node::print_path(p_Node);
            return;
        }

        m_Result = m_Variables[reference].value;
        m_Variables[reference].useCount--;
        // std::cout << "USE COUNT: " << p_Node->getName() << " : " << m_Variables[reference].useCount << std::endl;
    }
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

    m_Result = p_Node;

    switch (p_Node->opKind)
    {
        case BinaryOpKind::Plus:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::plus, p_Node->rhs);
            break;
        }
        case BinaryOpKind::Minus:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::minus, p_Node->rhs);
            break;
        }
        case BinaryOpKind::Multiply:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::multiply, p_Node->rhs);
            break;
        }
        case BinaryOpKind::FloatDivision:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::float_divide, p_Node->rhs, true);
            break;
        }
        case BinaryOpKind::FloorDivision:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::floor_division, p_Node->rhs);
            break;
        }
        case BinaryOpKind::Modulus:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::mod, p_Node->rhs);
            break;
        }
        case BinaryOpKind::Power:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &ArithmeticOp::pow, p_Node->rhs, true);
            break;
        }
        case BinaryOpKind::BitOr:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &BitwiseOp::bit_or, p_Node->rhs);
            break;
        }
        case BinaryOpKind::BitExOr:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &BitwiseOp::bit_xor, p_Node->rhs);
            break;
        }
        case BinaryOpKind::BitAnd:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &BitwiseOp::bit_and, p_Node->rhs);
            break;
        }
        case BinaryOpKind::LeftShift:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &BitwiseOp::bit_shift_left, p_Node->rhs);
            break;
        }
        case BinaryOpKind::RightShift:
        {
            Node::perform_binary_op(m_Result, p_Node->lhs, &BitwiseOp::bit_shift_right, p_Node->rhs);
            break;
        }

        case BinaryOpKind::LessThan:
        {
            Node::perform_comparison(m_Result, p_Node->lhs, &EqualityOp::less_than, p_Node->rhs);
            break;
        }
        case BinaryOpKind::LessEqual:
        {
            Node::perform_comparison(m_Result, p_Node->lhs, &EqualityOp::less_then_or_equal, p_Node->rhs);
            break;
        }
        case BinaryOpKind::GreaterThan:
        {
            Node::perform_comparison(m_Result, p_Node->lhs, &EqualityOp::greater_than, p_Node->rhs);
            break;
        }
        case BinaryOpKind::GreaterEqual:
        {
            Node::perform_comparison(m_Result, p_Node->lhs, &EqualityOp::greater_then_or_equal, p_Node->rhs);
            break;
        }
        case BinaryOpKind::Equal:
        {
            Node::perform_comparison(m_Result, p_Node->lhs, &EqualityOp::equal, p_Node->rhs);
            break;
        }
        case BinaryOpKind::NotEqual:
        {
            Node::perform_comparison(m_Result, p_Node->lhs, &EqualityOp::not_equal, p_Node->rhs);
            break;
        }

        case BinaryOpKind::Or:
        {
            bool lhs_bool, rhs_bool;
            if (Node::convert_to_bool(&lhs_bool, p_Node->lhs) && Node::convert_to_bool(&rhs_bool, p_Node->rhs))
            {
                m_Result = lhs_bool ? p_Node->lhs : p_Node->rhs;
            }
            break;
        }
        case BinaryOpKind::And:
        {
            bool lhs_bool, rhs_bool;
            if (Node::convert_to_bool(&lhs_bool, p_Node->lhs) && Node::convert_to_bool(&rhs_bool, p_Node->rhs))
            {
                m_Result = lhs_bool ? p_Node->rhs : p_Node->lhs;
            }
            break;
        }

        case BinaryOpKind::Concat:
        {
            Node::perform_concatenation(m_Result, p_Node->lhs, p_Node->rhs);
            break;
        }
    }
}

void EvalVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    if (p_Node->value != nullptr)
    {
        p_Node->value->accept(*this);
        p_Node->value = m_Result;
    }

    m_Result = p_Node;

    switch (p_Node->opKind)
    {
        case UnaryOpKind::Negate:
        {
            if (p_Node->value->kind == AstKind::NumberNode)
            {
                const std::shared_ptr<NumberNode>& number = p_Node->value->cast<NumberNode>();
                number->negate();
                m_Result = number;
            }
            break;
        }
        case UnaryOpKind::Not:
        {
            bool result;
            if (Node::convert_to_bool(&result, p_Node->value))
            {
                m_Result = BooleanNode::create(!result);
            }
            break;
        }
        case UnaryOpKind::BitNot:
        {
            if (p_Node->value->kind == AstKind::NumberNode)
            {
                const std::shared_ptr<NumberNode> number = p_Node->value->cast<NumberNode>();
                LL_assert(number->isConvertibleToInt(), "Unary operation `BitNot` cannot be performed on double.");
                number->setInt(~number->toInt());
                m_Result = number;
            }
            break;
        }
        default:
        {
            break;
        }
    }
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
    auto it = p_Node->statements.begin();
    while (it != p_Node->statements.end())
    {
        if (*it != nullptr)
        {
            (*it)->accept(*this);
            if (m_Result == nullptr)
            {
                it = p_Node->statements.erase(it);
                continue;
            }
            *it = m_Result;

            if ((*it)->kind == AstKind::ReturnStatNode ||
                (*it)->kind == AstKind::BreakStat ||
                (*it)->kind == AstKind::ContinueStat
            )
            {
                it++;
                while (it != p_Node->statements.end())
                {
                    it = p_Node->statements.erase(it);
                }
                break;
            }
        }
        it++;
    }

    if (p_Node->statements.empty())
    {
        std::cout << "EMPTY" << std::endl;
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


    // for (const auto& pair : m_Variables)
    // {
    //     if (pair.second.useCount > 0) continue;
    //     // std::cout << Ansi(AnsiColor::Magenta, "EVAL: ") << pair.second << std::endl;
    //
    //
    //     for (const std::shared_ptr<AstNode>& node : pair.second.usages)
    //     {
    //         remove_assignment(node);
    //     }
    // }
}

void EvalVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    if (p_Node->lValues != nullptr)
    {
        p_Node->lValues->accept(*this);
        p_Node->lValues = m_Result;
    }
    if (p_Node->rValues != nullptr)
    {
        p_Node->rValues->accept(*this);
        p_Node->rValues = m_Result;
    }

    if (p_Node->lValues != nullptr && p_Node->rValues != nullptr)
    {
        const std::vector<std::shared_ptr<AstNode>>& variables = Node::get_variable_list(p_Node->lValues);
        const std::vector<std::shared_ptr<AstNode>>& values = p_Node->rValues->cast<ExpressionListNode>()->list;
        const std::size_t min = std::min(variables.size(), values.size());

        for (int i = 0; i < min; i++)
        {
            std::shared_ptr<AstNode> reference = nullptr;
            if (getReference(reference, variables[i]))
            {
                FormatVisitor a;
                reference->accept(a);
                std::string r = a.getResult();
                values[i]->accept(a);
                std::string v = a.getResult();

                // std::cout << "HI: " << variables[i]->getKindName() << " " << r << " = " << v << std::endl;

                switch (values[i]->kind)
                {
                    case AstKind::IdentifierNode:
                    case AstKind::NumberNode:
                    case AstKind::StringNode:
                    case AstKind::BinaryOpNode:
                    // case AstKind::FuncCallNode:
                    // case AstKind::FuncDefNode:
                    case AstKind::IndexNode:
                    case AstKind::MemberNode:
                    case AstKind::NilNode:
                    {
                        static int j = 0;
                        j++;
                        static int s = 7500;

                        if (j == s)
                            std::cout << "(" << j << ") SET_VALUE: "
                                << variables[i]->cast<IdentifierNode>()->getName()
                                << std::endl;
                        if (j >= s)
                        {
                            m_Variables.erase(reference);
                            break;
                        }

                        m_Variables[reference].node = variables[i];
                        m_Variables[reference].value = values[i];
                        m_Variables[reference].currentBlock = variables[i]->getBlock();
                        break;
                    }
                    default:
                    {
                        // std::cout << "REMOVED_2: " << r << " = " << v << std::endl;
                        if (m_Variables[reference].useCount > 0)
                        {
                            m_Variables.erase(reference);
                        }
                        break;
                    }
                }
            }
        }
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
        // p_Node->block->accept(*this);
        // p_Node->block = m_Result;
        Node::merge_blocks(p_Node->block, p_Node->getBlock(), p_Node);
    }
    m_Result = nullptr;
}

void EvalVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    if (p_Node->names != nullptr)
    {
        p_Node->names->accept(*this);
        p_Node->names = m_Result;
    }
    if (p_Node->expressions != nullptr)
    {
        p_Node->expressions->accept(*this);
        p_Node->expressions = m_Result;
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
    auto it = p_Node->blocks.begin();
    while (it != p_Node->blocks.end())
    {
        if (it->first != nullptr)
        {
            it->first->accept(*this);
            it->first = m_Result;

            bool is_true;
            if (Node::convert_to_bool(&is_true, m_Result))
            {
                if (is_true)
                {
                    Node::merge_blocks(it->second, p_Node->getParent(), p_Node);
                    p_Node->blocks.clear();
                    break;
                }
                it = p_Node->blocks.erase(it);
                continue;
            }
        }
        else if (p_Node->blocks.size() == 1)
        {
            Node::merge_blocks(it->second, p_Node->getParent(), p_Node);
            p_Node->blocks.clear();
            break;
        }
        if (it->second != nullptr)
        {
            it->second->accept(*this);
            it->second = m_Result;
        }
        it++;
    }
    m_Result = p_Node->blocks.empty() ? nullptr : p_Node;
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

    bool condition;
    if (Node::convert_to_bool(&condition, m_Result))
    {
        if (condition)
        {
            Node::merge_blocks(p_Node->block, p_Node->getParent(), p_Node);
            m_Result = nullptr;
            return;
        }
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

    bool condition;
    if (Node::convert_to_bool(&condition, m_Result))
    {
        if (!condition)
        {
            m_Result = nullptr;
            return;
        }
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
    if (p_Node->fields != nullptr)
    {
        p_Node->fields->accept(*this);
        p_Node->fields = m_Result;
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

    if (p_Node->root != nullptr && p_Node->args != nullptr && p_Node->root->kind == AstKind::FuncDefNode)
    {
        // FormatVisitor a;
        // p_Node->root->accept(a);
        // if (a.getResult().size() < 3000)
        // {
        //     std::cout << a.getResult() << std::endl;
        // }
    }
    m_Result = p_Node;
}

void EvalVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    if (p_Node->name != nullptr && p_Node->body != nullptr)
    {
        std::shared_ptr<AstNode> reference = nullptr;
        std::cout << "Called " << p_Node->name->cast<IdentifierNode>()->getName() << std::endl;
        // if (getReference(reference, p_Node->name))
        // {
        //     FormatVisitor a;
        //     reference->accept(a);
        //     std::string r = a.getResult();
        //     p_Node->body->accept(a);
        //     std::string v = a.getResult();
        //
        //     std::cout << "HI: " << p_Node->getKindName() << " " << r << " = " << v << std::endl;
        //
        //     // if (m_Variables[reference].useCount > 0)
        //     {
        //         m_Variables.erase(reference);
        //     }
        // }
        // p_Node->name->setReference(nullptr);
    }

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
