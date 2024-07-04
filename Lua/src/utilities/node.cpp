#include "node.h"
#include <sstream>
#include "./assert.h"
#include "./math.h"

bool Node::perform_binary_op(
    std::shared_ptr<AstNode>& p_Result,
    const std::shared_ptr<AstNode>& p_Lhs,
    double (*p_Operation)(double, double),
    const std::shared_ptr<AstNode>& p_Rhs,
    const bool p_ForceDouble
)
{
    LuaDouble x, y;

    if (p_Lhs->kind == AstKind::NumberNode)
    {
        x = p_Lhs->cast<NumberNode>()->toDouble();
    }
    else if (p_Lhs->kind == AstKind::StringNode)
    {
        if (!Math::string_to_double(&x, p_Lhs->cast<StringNode>()->getContent()))
        {
            return false;
        }
    }
    else
    {
        return false;
    }

    if (p_Rhs->kind == AstKind::NumberNode)
    {
        y = p_Rhs->cast<NumberNode>()->toDouble();
    }
    else if (p_Rhs->kind == AstKind::StringNode)
    {
        if (!Math::string_to_double(&y, p_Rhs->cast<StringNode>()->getContent()))
        {
            return false;
        }
    }
    else
    {
        return false;
    }

    const std::shared_ptr<NumberNode>& result = NumberNode::create(p_Operation(x, y));

    if (!p_ForceDouble && result->isConvertibleToInt())
    {
        result->setInt(result->toInt());
    }
    p_Result = result;
    return true;
}

bool Node::perform_comparison(
    std::shared_ptr<AstNode>& p_Result,
    const std::shared_ptr<AstNode>& p_Lhs,
    bool (*p_Operation)(double, double),
    const std::shared_ptr<AstNode>& p_Rhs
)
{
    // if (p_Lhs->kind == AstKind::StringNode && p_Rhs->kind == AstKind::StringNode)
    // {
    //     const std::shared_ptr<StringNode>& lhs = p_Lhs->cast<StringNode>();
    //     const std::shared_ptr<StringNode>& rhs = p_Rhs->cast<StringNode>();
    //
    //     p_Result = BooleanNode::create(p_Operation(lhs->getContent().compare(rhs.getContent()), 0));
    //     return true;
    // }

    if (p_Lhs->kind == AstKind::NumberNode && p_Rhs->kind == AstKind::NumberNode)
    {
        const std::shared_ptr<NumberNode>& lhs = p_Lhs->cast<NumberNode>();
        const std::shared_ptr<NumberNode>& rhs = p_Rhs->cast<NumberNode>();

        p_Result = BooleanNode::create(p_Operation(lhs->toDouble(), rhs->toDouble()));
        return true;
    }
    if (p_Lhs->kind == AstKind::BooleanNode && p_Rhs->kind == AstKind::BooleanNode)
    {
        const std::shared_ptr<BooleanNode>& lhs = p_Lhs->cast<BooleanNode>();
        const std::shared_ptr<BooleanNode>& rhs = p_Rhs->cast<BooleanNode>();

        p_Result = BooleanNode::create(p_Operation(lhs->value, rhs->value));
        return true;
    }

    if (p_Operation == EqualityOp::equal || p_Operation == EqualityOp::not_equal)
    {
        if (is_allowed_comparison(p_Lhs) && is_allowed_comparison(p_Rhs))
        {
            if (p_Lhs->kind != p_Rhs->kind)
            {
                p_Result = BooleanNode::create(p_Operation != EqualityOp::equal);
                return true;
            }
            else if (p_Lhs->kind == AstKind::NilNode && p_Rhs->kind == AstKind::NilNode)
            {
                p_Result = BooleanNode::create(p_Operation == EqualityOp::equal);
                return true;
            }
        }
    }
    return false;
}

bool Node::perform_concatenation(
    std::shared_ptr<AstNode>& p_Result,
    const std::shared_ptr<AstNode>& p_Lhs,
    const std::shared_ptr<AstNode>& p_Rhs
)
{
    if (p_Lhs->kind == AstKind::StringNode && p_Rhs->kind == AstKind::StringNode)
    {
        const std::shared_ptr<StringNode>& lhs = p_Lhs->cast<StringNode>();
        const std::shared_ptr<StringNode>& rhs = p_Rhs->cast<StringNode>();
        std::stringstream stream;
        stream << '"';
        stream << lhs->getContent();
        stream << rhs->getContent();
        stream << '"';

        p_Result = StringNode::create(stream.str());
    }
    return true;
}

bool Node::is_allowed_comparison(const std::shared_ptr<AstNode>& p_Node)
{
    switch (p_Node->kind)
    {
        case AstKind::FuncDefNode:
        case AstKind::TableConstructorNode:
        case AstKind::StringNode:
        case AstKind::NumberNode:
        case AstKind::BooleanNode:
        case AstKind::NilNode:
        {
            return true;
        }
        default:
        {
            return false;
        }
    }
}

bool Node::convert_to_bool(bool* p_Bool, const std::shared_ptr<AstNode>& p_Node)
{
    switch (p_Node->kind)
    {
        case AstKind::BooleanNode:
        {
            *p_Bool = p_Node->cast<BooleanNode>()->value;
            return true;
        }
        case AstKind::FuncDefNode:
        case AstKind::TableConstructorNode:
        case AstKind::StringNode:
        case AstKind::NumberNode:
        {
            *p_Bool = true;
            return true;
        }
        case AstKind::NilNode:
        {
            *p_Bool = false;
            return true;
        }
        default:
        {
            return false;
        }
    }
}

bool Node::is_in_scope(const std::shared_ptr<AstNode>& p_NodeA, const std::shared_ptr<AstNode>& p_NodeB) {
    int depth_1, depth_2;
    const std::shared_ptr<BlockNode>& block_a = p_NodeA->getBlock(&depth_1);
    const std::shared_ptr<BlockNode>& block_b = p_NodeB->getBlock(&depth_2);
    if (depth_1 < depth_2)
    {
        return false;
    }

    std::shared_ptr<AstNode> current = p_NodeA;

    while (current != nullptr && current != block_b)
    {
        if (current->kind == AstKind::ChunkNode)
        {
            return false;
        }
        current = current->getParent();
    }
    return true;
}

void Node::print_path(const std::shared_ptr<AstNode>& p_Node) {
    std::vector<std::string> arr;
    std::string str;
    std::shared_ptr<AstNode> curr = p_Node;

    while (curr != nullptr && curr->kind != AstKind::BlockNode)
    {
        arr.push_back(curr->getKindName());
        curr = curr->getParent();
    }
    std::ranges::reverse(arr);

    for (int i = 0; i < arr.size(); i++)
    {
        str += std::string(std::max(i * 2 - 1, 0), '-');
        str += std::string(i > 0, '>');
        str += arr[i];
        str += "\n";
    }

    std::cout << str << std::endl;
}

void Node::merge_blocks(
    const std::shared_ptr<AstNode>& p_BlockA,
    const std::shared_ptr<AstNode>& p_BlockB,
    const std::shared_ptr<AstNode>& p_Node
)
{
    if (p_BlockA == nullptr) return;
    if (p_BlockB == nullptr) return;
    if (p_Node == nullptr) return;

    const std::shared_ptr<BlockNode>& block_a = p_BlockA->cast<BlockNode>();
    const std::shared_ptr<BlockNode>& block_b = p_BlockB->cast<BlockNode>();

    auto index = block_b->statements.begin();
    while (*index != p_Node)
    {
        index++;
    }
    index++;

    for (const std::shared_ptr<AstNode>& statement : block_a->statements)
    {
        statement->setParent(block_b);
        block_b->statements.insert(index, statement);
    }
    block_a->statements.clear();
}

std::vector<std::shared_ptr<AstNode>> Node::get_variable_list(const std::shared_ptr<AstNode>& p_Node)
{
    LL_assert(p_Node->kind == AstKind::VariableListNode || p_Node->kind == AstKind::AttributeListNode, "Expected variable list.");

    if (p_Node->kind == AstKind::AttributeListNode)
    {
        std::vector<std::shared_ptr<AstNode>> list;
        for (const std::shared_ptr<AstNode>& attribute_node : p_Node->cast<AttributeListNode>()->list)
        {
            if (attribute_node->kind == AstKind::AttributeNode)
            {
                list.push_back(attribute_node->cast<AttributeNode>()->value);
            }
            else
            {
                list.push_back(attribute_node);
            }
        }
        return list;
    }
    return p_Node->cast<VariableListNode>()->list;
}

bool Node::remove_assignment(const std::shared_ptr<AstNode>& p_Node)
{
    const std::shared_ptr<AssignmentStatNode>& assignment = p_Node->getAncestor<AssignmentStatNode>();

    if (assignment != nullptr && p_Node->getAncestor<ExpressionListNode>() == nullptr)
    {
        assignment->remove(p_Node);
    }
    return false;
}
