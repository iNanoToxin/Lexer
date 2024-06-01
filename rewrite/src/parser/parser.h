#pragma once
#include <memory>
#include <string>
#include <vector>
#include "token_stream.h"
#include "ast/nodes/ast_node.h"

bool is_binary_operator(const Token& p_CurrentToken);
bool is_field_separator(const Token& p_CurrentToken);
bool is_unary_operator(const Token& p_CurrentToken);
bool is_boolean(const Token& p_CurrentToken);
bool is_conditional(const Token& p_CurrentToken);
bool is_null(const Token& p_CurrentToken);
bool is_rhs_associative(const Token& p_Token);


class Parser
{
private:
    std::size_t m_Index = 0;
    std::size_t m_Length = 0;
    std::vector<Token> m_Tokens;

public:
    std::shared_ptr<AstNode> parse(const std::string& p_Source);

    std::shared_ptr<AstNode> getName();
    std::shared_ptr<AstNode> getAttributeName();
    std::shared_ptr<AstNode> getVariable(bool p_IsPrefixExpression = false);

    std::shared_ptr<AstNode> getAttributeList();
    std::shared_ptr<AstNode> getExpressionList();
    std::shared_ptr<AstNode> getNameList(bool p_IsParameterList = false);
    std::shared_ptr<AstNode> getParameterList();
    std::shared_ptr<AstNode> getFieldList();
    std::shared_ptr<AstNode> getArgumentList();
    std::shared_ptr<AstNode> getVariableList();

    std::shared_ptr<AstNode> getTableConstructor();
    std::shared_ptr<AstNode> getField();

    std::shared_ptr<AstNode> getFunctionName();
    std::shared_ptr<AstNode> getFunctionCall();
    std::shared_ptr<AstNode> getFunctionBody();
    std::shared_ptr<AstNode> getFunctionDefinition();

    std::shared_ptr<AstNode> getStatement();
    std::shared_ptr<AstNode> getReturnStatement();

    std::shared_ptr<AstNode> getBlock();
    std::shared_ptr<AstNode> getChunk();

    std::shared_ptr<AstNode> getExpression(int p_Precedence = 0);
    std::shared_ptr<AstNode> getPrefixExpression();
    std::shared_ptr<AstNode> getPrimaryExpression();
    std::shared_ptr<AstNode> getRhsExpression(int p_Precedence, std::shared_ptr<AstNode> p_Lhs);

    void consume(std::string& p_Out, TokenType p_Type);
    Token consume();
    [[nodiscard]] Token peek(std::size_t p_Offset = 0);
    [[nodiscard]] bool next(std::size_t p_Offset = 0) const;
    [[nodiscard]] bool expectPeek(TokenType p_Type, std::size_t p_Offset = 0);
    [[nodiscard]] bool expectPeek(const std::string& p_Match, std::size_t p_Offset = 0);
    [[nodiscard]] std::size_t mark() const;
    void revert(std::size_t p_Marked);
};
