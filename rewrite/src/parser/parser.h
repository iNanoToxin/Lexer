#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include <fstream>
#include <iostream>
#include <memory>
// #include <Util.h>
#include <functional>
#include <utility>
#include <vector>
#include "token_stream.h"
#include "ast/expression_node.h"

#include <fmt/format.h>
#include "ast/visitor/ast_visitor.h"
#include "utilities/assert.h"
#include "utilities/util.h"

bool is_binary_operator(const Token& p_CurrentToken);

bool is_field_separator(const Token& p_CurrentToken);

bool is_unary_operator(const Token& p_CurrentToken);

bool is_boolean(const Token& p_CurrentToken);

bool is_conditional(const Token& p_CurrentToken);

bool is_null(const Token& p_CurrentToken);

bool is_rhs_associative(const Token& p_Token);


class Parser
{
    std::size_t m_Index = 0;
    std::size_t m_Length = 0;
    std::vector<Token> m_Tokens;

public:
    ExpressionNode* getName()
    {
        return expectPeek(TokenType::IDENTIFIER) ? getPrimaryExpression() : nullptr;
    }

    ExpressionNode* getAttributeName()
    {
        ExpressionNode* variable = getName();

        if (variable == nullptr)
        {
            return nullptr;
        }

        if (expectPeek("<"))
        {
            consume();

            ExpressionNode* attribute = getName();
            LL_assert(attribute != nullptr, "Expected attribute after `<`.");
            LL_assert(expectPeek(">"), "Expected `>` after attribute.");
            consume();
            return new AttributeNode(variable, attribute);
        }
        return variable;
    }

    ExpressionNode* getAttributeList()
    {
        std::vector<ExpressionNode*> list;

        if (ExpressionNode* attribute = getAttributeName())
        {
            list.push_back(attribute);
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            consume();

            ExpressionNode* attribute = getAttributeName();
            LL_assert(attribute != nullptr, "Expected attribute variable after `,` in attribute list.");
            list.push_back(attribute);
        }
        return new AttributeListNode(list);
    }

    ExpressionNode* getExpressionList()
    {
        std::vector<ExpressionNode*> list;

        if (ExpressionNode* expression = getExpression())
        {
            list.push_back(expression);
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            consume();

            ExpressionNode* expression = getExpression();
            LL_assert(expression != nullptr, "Expression expected after `,` in expression list.");

            list.push_back(expression);
        }
        return new ExpressionListNode(list);
    }

    ExpressionNode* getReturnStatement()
    {
        if (!expectPeek("return"))
        {
            return nullptr;
        }
        consume();

        ExpressionNode* expression_list = getExpressionList();
        if (expectPeek(";"))
        {
            consume();
        }

        return new ReturnStatNode(expression_list);
    }

    ExpressionNode* getFunctionName()
    {
        ExpressionNode* root = getName();
        if (root == nullptr)
        {
            return nullptr;
        }

        while (expectPeek("."))
        {
            consume();

            ExpressionNode* name = getName();
            LL_assert(name != nullptr, "Expected name after `.` in function name.");

            root = new MemberNode(root, name);
        }

        if (expectPeek(":"))
        {
            consume();

            ExpressionNode* name = getName();
            LL_assert(name != nullptr, "Expected name after `:` in function name.");

            root = new MethodNode(root, name);
        }

        return new FuncNameNode(root);
    }

    ExpressionNode* getNameList(const bool p_IsParameterList = false)
    {
        std::vector<ExpressionNode*> list;

        bool running = false;
        do
        {
            if (running) consume();

            if (p_IsParameterList && expectPeek("..."))
            {
                list.push_back(getPrimaryExpression());
                return new ParameterListNode(list);
            }

            if (ExpressionNode* name = getName())
            {
                list.push_back(name);
            }
            else
            {
                if (running)
                {
                    LL_failure("name != nullptr", "Expected name after `,` in name list.");
                }
                else
                {
                    return nullptr;
                }
            }
            running = true;
        }
        while (expectPeek(","));

        if (p_IsParameterList)
        {
            return new ParameterListNode(list);
        }
        return new NameListNode(list);
    }

    ExpressionNode* getParameterList()
    {
        return getNameList(true);
    }

    ExpressionNode* getField()
    {
        if (expectPeek("["))
        {
            consume();

            ExpressionNode* index = getExpression();
            LL_assert(index != nullptr, "Expected index in table field.");
            LL_assert(expectPeek("]"), "Expected `]` after index.");
            consume();
            LL_assert(expectPeek("="), "Expected `=` after `]` in table field.");
            consume();

            ExpressionNode* value = getExpression();
            LL_assert(value, "Expected value after `=` in table field.");

            return new TableIndexValueNode(index, value);
        }
        if (expectPeek(TokenType::IDENTIFIER) && expectPeek("=", 1))
        {
            ExpressionNode* index = getName();
            LL_assert(expectPeek("="), "`Expected `=` after index in table field.");
            consume();

            ExpressionNode* value = getExpression();
            LL_assert(value, "Expected value after `=` in table field.");

            return new TableNameValueNode(index, value);
        }
        if (ExpressionNode* value = getExpression())
        {
            return new TableValueNode(value);
        }
        return nullptr;
    }

    ExpressionNode* getFieldList()
    {
        std::vector<ExpressionNode*> list;

        while (ExpressionNode* field = getField())
        {
            list.push_back(field);

            if (expectPeek(",") || expectPeek(";"))
            {
                consume();
            }
        }

        if (list.empty())
        {
            return nullptr;
        }
        return new FieldListNode(list);
    }

    ExpressionNode* getArgumentList()
    {
        if (expectPeek("("))
        {
            consume();

            ExpressionNode* argument_list = getExpressionList();
            LL_assert(expectPeek(")"), "Expected `)` after arguments.");
            consume();

            return new ArgumentListNode(argument_list);
        }
        if (expectPeek(TokenType::STRING) || expectPeek(TokenType::STRING_RAW))
        {
            return new ArgumentListNode(getPrimaryExpression());
        }
        if (ExpressionNode* table_constructor = getTableConstructor())
        {
            return new ArgumentListNode(table_constructor);
        }
        return nullptr;
    }

    ExpressionNode* getTableConstructor()
    {
        if (!expectPeek("{"))
        {
            return nullptr;
        }
        consume();

        ExpressionNode* field_list = getFieldList();
        LL_assert(expectPeek("}"), "Expected `}` after field list in table constructor.");
        consume();

        return new TableConstructorNode(field_list);
    }

    ExpressionNode* getVariable(const bool p_IsPrefixExpression = false)
    {
        const std::size_t marked = mark();
        bool is_valid_expression = true;
        ExpressionNode* root = nullptr;

        while (true)
        {
            if (root == nullptr)
            {
                if (ExpressionNode* name = getName())
                {
                    root = name;
                    is_valid_expression = true;
                }
                else if (expectPeek("("))
                {
                    consume();

                    root = getExpression();
                    LL_assert(root != nullptr, "Expected expression after `(`.");
                    LL_assert(expectPeek(")"), "Expected `)` after expression.");
                    consume();
                    is_valid_expression = false;
                }
                else
                {
                    break;
                }
            }
            else if (expectPeek("["))
            {
                consume();

                ExpressionNode* index = getExpression();
                LL_assert(index != nullptr, "Expected expression after `[`.");
                LL_assert(expectPeek("]"), "Expected `]` after expression.");
                consume();
                root = new IndexNode(root, index);
                is_valid_expression = true;
            }
            else if (expectPeek("."))
            {
                consume();

                ExpressionNode* member = getName();
                LL_assert(member != nullptr, "Expected member name after `.`.");
                root = new MemberNode(root, member);
                is_valid_expression = true;
            }
            else if (expectPeek(":"))
            {
                consume();

                ExpressionNode* method = getName();
                LL_assert(method != nullptr, "Expected method name after `:`.");
                root = new MethodNode(root, method);

                ExpressionNode* argument_list = getArgumentList();
                LL_assert(argument_list, "Expected argument list after method name.");
                root = new FuncCallNode(root, argument_list);

                is_valid_expression = false;
            }
            else if (ExpressionNode* argument_list = getArgumentList())
            {
                root = new FuncCallNode(root, argument_list);
                is_valid_expression = false;
            }
            else
            {
                break;
            }
        }

        if (!p_IsPrefixExpression && !is_valid_expression)
        {
            revert(marked);
            return nullptr;
        }
        return root;
    }

    ExpressionNode* getPrefixExpression()
    {
        return getVariable(true);
    }

    ExpressionNode* getFunctionCall()
    {
        const std::size_t marked = mark();
        ExpressionNode* expression = getPrefixExpression();

        if (expression == nullptr || !expression->is(AstKind::FuncCallNode))
        {
            revert(marked);
            return nullptr;
        }
        return expression;
    }

    ExpressionNode* getVariableList()
    {
        ExpressionNode* variable = getVariable();
        if (!variable)
        {
            return nullptr;
        }

        std::vector<ExpressionNode*> list;

        list.push_back(variable);

        while (expectPeek(","))
        {
            consume();

            variable = getVariable();
            LL_assert(variable, "Expression expected in variable list.");
            list.push_back(variable);
        }

        return new VariableListNode(list);
    }

    ExpressionNode* getFunctionBody()
    {
        if (!expectPeek("("))
        {
            return nullptr;
        }
        consume();

        ExpressionNode* parameter_list = getParameterList();

        LL_assert(expectPeek(")"), "Expected `)` after parameter list in `function` body.");
        consume();

        ExpressionNode* block = getBlock();
        LL_assert(expectPeek("end"), "Expected `end` after `function` body.");
        consume();

        return new FuncBodyNode(parameter_list, block);
    }

    ExpressionNode* getFunctionDefinition()
    {
        if (!expectPeek("function"))
        {
            return nullptr;
        }
        consume();

        ExpressionNode* function_body = getFunctionBody();
        LL_assert(function_body != nullptr, "Expected function body in `function` definition.");

        return new FuncDefNode(nullptr, function_body);
    }

    ExpressionNode* getStatement()
    {
        if (expectPeek(";"))
        {
            consume();
            return new SemicolonNode();
        }
        if (expectPeek("break"))
        {
            consume();
            return new BreakStat();
        }
        // For Luau continue
        if (expectPeek("continue"))
        {
            consume();
            return new ContinueStat();
        }
        if (expectPeek("if"))
        {
            consume();
            std::vector<ExpressionPair> list;

            ExpressionNode* condition = getExpression();
            LL_assert(condition != nullptr, "Expected condition in `if` statement.");
            LL_assert(expectPeek("then"), "Expected `then` in `if` statement.");
            consume();

            list.emplace_back(condition, getBlock());

            while (expectPeek("elseif"))
            {
                consume();

                condition = getExpression();
                LL_assert(condition != nullptr, "Expected condition in `elseif` statement.");
                LL_assert(expectPeek("then"), "Expected `then` in `elseif` statement.");
                consume();

                list.emplace_back(condition, getBlock());
            }

            if (expectPeek("else"))
            {
                consume();
                list.emplace_back(nullptr, getBlock());
            }

            LL_assert(expectPeek("end"), "Expected `end` after `if` statement.");
            consume();

            return new IfStatNode(list);
        }
        if (expectPeek("while"))
        {
            consume();

            ExpressionNode* condition = getExpression();
            LL_assert(condition != nullptr, "Expected condition in `while` statement.");
            LL_assert(expectPeek("do"), "Expected `do` in `while` statement.");
            consume();

            ExpressionNode* block = getBlock();
            LL_assert(expectPeek("end"), "Expected `end` after `while` statement.");
            consume();

            return new WhileStatNode(condition, block);
        }
        if (expectPeek("repeat"))
        {
            consume();

            ExpressionNode* block = getBlock();
            LL_assert(expectPeek("until"), "Expected `until` in `repeat` statement.");
            consume();

            ExpressionNode* condition = getExpression();
            LL_assert(condition, "Expected condition in `repeat` statement.");

            return new RepeatStatNode(block, condition);
        }
        if (expectPeek("do"))
        {
            consume();

            ExpressionNode* block = getBlock();
            LL_assert(expectPeek("end"), "Expected `end` after `do` statement.");
            consume();

            return new DoStatNode(block);
        }
        if (expectPeek("local"))
        {
            consume();

            if (expectPeek("function"))
            {
                consume();

                ExpressionNode* name = getName();
                LL_assert(name != nullptr, "Expected name in `local` function.");

                ExpressionNode* body = getFunctionBody();
                LL_assert(body != nullptr, "Expected function body in `local` function.");

                return new LocalStatNode(new FuncDefNode(name, body));
            }
            else
            {
                ExpressionNode* variable_list = getAttributeList();
                LL_assert(variable_list != nullptr, "Expected attribute name list in `local` statement.");

                if (expectPeek("="))
                {
                    consume();

                    ExpressionNode* expression_list = getExpressionList();
                    LL_assert(expression_list != nullptr, "Expected expression list in `local` statement.");

                    return new LocalStatNode(new AssignmentStatNode(variable_list, expression_list));
                }
                return new LocalStatNode(variable_list);
            }
        }
        if (expectPeek("function"))
        {
            consume();

            ExpressionNode* name = getFunctionName();
            LL_assert(name != nullptr, "expected name in function");

            ExpressionNode* body = getFunctionBody();
            LL_assert(body, "expected function body in function");

            return new FuncDefNode(name, body);
        }
        if (expectPeek("for"))
        {
            consume();

            if (expectPeek("=", 1))
            {
                ExpressionNode* name = getName();
                LL_assert(name != nullptr, "Expected name in numeric `for` statement.");
                LL_assert(expectPeek("="), "Expected `=` in numeric `for` statement.");
                consume();

                ExpressionNode* init = getExpression();
                LL_assert(init != nullptr, "Expected expression in numeric `for` statement.");
                LL_assert(expectPeek(","), "expected `,` in numeric `for` statement.");
                consume();

                ExpressionNode* goal = getExpression();
                LL_assert(goal != nullptr, "Expected expression in numeric `for` statement.");

                ExpressionNode* step = nullptr;
                if (expectPeek(","))
                {
                    consume();

                    step = getExpression();
                    LL_assert(step != nullptr, "Expected expression in numeric `for` statement.");
                }
                LL_assert(expectPeek("do"), "Expected `do` in numeric `for` statement.");
                consume();

                ExpressionNode* block = getBlock();
                LL_assert(expectPeek("end"), "Expected `do` in numeric `for` statement.");
                consume();

                return new NumericForStatNode(name, init, goal, step, block);
            }
            else
            {
                ExpressionNode* name_list = getNameList();
                LL_assert(name_list != nullptr, "Expected name list in generic `for` statement.");
                LL_assert(expectPeek("in"), "Expected `in` after name list in generic `for` statement.");
                consume();

                ExpressionNode* expression_list = getExpressionList();
                LL_assert(expression_list != nullptr, "Expected expression list in generic `for` statement.");
                LL_assert(expectPeek("do"), "Expected `do` in generic `for` statement.");
                consume();

                ExpressionNode* block = getBlock();
                LL_assert(expectPeek("end"), "Expected `end` after generic `for` statement.");
                consume();

                return new GenericForStatNode(name_list, expression_list, block);
            }
        }
        if (expectPeek("goto"))
        {
            consume();

            ExpressionNode* label = getName();
            LL_assert(label != nullptr, "Expected label in `goto` statement.");

            return new GotoStatNode(label);
        }
        if (expectPeek("::"))
        {
            consume();

            ExpressionNode* label = getName();
            LL_assert(label != nullptr, "Expected label in `label` statement.");
            LL_assert(expectPeek("::"), "expected `::` after label in `label` statement.");
            consume();

            return new LabelNode(label);
        }

        if (ExpressionNode* variable_list = getVariableList())
        {
            LL_assert(expectPeek("="), "Expected `=` in assignment statement.");
            consume();

            ExpressionNode* expression_list = getExpressionList();
            LL_assert(expression_list != nullptr, "Expected expression list in assignment statement.");

            return new AssignmentStatNode(variable_list, expression_list);
        }
        if (ExpressionNode* function_call = getFunctionCall())
        {
            return function_call;
        }

        return nullptr;
    }

    ExpressionNode* getBlock()
    {
        std::vector<ExpressionNode*> list;

        while (ExpressionNode* stat = getStatement())
        {
            list.push_back(stat);
        }

        if (ExpressionNode* stat = getReturnStatement())
        {
            list.push_back(stat);
        }

        return list.empty() ? nullptr : new BlockNode(list);
    }

    ExpressionNode* getChunk()
    {
        return new ChunkNode(getBlock());
    }


    ExpressionNode* parse(const std::string& p_Source)
    {
        TokenStream stream;
        stream.tokenize(p_Source);
        m_Tokens = stream.getTokens();
        m_Length = m_Tokens.size();

        // #define PRINT_TOKENS

        #ifdef PRINT_TOKENS
        {
            std::clog << "VIEW TOKENS: " << stream.getTokens().size() << "\n";

            std::size_t max_length = 0;
            for (Token& Token: stream.getTokens())
            {
                if (Token.literal.size() <= 15)
                {
                    max_length = std::max(max_length, Token.literal.size());
                }
            }

            for (Token& Token: stream.getTokens())
            {
                std::string type;

                switch (Token.type)
                {
                    case TokenType::IDENTIFIER:
                    {
                        type = "IDENTIFIER";
                        break;
                    }
                    case TokenType::STRING_RAW:
                    {
                        type = "STRING_RAW";
                        break;
                    }
                    case TokenType::STRING:
                    {
                        type = "STRING";
                        break;
                    }
                    case TokenType::COMMENT_RAW:
                    {
                        type = "COMMENT_RAW";
                        break;
                    }
                    case TokenType::COMMENT:
                    {
                        type = "COMMENT";
                        break;
                    }
                    case TokenType::NUMBER_HEXADECIMAL:
                    {
                        type = "NUMBER_HEXADECIMAL";
                        break;
                    }
                    case TokenType::NUMBER_BINARY:
                    {
                        type = "NUMBER_BINARY";
                        break;
                    }
                    case TokenType::NUMBER:
                    {
                        type = "NUMBER";
                        break;
                    }
                    case TokenType::KEYWORD:
                    {
                        type = "KEYWORD";
                        break;
                    }
                    case TokenType::PUNCTUATION:
                    {
                        type = "PUNCTUATION";
                        break;
                    }
                }

                // if (!(Token.type == TokenType::STRING)) {
                //     continue;
                // }

                if (Token.literal.size() <= 15)
                {
                    std::cout << Token.literal << std::string(max_length - Token.literal.size(), ' ') << " -> " << (type) << "\n";
                }
                else
                {
                    std::cout << Token.literal << " -> " << (type) << "\n";
                }
            }

            std::cout << "\n";
        }
        #endif

        return getChunk();
    }



    ExpressionNode* getPrimaryExpression()
    {
        if (!next())
        {
            return nullptr;
        }

        const Token current_token = peek();

        switch (current_token.type)
        {
            case TokenType::IDENTIFIER:
            {
                return new IdentifierNode(consume().literal);
            }
            case TokenType::STRING_RAW:
            case TokenType::STRING:
            {
                return new StringNode(consume().literal);
            }

            case TokenType::COMMENT_RAW:
            case TokenType::COMMENT:
            {
                break;
            }

            case TokenType::NUMBER_HEXADECIMAL:
            case TokenType::NUMBER_BINARY:
            case TokenType::NUMBER:
            {
                // std::optional<double> value = Util::to_number(consume().literal);
                // return new NumberNode(*value);
                consume();
                return new NumberNode(5.0);
            }

            case TokenType::KEYWORD:
            {
                if (is_boolean(current_token))
                {
                    return new BooleanNode(consume().literal == "true");
                }
                if (is_unary_operator(current_token))
                {
                    consume();
                    ExpressionNode* expression = getExpression(Util::get_precedence(true));
                    LL_assert(expression != nullptr, fmt::format("Expected expression after `{}`.", current_token.literal));

                    return new UnaryOpNode(current_token.literal, expression);
                }
                if (is_null(current_token))
                {
                    consume();
                    return new NilNode();
                }
                break;
            }
            case TokenType::PUNCTUATION:
            {
                if (current_token.is("..."))
                {
                    consume();
                    return new VarargsNode();
                }
                if (current_token.is("("))
                {
                    consume();

                    ExpressionNode* expression = getExpression();
                    LL_assert(expression != nullptr, "Expected expression.");
                    LL_assert(expectPeek(")"), "Expected `)` after `(`.");
                    consume();
                    return expression;
                }
                if (current_token.is("{"))
                {
                    return getTableConstructor();
                }
                if (is_unary_operator(current_token))
                {
                    consume();
                    ExpressionNode* expression = getExpression(Util::get_precedence(true));
                    LL_assert(expression != nullptr, fmt::format("Expected expression after `{}`.", current_token.literal));

                    if (current_token.is("-"))
                    {
                        return new UnaryOpNode("-", expression);
                    }
                    if (current_token.is("~"))
                    {
                        return new UnaryOpNode("~", expression);
                    }
                    if (current_token.is("#"))
                    {
                        return new UnaryOpNode("#", expression);
                    }
                }
                break;
            }
        }
        return nullptr;
    }

    ExpressionNode* getExpression(const int p_Precedence = 0)
    {
        if (ExpressionNode* function_definition = getFunctionDefinition())
        {
            return getRhsExpression(p_Precedence, function_definition);
        }
        if (ExpressionNode* prefix_expression = getPrefixExpression())
        {
            return getRhsExpression(p_Precedence, prefix_expression);
        }
        if (ExpressionNode* primary_expression = getPrimaryExpression())
        {
            return getRhsExpression(p_Precedence, primary_expression);
        }
        return nullptr;
    }

    ExpressionNode* getRhsExpression(const int p_Precedence, ExpressionNode* p_Lhs)
    {
        while (next())
        {
            Token current_token = peek();
            const int current_precedence = Util::get_precedence(current_token.literal);

            if (current_precedence < p_Precedence)
            {
                return p_Lhs;
            }

            consume();

            ExpressionNode* rhs = getFunctionDefinition();
            if (rhs == nullptr)
            {
                rhs = getPrefixExpression();
            }
            if (rhs == nullptr)
            {
                rhs = getPrimaryExpression();
                // if (rhs->is(AstKind::CommentNode))
                // {
                //     rhs = getPrimaryExpression();
                // }
            }
            LL_assert(rhs != nullptr, "Expected right hand side expression.");

            if (expectPeek(TokenType::PUNCTUATION))
            {
                if (is_rhs_associative(current_token))
                {
                    rhs = getRhsExpression(current_precedence, rhs);
                    LL_assert(rhs != nullptr, "Expected right hand side expression.");
                }
                else if (current_precedence < Util::get_precedence(peek().literal))
                {
                    rhs = getRhsExpression(current_precedence + 1, rhs);
                    LL_assert(rhs != nullptr, "Expected right hand side expression.");
                }
            }

            if (is_binary_operator(current_token))
            {
                p_Lhs = new BinaryOpNode(p_Lhs, current_token.literal, rhs);
            }
        }
        return p_Lhs;
    }

    void consume(std::string& p_Out, TokenType p_Type);
    Token consume();
    [[nodiscard]] Token peek(std::size_t p_Offset = 0);
    [[nodiscard]] bool next(std::size_t p_Offset = 0) const;
    [[nodiscard]] bool expectPeek(TokenType p_Type, std::size_t p_Offset = 0);
    [[nodiscard]] bool expectPeek(const std::string& p_Match, std::size_t p_Offset = 0);
    [[nodiscard]] std::size_t mark() const;
    void revert(std::size_t p_Marked);
};


#endif //LUA_PARSER_H
