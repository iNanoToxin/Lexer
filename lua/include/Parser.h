#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include <Tokenizer.h>
#include <Util.h>
#include <fstream>
#include <iostream>
#include <memory>
#include <tuple>
#include <utility>
#include <vector>

#include <Node.h>


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

    NodePointer getName()
    {
        return expectPeek(TokenType::IDENTIFIER) ? getPrimaryExpression() : nullptr;
    }

    NodePointer getAttributeName()
    {
        auto name = getName();

        if (!name)
        {
            return nullptr;
        }

        if (expectPeek("<"))
        {
            consume();

            auto attribute_type = getName();
            assert(attribute_type, "expected attribute type");
            assert(expectPeek(">"), "expected > after < in attrib");
            consume();

            auto attribute = Node::create(Kind::Attribute);
            attribute->setChildren({name, attribute_type});
            return attribute;
        }
        return name;
    }

    NodePointer getAttributeList()
    {
        auto attribute_list = Node::create(Kind::AttributeList);
        NodeArray list;

        if (auto attribute = getAttributeName())
        {
            attribute->setParent(attribute_list);
            list.push_back(attribute);
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            consume();

            auto attribute = getAttributeName();
            assert(attribute, "expected attribute variable");

            attribute->setParent(attribute_list);
            list.push_back(attribute);
        }

        attribute_list->setChildren({list});
        return attribute_list;
    }

    NodePointer getExpressionList()
    {
        auto expression_list = Node::create(Kind::ExpressionList);
        NodeArray list;

        if (auto expression = getExpression())
        {
            expression->setParent(expression_list);
            list.push_back(expression);
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            consume();

            auto expression = getExpression();
            assert(expression, "expression expected");

            expression->setParent(expression_list);
            list.push_back(expression);
        }

        expression_list->setChildren({list});
        return expression_list;
    }

    NodePointer getReturnStatement()
    {
        if (!expectPeek("return"))
        {
            return nullptr;
        }
        consume();


        auto expression_list = getExpressionList();

        if (expectPeek(";"))
        {
            consume();
        }

        auto return_statement = Node::create(Kind::ReturnStatement);
        return_statement->setChildren({expression_list});
        return return_statement;
    }

    NodePointer getFunctionName()
    {
        auto function_name = Node::create(Kind::FunctionName);

        NodePointer root = getName();
        if (!root)
        {
            return nullptr;
        }

        while (expectPeek("."))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for function");

            auto member_expression = Node::create(Kind::Member);

            member_expression->setChildren({root, name});
            root = member_expression;
        }

        if (expectPeek(":"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for method");

            auto method_expression = Node::create(Kind::Method);
            method_expression->setChildren({root, name});
            root = method_expression;
        }

        function_name->setChildren({root});
        return function_name;
    }

    NodePointer getNameList(bool p_IsParameterList = false)
    {
        auto name_list = Node::create();
        NodeArray list;

        if (auto name = getName())
        {
            name->setParent(name_list);
            list.push_back(name);
        }
        else if (p_IsParameterList && expectPeek("..."))
        {
            auto varargs = getPrimaryExpression();
            varargs->setParent(name_list);
            list.push_back(varargs);

            name_list->setKind(Kind::ParameterList);
            name_list->setChildren({list});
            return name_list;
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            consume();

            if (p_IsParameterList && expectPeek("..."))
            {
                auto varargs = getPrimaryExpression();
                varargs->setParent(name_list);
                list.push_back(varargs);
                break;
            }

            auto name = getName();
            assert(name, "expected name");
            name->setParent(name_list);
            list.push_back(name);
        }

        name_list->setKind(p_IsParameterList ? Kind::ParameterList : Kind::NameList);
        name_list->setChildren({list});
        return name_list;
    }

    NodePointer getParameterList()
    {
        return getNameList(true);
    }

    NodePointer getField()
    {
        if (expectPeek("["))
        {
            consume();

            auto table_index_value_expression = Node::create(Kind::TableIndexValue);

            auto expression = getExpression();
            assert(expression, "expected index in field");

            assert(expectPeek("]"), "expected ] after [ in field");
            consume();
            assert(expectPeek("="), "expected = after ] in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");


            table_index_value_expression->setChildren({expression, value});
            return table_index_value_expression;
        }
        else if (expectPeek(TokenType::IDENTIFIER) && expectPeek("=", 1))
        {
            auto name = getName();

            assert(expectPeek("="), "expected = after name in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");

            auto table_name_value_expression = Node::create(Kind::TableNameValue);
            table_name_value_expression->setChildren({name, value});
            return table_name_value_expression;
        }
        else if (auto expression = getExpression())
        {
            auto table_value_expression = Node::create(Kind::TableValue);
            table_value_expression->setChildren({expression});
            return table_value_expression;
        }
        return nullptr;
    }

    NodePointer getFieldList()
    {
        auto field_list = Node::create(Kind::FieldList);

        NodeArray list;

        while (auto field = getField())
        {
            field->setParent(field_list);
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

        field_list->setChildren({list});
        return field_list;
    }

    NodePointer getArgumentList()
    {
        if (expectPeek("("))
        {
            consume();
            auto expression_list = getExpressionList();

            assert(expectPeek(")"), "expected ) after ( in args");
            consume();

            auto argument_list = Node::create(Kind::ArgumentList);
            argument_list->setChildren({expression_list});
            return argument_list;
        }
        else if (expectPeek(TokenType::STRING) || expectPeek(TokenType::STRING_RAW))
        {
            auto expression = getPrimaryExpression();

            auto argument_list = Node::create(Kind::ArgumentList);
            argument_list->setChildren({expression});
            return argument_list;
        }
        else if (auto table_constructor = getTableConstructor())
        {
            auto argument_list = Node::create(Kind::ArgumentList);
            argument_list->setChildren({table_constructor});
            return argument_list;
        }
        return nullptr;
    }

    NodePointer getTableConstructor()
    {
        if (!expectPeek("{"))
        {
            return nullptr;
        }
        consume();

        auto field_list = getFieldList();

        assert(expectPeek("}"), "expected } after { in table constructor");
        consume();

        auto table_constructor_expression = Node::create(Kind::TableConstructor);
        table_constructor_expression->setChildren({field_list});
        return table_constructor_expression;
    }

    NodePointer getVariable(bool p_IsPrefixExpression = false)
    {
        NodePointer root = nullptr;
        bool is_valid_expression = true;
        auto marked = mark();

        while (true)
        {
            if (!root)
            {
                if (auto name = getName())
                {
                    root = name;
                    is_valid_expression = true;
                }
                else if (expectPeek("("))
                {
                    consume();

                    root = getExpression();
                    assert(root, "expected expression in var");

                    assert(expectPeek(")"), "expected ) after ( in var");
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

                auto expression = getExpression();
                assert(expression, "expected expression in var");

                assert(expectPeek("]"), "expected ] after [ in var");
                consume();

                auto index_expression = Node::create(Kind::Index);
                index_expression->setChildren({root, expression});
                root = index_expression;

                is_valid_expression = true;
            }
            else if (expectPeek("."))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in var");

                auto member_expression = Node::create(Kind::Member);
                member_expression->setChildren({root, name});
                root = member_expression;

                is_valid_expression = true;
            }
            else if (expectPeek(":"))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in var");

                auto method_expression = Node::create(Kind::Method);
                method_expression->setChildren({root, name});
                root = method_expression;

                auto argument_list = getArgumentList();
                assert(argument_list, "expected argumentList in var");

                auto function_call = Node::create(Kind::FunctionCall);
                function_call->setChildren({root, argument_list});
                root = function_call;

                is_valid_expression = false;
            }
            else if (auto args = getArgumentList())
            {
                auto function_call = Node::create(Kind::FunctionCall);
                function_call->setChildren({root, args});
                root = function_call;

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

    NodePointer getPrefixExpression()
    {
        return getVariable(true);
    }

    NodePointer getFunctionCall()
    {
        auto marked = mark();
        auto expression = getPrefixExpression();

        if (!(expression && expression->getKind() == Kind::FunctionCall))
        {
            revert(marked);
            return nullptr;
        }
        return expression;
    }

    NodePointer getVariableList()
    {
        auto variable = getVariable();
        if (!variable)
        {
            return nullptr;
        }

        NodeArray list;
        auto variable_list = Node::create(Kind::VariableList);

        variable->setParent(variable_list);
        list.push_back(variable);

        while (expectPeek(","))
        {
            consume();

            variable = getVariable();
            assert(variable, "expression expected in variable list");

            variable->setParent(variable_list);
            list.push_back(variable);
        }

        variable_list->setChildren({list});
        return variable_list;
    }

    NodePointer getFunctionBody()
    {
        if (!expectPeek("("))
        {
            return nullptr;
        }
        consume();

        auto parameter_list = getParameterList();

        assert(expectPeek(")"), "expected ) after ( in function body");
        consume();

        auto block = getBlock();

        assert(expectPeek("end"), "expected end in function body");
        consume();

        auto function_body = Node::create(Kind::FunctionBody);
        function_body->setChildren({parameter_list, block});
        return function_body;
    }

    NodePointer getFunctionDefinition()
    {
        if (!expectPeek("function"))
        {
            return nullptr;
        }
        consume();

        auto function_body = getFunctionBody();
        assert(function_body, "expected function body in function definition");

        auto function_definition = Node::create(Kind::FunctionDefinition);
        function_definition->setChildren({NodePointer{nullptr}, function_body});
        return function_definition;
    }

    NodePointer getStatement()
    {
        if (expectPeek(";"))
        {
            consume();
            auto semicolon = Node::create(Kind::Semicolon);
            return semicolon;
        }
        else if (expectPeek("break"))
        {
            consume();
            auto break_statement = Node::create(Kind::BreakStatement);
            return break_statement;
        }
        // For Luau continue
        else if (expectPeek("continue"))
        {
            consume();
            auto continue_statement = Node::create(Kind::BreakStatement);
            return continue_statement;
        }
        else if (expectPeek("if"))
        {
            consume();
            NodeArray list;

            auto if_statement = Node::create(Kind::IfStatement);

            auto expression = getExpression();
            assert(expression, "expected expression in if stat");

            assert(expectPeek("then"), "expected then in if stat");
            consume();

            auto block = getBlock();


            auto conditional_block = Node::create(Kind::ConditionalBlock);
            conditional_block->setChildren({expression, block});
            list.push_back(conditional_block);

            while (expectPeek("elseif"))
            {
                consume();

                expression = getExpression();
                assert(expression, "expected expression in elseif stat");

                assert(expectPeek("then"), "expected then in elseif stat");
                consume();

                block = getBlock();

                conditional_block = Node::create(Kind::ConditionalBlock);
                conditional_block->setChildren({expression, block});
                conditional_block->setParent(if_statement);
                list.push_back(conditional_block);
            }

            if (expectPeek("else"))
            {
                consume();

                block = getBlock();

                conditional_block = Node::create(Kind::ConditionalBlock);
                conditional_block->setChildren({NodePointer{nullptr}, block});
                conditional_block->setParent(if_statement);
                list.push_back(conditional_block);
            }

            assert(expectPeek("end"), "expected end after if stat");
            consume();

            if_statement->setChildren({list});
            return if_statement;
        }
        else if (expectPeek("while"))
        {
            consume();

            auto expression = getExpression();
            assert(expression, "expected expression in while stat");

            assert(expectPeek("do"), "expected do in while stat");
            consume();

            auto block = getBlock();

            assert(expectPeek("end"), "expected end in while stat");
            consume();

            auto conditional_block = Node::create(Kind::ConditionalBlock);
            conditional_block->setChildren({expression, block});

            auto while_statement = Node::create(Kind::WhileStatement);
            while_statement->setChildren({conditional_block});
            return while_statement;
        }
        else if (expectPeek("repeat"))
        {
            consume();

            auto block = getBlock();

            assert(expectPeek("until"), "expected until in repeat stat");
            consume();

            auto expression = getExpression();
            assert(expression, "expected expression in repeat stat");

            auto conditional_block = Node::create(Kind::ConditionalBlock);
            conditional_block->setChildren({expression, block});

            auto repeat_statement = Node::create(Kind::RepeatStatement);
            repeat_statement->setChildren({conditional_block});
            return repeat_statement;
        }
        else if (expectPeek("do"))
        {
            consume();

            auto block = getBlock();

            assert(expectPeek("end"), "expected end in do statement");
            consume();

            auto do_statement = Node::create(Kind::DoStatement);
            do_statement->setChildren({block});
            return do_statement;
        }
        else if (expectPeek("local"))
        {
            consume();

            if (expectPeek("function"))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in local function");

                auto body = getFunctionBody();
                assert(body, "expected function body in local function");

                auto function_definition = Node::create(Kind::FunctionDefinition);
                function_definition->setChildren({name, body});

                auto local_statement = Node::create(Kind::LocalStatement);
                local_statement->setChildren({function_definition});
                return local_statement;
            }
            else
            {
                auto local_statement = Node::create(Kind::LocalStatement);

                auto attribute_name_list = getAttributeList();
                assert(attribute_name_list, "expected attribute name list in local stat");

                if (expectPeek("="))
                {
                    consume();

                    auto expression_list = getExpressionList();
                    assert(expression_list, "expected expression list in local stat");

                    auto assignment_statement = Node::create(Kind::AssignmentStatement);
                    assignment_statement->setChildren({attribute_name_list, expression_list});

                    local_statement->setChildren({assignment_statement});
                }
                else
                {
                    local_statement->setChildren({attribute_name_list});
                }
                return local_statement;
            }
        }
        else if (expectPeek("function"))
        {
            consume();

            auto name = getFunctionName();
            assert(name, "expected name in function");

            auto body = getFunctionBody();
            assert(body, "expected function body in function");

            auto function_definition = Node::create(Kind::FunctionDefinition);
            function_definition->setChildren({name, body});
            return function_definition;
        }
        else if (expectPeek("for"))
        {
            consume();

            if (expectPeek("=", 1))
            {
                auto name = getName();
                assert(name, "expected name in numeric for stat");

                assert(expectPeek("="), "expected = in numeric for stat");
                consume();

                auto init = getExpression();
                assert(init, "expected expression in numeric for stat");

                assert(expectPeek(","), "expected , in numeric for stat");
                consume();

                auto goal = getExpression();
                assert(goal, "expected expression in numeric for stat");

                NodePointer step = nullptr;

                if (expectPeek(","))
                {
                    consume();

                    step = getExpression();
                    assert(step, "expected expression in numeric for stat");
                }
                assert(expectPeek("do"), "expected do in numeric for stat");
                consume();

                auto block = getBlock();

                assert(expectPeek("end"), "expected do in numeric for stat");
                consume();

                auto for_statement = Node::create(Kind::ForStatement);
                if (step == nullptr)
                {
                    for_statement->setChildren({name, init, goal, NodePointer{nullptr}, block});
                }
                else
                {
                    for_statement->setChildren({name, init, goal, step, block});
                }
                return for_statement;
            }
            else
            {
                auto name_list = getNameList();
                assert(name_list, "expected name list in generic for loop");

                assert(expectPeek("in"), "expected in after for in generic for stat");
                consume();

                auto expression_list = getExpressionList();
                assert(expression_list, "expected expression list in generic for stat");

                assert(expectPeek("do"), "expected do in generic for stat");
                consume();

                auto block = getBlock();

                assert(expectPeek("end"), "expected end in generic for stat");
                consume();

                auto for_statement = Node::create(Kind::ForStatement);
                for_statement->setChildren({name_list, expression_list, block});
                return for_statement;
            }
        }
        else if (expectPeek("goto"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in goto stat");

            auto goto_statement = Node::create(Kind::GotoStatement);
            goto_statement->setChildren({name});
            return goto_statement;
        }
        else if (expectPeek("::"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in label");

            assert(expectPeek("::"), "expected :: after :: in label");
            consume();

            auto label = Node::create(Kind::Label);
            label->setChildren({name});
            return label;
        }

        if (auto variable_list = getVariableList())
        {
            assert(expectPeek("="), "expected = in assignment stat");
            consume();

            auto expression_list = getExpressionList();
            assert(expression_list, "expected expression list in assignment stat");

            auto assignment_statement = Node::create(Kind::AssignmentStatement);
            assignment_statement->setChildren({variable_list, expression_list});
            return assignment_statement;
        }
        else if (auto function_call = getFunctionCall())
        {
            return function_call;
        }

        return nullptr;
    }

    NodePointer getBlock()
    {
        auto block = Node::create(Kind::Block);
        NodeArray list;

        while (auto stat = getStatement())
        {
            stat->setParent(block);
            list.push_back(stat);
        }

        if (auto stat = getReturnStatement())
        {
            stat->setParent(block);
            list.push_back(stat);
        }

        if (list.empty())
        {
            return nullptr;
        }

        block->setChildren({list});
        return block;
    }

    NodePointer getChunk()
    {
        auto chunk = Node::create(Kind::Chunk);

        if (auto block = getBlock())
        {
            chunk->setChildren({block});
        }
        else
        {
            chunk->setChildren({NodePointer{nullptr}});
        }
        return chunk;
    }


    NodePointer parse(const std::string& p_Source)
    {
        TokenStream stream;
        stream.tokenize(p_Source);
        m_Tokens = stream.m_Tokens;
        m_Length = m_Tokens.size();

        // #define PRINT_TOKENS
        // #define RETURN_EARLY

#ifdef PRINT_TOKENS
        {
            std::clog << "VIEW TOKENS: " << stream.m_Tokens.size() << "\n";

            std::size_t max_length = 0;
            for (Token& Token: stream.m_Tokens)
            {
                if (Token.literal.m_Length() <= 15)
                {
                    max_length = std::max(max_length, Token.literal.m_Length());
                }
            }

            for (Token& Token: stream.m_Tokens)
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

                if (Token.literal.m_Length() <= 15)
                {
                    std::cout << Token.literal << std::string(max_length - Token.literal.m_Length(), ' ') << " -> " << (type) << "\n";
                }
                else
                {
                    std::cout << Token.literal << " -> " << (type) << "\n";
                }
            }

            std::cout << "\n";
        }
#endif

#ifdef RETURN_EARLY
        return;
#endif

        std::string path = "../tests/output_ast.lua";
        auto ptr = getChunk();
        assert(ptr, "failed to parse");

        {
            std::ofstream file(path);
            assert(file.is_open(), "Failed to open the file.");
            file << ptr->toString(0);
            file.close();
        }
        // std::cout << ptr->toString(0) << std::endl;
        return ptr;
    }


    static int getPrecedence(const Token& p_CurrentToken, bool p_IsUnaryOperation = false)
    {
        static const std::vector<std::vector<std::string>> priority = {
            {"or"},
            {"and"},
            {"<", ">", "<=", ">=", "~=", "=="},
            {"|"},
            {"~"},
            {"&"},
            {"<<", ">>"},
            {".."},
            {"+", "-"},
            {"*", "/", "//", "%"},
            {"not", "#", "-", "~"},
            {"^"}
        };

        if (p_IsUnaryOperation)
        {
            return static_cast<int>(priority.size()) - 1;
        }

        for (int i = 0; i < priority.size(); i++)
        {
            for (auto& e: priority[i])
            {
                if (p_CurrentToken.is(e))
                {
                    return i + 1;
                }
            }
        }
        return -1;
    }

    NodePointer getPrimaryExpression()
    {
        if (!next())
        {
            return nullptr;
        }

        Token current_token = peek();

        switch (current_token.type)
        {
            case TokenType::IDENTIFIER:
            {
                auto identifier = Node::create(Kind::Identifier);
                identifier->setChildren({consume().literal});
                return identifier;
            }
            case TokenType::STRING_RAW:
            case TokenType::STRING:
            {
                auto string = Node::create(Kind::String);
                string->setChildren({consume().literal});
                string->setChildren({*Util::to_string(string)});
                return string;
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
                auto value = Util::to_number(consume().literal);

                auto number = Node::create(Kind::Numeric);
                number->setChildren({Number(*value)});
                return number;
            }

            case TokenType::KEYWORD:
            {
                if (is_boolean(current_token))
                {
                    auto boolean = Node::create(Kind::Boolean);
                    boolean->setChildren({consume().literal == "true"});
                    return boolean;
                }
                else if (is_unary_operator(current_token))
                {
                    consume();
                    auto expr = getExpression(getPrecedence(current_token, true));
                    assert(expr, "expected expression after " + current_token.literal);

                    auto unary_operation = Node::create(Kind::UnaryOperation);
                    unary_operation->setChildren({OperatorKind::LNOT, expr});
                    return unary_operation;
                }
                else if (is_null(current_token))
                {
                    auto null = Node::create(Kind::Null);
                    null->setChildren({consume().literal});
                    return null;
                }
                break;
            }
            case TokenType::PUNCTUATION:
            {
                if (current_token.is("..."))
                {
                    auto varargs = Node::create(Kind::Varargs);
                    varargs->setChildren({consume().literal});
                    return varargs;
                }
                else if (current_token.is("("))
                {
                    consume();

                    auto expr = getExpression();
                    assert(expr, "expected expression");

                    assert(expectPeek(")"), "expected ) after (");
                    consume();

                    return expr;
                }
                else if (current_token.is("{"))
                {
                    return getTableConstructor();
                }
                else if (is_unary_operator(current_token))
                {
                    consume();
                    auto expr = getExpression(getPrecedence(current_token, true));
                    assert(expr, "expected expression after " + current_token.literal);

                    auto unary_operation = Node::create(Kind::UnaryOperation);
                    OperatorKind op_kind;

                    if (current_token.is("-"))
                    {
                        op_kind = OperatorKind::UNM;
                    }
                    else if (current_token.is("~"))
                    {
                        op_kind = OperatorKind::BNOT;
                    }
                    else if (current_token.is("#"))
                    {
                        op_kind = OperatorKind::LEN;
                    }

                    unary_operation->setChildren({op_kind, expr});
                    return unary_operation;
                }
                break;
            }
        }
        return nullptr;
    }

    NodePointer getExpression(int p_Precedence = 0)
    {
        if (auto lhs_expression = getFunctionDefinition())
        {
            return getRhsExpression(p_Precedence, lhs_expression);
        }

        if (auto lhs_expression = getPrefixExpression())
        {
            return getRhsExpression(p_Precedence, lhs_expression);
        }

        if (auto lhs_expression = getPrimaryExpression())
        {
            return getRhsExpression(p_Precedence, lhs_expression);
        }
        return nullptr;
    }

    NodePointer getRhsExpression(int p_MinPrecedence, NodePointer p_Lhs)
    {
        while (next())
        {
            Token current_token = peek();
            int current_precedence = getPrecedence(current_token);

            if (current_precedence < p_MinPrecedence)
            {
                return p_Lhs;
            }

            consume();

            NodePointer rhs = nullptr;

            if (!rhs)
            {
                rhs = getFunctionDefinition();
            }
            if (!rhs)
            {
                rhs = getPrefixExpression();
            }
            if (!rhs)
            {
                rhs = getPrimaryExpression();
            }

            assert(rhs, "expected rhs expression");

            if (expectPeek(TokenType::PUNCTUATION))
            {
                if (is_rhs_associative(current_token))
                {
                    rhs = getRhsExpression(current_precedence, rhs);
                    assert(rhs, "expected rhs expression");
                }
                else if (current_precedence < getPrecedence(peek()))
                {
                    rhs = getRhsExpression(current_precedence + 1, rhs);
                    assert(rhs, "expected rhs expression");
                }
            }

            if (is_binary_operator(current_token))
            {


                auto binary_operation = Node::create(Kind::BinaryOperation);
                binary_operation->setChildren({Util::get_operator(current_token.literal), p_Lhs, rhs});
                p_Lhs = binary_operation;
            }
        }
        return p_Lhs;
    }

    bool next(std::size_t p_Offset = 0) const;

    Token peek(std::size_t p_Offset = 0);

    Token consume();

    std::size_t mark() const;

    void revert(std::size_t p_Marked);

    bool expectPeek(TokenType p_Type, std::size_t p_Offset = 0);

    bool expectPeek(const std::string& p_Match, std::size_t p_Offset = 0);
};


#endif //LUA_PARSER_H
