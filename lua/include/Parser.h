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
        NodePointer name = getName();

        if (!name)
        {
            return nullptr;
        }

        if (expectPeek("<"))
        {
            consume();

            NodePointer attribute_type = getName();
            assert(attribute_type, "expected attribute type");
            assert(expectPeek(">"), "expected > after < in attrib");
            consume();

            NodePointer attribute = Node::create(Kind::Attribute);
            attribute->setChildren({name, attribute_type});
            return attribute;
        }
        return name;
    }

    NodePointer getAttributeList()
    {
        NodePointer attribute_list = Node::create(Kind::AttributeList);
        NodeArray list;

        if (NodePointer attribute = getAttributeName())
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

            NodePointer attribute = getAttributeName();
            assert(attribute, "expected attribute variable");

            attribute->setParent(attribute_list);
            list.push_back(attribute);
        }

        attribute_list->setChildren({list});
        return attribute_list;
    }

    NodePointer getExpressionList()
    {
        NodePointer expression_list = Node::create(Kind::ExpressionList);
        NodeArray list;

        if (NodePointer expression = getExpression())
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

            NodePointer expression = getExpression();
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


        NodePointer expression_list = getExpressionList();

        if (expectPeek(";"))
        {
            consume();
        }

        NodePointer return_statement = Node::create(Kind::ReturnStatement);
        return_statement->setChildren({expression_list});
        return return_statement;
    }

    NodePointer getFunctionName()
    {
        NodePointer function_name = Node::create(Kind::FunctionName);

        NodePointer root = getName();
        if (!root)
        {
            return nullptr;
        }

        while (expectPeek("."))
        {
            consume();

            NodePointer name = getName();
            assert(name, "expected name for function");

            NodePointer member_expression = Node::create(Kind::Member);

            member_expression->setChildren({root, name});
            root = member_expression;
        }

        if (expectPeek(":"))
        {
            consume();

            NodePointer name = getName();
            assert(name, "expected name for method");

            NodePointer method_expression = Node::create(Kind::Method);
            method_expression->setChildren({root, name});
            root = method_expression;
        }

        function_name->setChildren({root});
        return function_name;
    }

    NodePointer getNameList(bool p_IsParameterList = false)
    {
        NodePointer name_list = Node::create();
        NodeArray list;

        if (NodePointer name = getName())
        {
            name->setParent(name_list);
            list.push_back(name);
        }
        else if (p_IsParameterList && expectPeek("..."))
        {
            NodePointer varargs = getPrimaryExpression();
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
                NodePointer varargs = getPrimaryExpression();
                varargs->setParent(name_list);
                list.push_back(varargs);
                break;
            }

            NodePointer name = getName();
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

            NodePointer table_index_value_expression = Node::create(Kind::TableIndexValue);

            NodePointer expression = getExpression();
            assert(expression, "expected index in field");

            assert(expectPeek("]"), "expected ] after [ in field");
            consume();
            assert(expectPeek("="), "expected = after ] in field");
            consume();

            NodePointer value = getExpression();
            assert(value, "expected value in field");


            table_index_value_expression->setChildren({expression, value});
            return table_index_value_expression;
        }
        else if (expectPeek(TokenType::IDENTIFIER) && expectPeek("=", 1))
        {
            NodePointer name = getName();

            assert(expectPeek("="), "expected = after name in field");
            consume();

            NodePointer value = getExpression();
            assert(value, "expected value in field");

            NodePointer table_name_value_expression = Node::create(Kind::TableNameValue);
            table_name_value_expression->setChildren({name, value});
            return table_name_value_expression;
        }
        else if (NodePointer expression = getExpression())
        {
            NodePointer table_value_expression = Node::create(Kind::TableValue);
            table_value_expression->setChildren({expression});
            return table_value_expression;
        }
        return nullptr;
    }

    NodePointer getFieldList()
    {
        NodePointer field_list = Node::create(Kind::FieldList);

        NodeArray list;

        while (NodePointer field = getField())
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
            NodePointer expression_list = getExpressionList();

            assert(expectPeek(")"), "expected ) after ( in args");
            consume();

            NodePointer argument_list = Node::create(Kind::ArgumentList);
            argument_list->setChildren({expression_list});
            return argument_list;
        }
        else if (expectPeek(TokenType::STRING) || expectPeek(TokenType::STRING_RAW))
        {
            NodePointer expression = getPrimaryExpression();

            NodePointer argument_list = Node::create(Kind::ArgumentList);
            argument_list->setChildren({expression});
            return argument_list;
        }
        else if (NodePointer table_constructor = getTableConstructor())
        {
            NodePointer argument_list = Node::create(Kind::ArgumentList);
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

        NodePointer field_list = getFieldList();

        assert(expectPeek("}"), "expected } after { in table constructor");
        consume();

        NodePointer table_constructor_expression = Node::create(Kind::TableConstructor);
        table_constructor_expression->setChildren({field_list});
        return table_constructor_expression;
    }

    NodePointer getVariable(bool p_IsPrefixExpression = false)
    {
        NodePointer root = nullptr;
        bool is_valid_expression = true;
        std::size_t marked = mark();

        while (true)
        {
            if (!root)
            {
                if (NodePointer name = getName())
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

                NodePointer expression = getExpression();
                assert(expression, "expected expression in var");

                assert(expectPeek("]"), "expected ] after [ in var");
                consume();

                NodePointer index_expression = Node::create(Kind::Index);
                index_expression->setChildren({root, expression});
                root = index_expression;

                is_valid_expression = true;
            }
            else if (expectPeek("."))
            {
                consume();

                NodePointer name = getName();
                assert(name, "expected name in var");

                NodePointer member_expression = Node::create(Kind::Member);
                member_expression->setChildren({root, name});
                root = member_expression;

                is_valid_expression = true;
            }
            else if (expectPeek(":"))
            {
                consume();

                NodePointer name = getName();
                assert(name, "expected name in var");

                NodePointer method_expression = Node::create(Kind::Method);
                method_expression->setChildren({root, name});
                root = method_expression;

                NodePointer argument_list = getArgumentList();
                assert(argument_list, "expected argumentList in var");

                NodePointer function_call = Node::create(Kind::FunctionCall);
                function_call->setChildren({root, argument_list});
                root = function_call;

                is_valid_expression = false;
            }
            else if (NodePointer args = getArgumentList())
            {
                NodePointer function_call = Node::create(Kind::FunctionCall);
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
        std::size_t marked = mark();
        NodePointer expression = getPrefixExpression();

        if (!(expression && expression->getKind() == Kind::FunctionCall))
        {
            revert(marked);
            return nullptr;
        }
        return expression;
    }

    NodePointer getVariableList()
    {
        NodePointer variable = getVariable();
        if (!variable)
        {
            return nullptr;
        }

        NodeArray list;
        NodePointer variable_list = Node::create(Kind::VariableList);

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

        NodePointer parameter_list = getParameterList();

        assert(expectPeek(")"), "expected ) after ( in function body");
        consume();

        NodePointer block = getBlock();

        assert(expectPeek("end"), "expected end in function body");
        consume();

        NodePointer function_body = Node::create(Kind::FunctionBody);
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

        NodePointer function_body = getFunctionBody();
        assert(function_body, "expected function body in function definition");

        NodePointer function_definition = Node::create(Kind::FunctionDefinition);
        function_definition->setChildren({NodePointer{nullptr}, function_body});
        return function_definition;
    }

    NodePointer getStatement()
    {
        if (expectPeek(";"))
        {
            consume();
            NodePointer semicolon = Node::create(Kind::Semicolon);
            return semicolon;
        }
        else if (expectPeek("break"))
        {
            consume();
            NodePointer break_statement = Node::create(Kind::BreakStatement);
            return break_statement;
        }
        // For Luau continue
        else if (expectPeek("continue"))
        {
            consume();
            NodePointer continue_statement = Node::create(Kind::BreakStatement);
            return continue_statement;
        }
        else if (expectPeek("if"))
        {
            consume();
            NodeArray list;

            NodePointer if_statement = Node::create(Kind::IfStatement);

            NodePointer expression = getExpression();
            assert(expression, "expected expression in if stat");

            assert(expectPeek("then"), "expected then in if stat");
            consume();

            NodePointer block = getBlock();


            NodePointer conditional_block = Node::create(Kind::ConditionalBlock);
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

            NodePointer expression = getExpression();
            assert(expression, "expected expression in while stat");

            assert(expectPeek("do"), "expected do in while stat");
            consume();

            NodePointer block = getBlock();

            assert(expectPeek("end"), "expected end in while stat");
            consume();

            NodePointer conditional_block = Node::create(Kind::ConditionalBlock);
            conditional_block->setChildren({expression, block});

            NodePointer while_statement = Node::create(Kind::WhileStatement);
            while_statement->setChildren({conditional_block});
            return while_statement;
        }
        else if (expectPeek("repeat"))
        {
            consume();

            NodePointer block = getBlock();

            assert(expectPeek("until"), "expected until in repeat stat");
            consume();

            NodePointer expression = getExpression();
            assert(expression, "expected expression in repeat stat");

            NodePointer conditional_block = Node::create(Kind::ConditionalBlock);
            conditional_block->setChildren({expression, block});

            NodePointer repeat_statement = Node::create(Kind::RepeatStatement);
            repeat_statement->setChildren({conditional_block});
            return repeat_statement;
        }
        else if (expectPeek("do"))
        {
            consume();

            NodePointer block = getBlock();

            assert(expectPeek("end"), "expected end in do statement");
            consume();

            NodePointer do_statement = Node::create(Kind::DoStatement);
            do_statement->setChildren({block});
            return do_statement;
        }
        else if (expectPeek("local"))
        {
            consume();

            if (expectPeek("function"))
            {
                consume();

                NodePointer name = getName();
                assert(name, "expected name in local function");

                NodePointer body = getFunctionBody();
                assert(body, "expected function body in local function");

                NodePointer function_definition = Node::create(Kind::FunctionDefinition);
                function_definition->setChildren({name, body});

                NodePointer local_statement = Node::create(Kind::LocalStatement);
                local_statement->setChildren({function_definition});
                return local_statement;
            }
            else
            {
                NodePointer local_statement = Node::create(Kind::LocalStatement);

                NodePointer attribute_name_list = getAttributeList();
                assert(attribute_name_list, "expected attribute name list in local stat");

                if (expectPeek("="))
                {
                    consume();

                    NodePointer expression_list = getExpressionList();
                    assert(expression_list, "expected expression list in local stat");

                    NodePointer assignment_statement = Node::create(Kind::AssignmentStatement);
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

            NodePointer name = getFunctionName();
            assert(name, "expected name in function");

            NodePointer body = getFunctionBody();
            assert(body, "expected function body in function");

            NodePointer function_definition = Node::create(Kind::FunctionDefinition);
            function_definition->setChildren({name, body});
            return function_definition;
        }
        else if (expectPeek("for"))
        {
            consume();

            if (expectPeek("=", 1))
            {
                NodePointer name = getName();
                assert(name, "expected name in numeric for stat");

                assert(expectPeek("="), "expected = in numeric for stat");
                consume();

                NodePointer init = getExpression();
                assert(init, "expected expression in numeric for stat");

                assert(expectPeek(","), "expected , in numeric for stat");
                consume();

                NodePointer goal = getExpression();
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

                NodePointer block = getBlock();

                assert(expectPeek("end"), "expected do in numeric for stat");
                consume();

                NodePointer for_statement = Node::create(Kind::ForStatement);
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
                NodePointer name_list = getNameList();
                assert(name_list, "expected name list in generic for loop");

                assert(expectPeek("in"), "expected in after for in generic for stat");
                consume();

                NodePointer expression_list = getExpressionList();
                assert(expression_list, "expected expression list in generic for stat");

                assert(expectPeek("do"), "expected do in generic for stat");
                consume();

                NodePointer block = getBlock();

                assert(expectPeek("end"), "expected end in generic for stat");
                consume();

                NodePointer for_statement = Node::create(Kind::ForStatement);
                for_statement->setChildren({name_list, expression_list, block});
                return for_statement;
            }
        }
        else if (expectPeek("goto"))
        {
            consume();

            NodePointer name = getName();
            assert(name, "expected name in goto stat");

            NodePointer goto_statement = Node::create(Kind::GotoStatement);
            goto_statement->setChildren({name});
            return goto_statement;
        }
        else if (expectPeek("::"))
        {
            consume();

            NodePointer name = getName();
            assert(name, "expected name in label");

            assert(expectPeek("::"), "expected :: after :: in label");
            consume();

            NodePointer label = Node::create(Kind::Label);
            label->setChildren({name});
            return label;
        }

        if (NodePointer variable_list = getVariableList())
        {
            assert(expectPeek("="), "expected = in assignment stat");
            consume();

            NodePointer expression_list = getExpressionList();
            assert(expression_list, "expected expression list in assignment stat");

            NodePointer assignment_statement = Node::create(Kind::AssignmentStatement);
            assignment_statement->setChildren({variable_list, expression_list});
            return assignment_statement;
        }
        else if (NodePointer function_call = getFunctionCall())
        {
            return function_call;
        }

        return nullptr;
    }

    NodePointer getBlock()
    {
        NodePointer block = Node::create(Kind::Block);
        NodeArray list;

        while (NodePointer stat = getStatement())
        {
            stat->setParent(block);
            list.push_back(stat);
        }

        if (NodePointer stat = getReturnStatement())
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
        NodePointer chunk = Node::create(Kind::Chunk);

        if (NodePointer block = getBlock())
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
        NodePointer ptr = getChunk();
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
            for (const std::string& e: priority[i])
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
                NodePointer identifier = Node::create(Kind::Identifier);
                identifier->setChildren({consume().literal});
                return identifier;
            }
            case TokenType::STRING_RAW:
            case TokenType::STRING:
            {
                NodePointer string = Node::create(Kind::String);
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
                std::optional<double> value = Util::to_number(consume().literal);

                NodePointer number = Node::create(Kind::Numeric);
                number->setChildren({Number(*value)});
                return number;
            }

            case TokenType::KEYWORD:
            {
                if (is_boolean(current_token))
                {
                    NodePointer boolean = Node::create(Kind::Boolean);
                    boolean->setChildren({consume().literal == "true"});
                    return boolean;
                }
                else if (is_unary_operator(current_token))
                {
                    consume();
                    NodePointer expr = getExpression(getPrecedence(current_token, true));
                    assert(expr, "expected expression after " + current_token.literal);

                    NodePointer unary_operation = Node::create(Kind::UnaryOperation);
                    unary_operation->setChildren({OperatorKind::LNOT, expr});
                    return unary_operation;
                }
                else if (is_null(current_token))
                {
                    NodePointer null = Node::create(Kind::Null);
                    null->setChildren({consume().literal});
                    return null;
                }
                break;
            }
            case TokenType::PUNCTUATION:
            {
                if (current_token.is("..."))
                {
                    NodePointer varargs = Node::create(Kind::Varargs);
                    varargs->setChildren({consume().literal});
                    return varargs;
                }
                else if (current_token.is("("))
                {
                    consume();

                    NodePointer expr = getExpression();
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
                    NodePointer expr = getExpression(getPrecedence(current_token, true));
                    assert(expr, "expected expression after " + current_token.literal);

                    NodePointer unary_operation = Node::create(Kind::UnaryOperation);
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
        if (NodePointer lhs_expression = getFunctionDefinition())
        {
            return getRhsExpression(p_Precedence, lhs_expression);
        }

        if (NodePointer lhs_expression = getPrefixExpression())
        {
            return getRhsExpression(p_Precedence, lhs_expression);
        }

        if (NodePointer lhs_expression = getPrimaryExpression())
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


                NodePointer binary_operation = Node::create(Kind::BinaryOperation);
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
