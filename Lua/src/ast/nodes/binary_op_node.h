#pragma once
#include <string>
#include "ast_node.h"

enum class BinaryOpKind
{
    Or,
    And,
    LessThan,
    GreaterThan,
    LessEqual,
    GreaterEqual,
    NotEqual,
    Equal,
    BitOr,
    BitExOr,
    BitAnd,
    LeftShift,
    RightShift,
    Concat,
    Plus,
    Minus,
    Multiply,
    FloatDivision,
    FloorDivision,
    Modulus,
    Power
};

class BinaryOpNode final : public AstNode
{
public:
    static constexpr AstKind ClassKind = AstKind::BinaryOpNode;

public:
    BinaryOpKind opKind{};
    std::shared_ptr<AstNode> lhs;
    std::string op;
    std::shared_ptr<AstNode> rhs;

    explicit BinaryOpNode() : AstNode(AstKind::BinaryOpNode) {}

    static std::shared_ptr<BinaryOpNode> create(const std::shared_ptr<AstNode>& p_Lhs, const std::string& p_Operator, const std::shared_ptr<AstNode>& p_Rhs);
    void accept(AstVisitor& p_Visitor) override;
};
