#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include <iostream>
#include <memory>
#include <utility>
#include <tuple>
#include <vector>
#include <fstream>
#include <Tokenizer.h>

#include <Node.h>


bool isBinaryOperator(const Token& currentToken);

bool isFieldSeparator(const Token& currentToken);

bool isUnaryOperator(const Token& currentToken);

bool isBoolean(const Token& currentToken);

bool isConditional(const Token& currentToken);

bool isNull(const Token& currentToken);


#define assert(condition, message)                        \
do {                                                      \
    if (!(condition)) {                                   \
        std::cerr << "Assertion `" #condition "` failed." \
        << "\n\tFile: " << __FILE__                       \
        << "\n\tFunc: " << __FUNCTION__                   \
        << "\n\tLine: " << __LINE__                       \
        << "\n\tMessage: " << message                     \
        << std::endl;                                     \
                                                          \
        for (int i = -5; i <= 5; i++) {                   \
            if (next(i)) {                                \
                std::string literal = peek(i).literal;    \
                std::cout << literal << std::endl;        \
            }                                             \
        }                                                 \
                                                          \
                                                          \
        abort();                                          \
    }                                                     \
} while (false)


class Parser
{
public:
    std::size_t m_Index = 0;
    std::size_t m_Length = 0;
    std::vector<Token> m_Tokens;

    p_Node getName()
    {
        return expectPeek(TokenType::IDENTIFIER) ? getPrimaryExpression() : nullptr;
    }

    p_Node getAttributeName()
    {
        auto name = getName();

        if (!name)
        {
            return nullptr;
        }

        if (expectPeek("<"))
        {
            consume();

            auto attributeType = getName();
            assert(attributeType, "expected attribute type");
            assert(expectPeek(">"), "expected > after < in attrib");
            consume();

            auto attribute = Node::create(Kind::Attribute);
            attribute->setChildren({name, attributeType});
            return attribute;
        }
        return name;
    }

    p_Node getAttributeList()
    {
        auto attributeList = Node::create(Kind::AttributeList);
        p_NodeArray list;

        if (auto attribute = getAttributeName())
        {
            attribute->setParent(attributeList);
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

            attribute->setParent(attributeList);
            list.push_back(attribute);
        }

        attributeList->setChildren({list});
        return attributeList;
    }

    p_Node getExpressionList()
    {
        auto expressionList = Node::create(Kind::ExpressionList);
        p_NodeArray list;

        if (auto expression = getExpression())
        {
            expression->setParent(expressionList);
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

            expression->setParent(expressionList);
            list.push_back(expression);
        }

        expressionList->setChildren({list});
        return expressionList;
    }

    p_Node getReturnStatement()
    {
        if (!expectPeek("return"))
        {
            return nullptr;
        }
        consume();


        auto expressionList = getExpressionList();

        if (expectPeek(";"))
        {
            consume();
        }

        auto returnStatement = Node::create(Kind::ReturnStatement);
        returnStatement->setChildren({expressionList});
        return returnStatement;
    }

    p_Node getFunctionName()
    {
        auto functionName = Node::create(Kind::FunctionName);

        p_Node root = getName();
        if (!root)
        {
            return nullptr;
        }

        while (expectPeek("."))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for function");

            auto memberExpression = Node::create(Kind::Member);

            memberExpression->setChildren({root, name});
            root = memberExpression;
        }

        if (expectPeek(":"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for method");

            auto methodExpression = Node::create(Kind::Method);
            methodExpression->setChildren({root, name});
            root = methodExpression;
        }

        functionName->setChildren({root});
        return functionName;
    }

    p_Node getNameList(bool isParameterList = false)
    {
        auto nameList = Node::create();
        p_NodeArray list;

        if (auto name = getName())
        {
            name->setParent(nameList);
            list.push_back(name);
        }
        else if (isParameterList && expectPeek("..."))
        {
            auto varargs = getPrimaryExpression();
            varargs->setParent(nameList);
            list.push_back(varargs);

            nameList->setKind(Kind::ParameterList);
            nameList->setChildren({list});
            return nameList;
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            consume();

            if (isParameterList && expectPeek("..."))
            {
                auto varargs = getPrimaryExpression();
                varargs->setParent(nameList);
                list.push_back(varargs);
                break;
            }

            auto name = getName();
            assert(name, "expected name");
            name->setParent(nameList);
            list.push_back(name);
        }

        nameList->setKind(isParameterList ? Kind::ParameterList : Kind::NameList);
        nameList->setChildren({list});
        return nameList;
    }

    p_Node getParameterList()
    {
        return getNameList(true);
    }

    p_Node getField()
    {
        if (expectPeek("["))
        {
            consume();

            auto tableIndexValueExpression = Node::create(Kind::TableIndexValue);

            auto expression = getExpression();
            assert(expression, "expected index in field");

            assert(expectPeek("]"), "expected ] after [ in field");
            consume();
            assert(expectPeek("="), "expected = after ] in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");


            tableIndexValueExpression->setChildren({expression, value});
            return tableIndexValueExpression;
        }
        else if (expectPeek(TokenType::IDENTIFIER) && expectPeek("=", 1))
        {
            auto name = getName();

            assert(expectPeek("="), "expected = after name in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");

            auto tableNameValueExpression = Node::create(Kind::TableNameValue);
            tableNameValueExpression->setChildren({name, value});
            return tableNameValueExpression;
        }
        else if (auto expression = getExpression())
        {
            auto tableValueExpression = Node::create(Kind::TableValue);
            tableValueExpression->setChildren({expression});
            return tableValueExpression;
        }
        return nullptr;
    }

    p_Node getFieldList()
    {
        auto fieldList = Node::create(Kind::FieldList);

        p_NodeArray list;

        while (auto field = getField())
        {
            field->setParent(fieldList);
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

        fieldList->setChildren({list});
        return fieldList;
    }

    p_Node getArgumentList()
    {
        if (expectPeek("("))
        {
            consume();
            auto expressionList = getExpressionList();

            assert(expectPeek(")"), "expected ) after ( in args");
            consume();

            auto argumentList = Node::create(Kind::ArgumentList);
            argumentList->setChildren({expressionList});
            return argumentList;
        }
        else if (expectPeek(TokenType::STRING) || expectPeek(TokenType::STRING_RAW))
        {
            auto expression = getPrimaryExpression();

            auto argumentList = Node::create(Kind::ArgumentList);
            argumentList->setChildren({expression});
            return argumentList;
        }
        else if (auto tableConstructor = getTableConstructor())
        {
            auto argumentList = Node::create(Kind::ArgumentList);
            argumentList->setChildren({tableConstructor});
            return argumentList;
        }
        return nullptr;
    }

    p_Node getTableConstructor()
    {
        if (!expectPeek("{"))
        {
            return nullptr;
        }
        consume();

        auto fieldList = getFieldList();

        assert(expectPeek("}"), "expected } after { in table constructor");
        consume();

        auto tableConstructorExpression = Node::create(Kind::TableConstructor);
        tableConstructorExpression->setChildren({fieldList});
        return tableConstructorExpression;
    }

    p_Node getVariable(bool isPrefixExpression = false)
    {
        p_Node root = nullptr;
        bool isValidExpression = true;
        auto marked = mark();

        while (true)
        {
            if (!root)
            {
                if (auto name = getName())
                {
                    root = name;
                    isValidExpression = true;
                }
                else if (expectPeek("("))
                {
                    consume();

                    root = getExpression();
                    assert(root, "expected expression in var");

                    assert(expectPeek(")"), "expected ) after ( in var");
                    consume();
                    isValidExpression = false;
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

                auto indexExpression = Node::create(Kind::Index);
                indexExpression->setChildren({root, expression});
                root = indexExpression;

                isValidExpression = true;
            }
            else if (expectPeek("."))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in var");

                auto memberExpression = Node::create(Kind::Member);
                memberExpression->setChildren({root, name});
                root = memberExpression;

                isValidExpression = true;
            }
            else if (expectPeek(":"))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in var");

                auto methodExpression = Node::create(Kind::Method);
                methodExpression->setChildren({root, name});
                root = methodExpression;

                auto argumentList = getArgumentList();
                assert(argumentList, "expected argumentList in var");

                auto functionCall = Node::create(Kind::FunctionCall);
                functionCall->setChildren({root, argumentList});
                root = functionCall;

                isValidExpression = false;
            }
            else if (auto args = getArgumentList())
            {
                auto functionCall = Node::create(Kind::FunctionCall);
                functionCall->setChildren({root, args});
                root = functionCall;

                isValidExpression = false;
            }
            else
            {
                break;
            }
        }

        if (!isPrefixExpression && !isValidExpression)
        {
            revert(marked);
            return nullptr;
        }
        return root;
    }

    p_Node getPrefixExpression()
    {
        return getVariable(true);
    }

    p_Node getFunctionCall()
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

    p_Node getVariableList()
    {
        auto variable = getVariable();
        if (!variable)
        {
            return nullptr;
        }

        p_NodeArray list;
        auto variableList = Node::create(Kind::VariableList);

        variable->setParent(variableList);
        list.push_back(variable);

        while (expectPeek(","))
        {
            consume();

            variable = getVariable();
            assert(variable, "expression expected in variable list");

            variable->setParent(variableList);
            list.push_back(variable);
        }

        variableList->setChildren({list});
        return variableList;
    }

    p_Node getFunctionBody()
    {
        if (!expectPeek("("))
        {
            return nullptr;
        }
        consume();

        auto parameterList = getParameterList();

        assert(expectPeek(")"), "expected ) after ( in function body");
        consume();

        auto block = getBlock();

        assert(expectPeek("end"), "expected end in function body");
        consume();

        auto functionBody = Node::create(Kind::FunctionBody);
        functionBody->setChildren({parameterList, block});
        return functionBody;
    }

    p_Node getFunctionDefinition()
    {
        if (!expectPeek("function"))
        {
            return nullptr;
        }
        consume();

        auto functionBody = getFunctionBody();
        assert(functionBody, "expected function body in function definition");

        auto functionDefinition = Node::create(Kind::FunctionDefinition);
        functionDefinition->setChildren({p_Node{nullptr}, functionBody});
        return functionDefinition;
    }

    p_Node getStatement()
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
            auto breakStatement = Node::create(Kind::BreakStatement);
            return breakStatement;
        }
            // For Luau continue
        else if (expectPeek("continue"))
        {
            consume();
            auto continueStatement = Node::create(Kind::BreakStatement);
            return continueStatement;
        }
        else if (expectPeek("if"))
        {
            consume();
            p_NodeArray list;

            auto ifStatement = Node::create(Kind::IfStatement);

            auto expression = getExpression();
            assert(expression, "expected expression in if stat");

            assert(expectPeek("then"), "expected then in if stat");
            consume();

            auto block = getBlock();


            auto conditionalBlock = Node::create(Kind::ConditionalBlock);
            conditionalBlock->setChildren({expression, block});
            list.push_back(conditionalBlock);

            while (expectPeek("elseif"))
            {
                consume();

                expression = getExpression();
                assert(expression, "expected expression in elseif stat");

                assert(expectPeek("then"), "expected then in elseif stat");
                consume();

                block = getBlock();

                conditionalBlock = Node::create(Kind::ConditionalBlock);
                conditionalBlock->setChildren({expression, block});
                conditionalBlock->setParent(ifStatement);
                list.push_back(conditionalBlock);
            }

            if (expectPeek("else"))
            {
                consume();

                block = getBlock();

                conditionalBlock = Node::create(Kind::ConditionalBlock);
                conditionalBlock->setChildren({p_Node{nullptr}, block});
                conditionalBlock->setParent(ifStatement);
                list.push_back(conditionalBlock);
            }

            assert(expectPeek("end"), "expected end after if stat");
            consume();

            ifStatement->setChildren({list});
            return ifStatement;
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

            auto conditionalBlock = Node::create(Kind::ConditionalBlock);
            conditionalBlock->setChildren({expression, block});

            auto whileStatement = Node::create(Kind::WhileStatement);
            whileStatement->setChildren({conditionalBlock});
            return whileStatement;
        }
        else if (expectPeek("repeat"))
        {
            consume();

            auto block = getBlock();

            assert(expectPeek("until"), "expected until in repeat stat");
            consume();

            auto expression = getExpression();
            assert(expression, "expected expression in repeat stat");

            auto conditionalBlock = Node::create(Kind::ConditionalBlock);
            conditionalBlock->setChildren({expression, block});

            auto repeatStatement = Node::create(Kind::RepeatStatement);
            repeatStatement->setChildren({conditionalBlock});
            return repeatStatement;
        }
        else if (expectPeek("do"))
        {
            consume();

            auto block = getBlock();

            assert(expectPeek("end"), "expected end in do statement");
            consume();

            auto doStatement = Node::create(Kind::DoStatement);
            doStatement->setChildren({block});
            return doStatement;
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

                auto functionDefinition = Node::create(Kind::FunctionDefinition);
                functionDefinition->setChildren({name, body});

                auto localStatement = Node::create(Kind::LocalStatement);
                localStatement->setChildren({functionDefinition});
                return localStatement;
            }
            else
            {
                auto localStatement = Node::create(Kind::LocalStatement);

                auto attributeNameList = getAttributeList();
                assert(attributeNameList, "expected attribute name list in local stat");

                if (expectPeek("="))
                {
                    consume();

                    auto expressionList = getExpressionList();
                    assert(expressionList, "expected expression list in local stat");

                    auto assignmentStatement = Node::create(Kind::AssignmentStatement);
                    assignmentStatement->setChildren({attributeNameList, expressionList});

                    localStatement->setChildren({assignmentStatement});
                }
                else
                {
                    localStatement->setChildren({attributeNameList});
                }
                return localStatement;
            }
        }
        else if (expectPeek("function"))
        {
            consume();

            auto name = getFunctionName();
            assert(name, "expected name in function");

            auto body = getFunctionBody();
            assert(body, "expected function body in function");

            auto functionDefinition = Node::create(Kind::FunctionDefinition);
            functionDefinition->setChildren({name, body});
            return functionDefinition;
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

                p_Node step = nullptr;

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

                auto forStatement = Node::create(Kind::ForStatement);
                if (step == nullptr)
                {
                    forStatement->setChildren({name, init, goal, p_Node{nullptr}, block});
                }
                else
                {
                    forStatement->setChildren({name, init, goal, step, block});
                }
                return forStatement;
            }
            else
            {
                auto nameList = getNameList();
                assert(nameList, "expected name list in generic for loop");

                assert(expectPeek("in"), "expected in after for in generic for stat");
                consume();

                auto expressionList = getExpressionList();
                assert(expressionList, "expected expression list in generic for stat");

                assert(expectPeek("do"), "expected do in generic for stat");
                consume();

                auto block = getBlock();

                assert(expectPeek("end"), "expected end in generic for stat");
                consume();

                auto forStatement = Node::create(Kind::ForStatement);
                forStatement->setChildren({nameList, expressionList, block});
                return forStatement;
            }
        }
        else if (expectPeek("goto"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in goto stat");

            auto gotoStatement = Node::create(Kind::GotoStatement);
            gotoStatement->setChildren({name});
            return gotoStatement;
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

        if (auto variableList = getVariableList())
        {
            assert(expectPeek("="), "expected = in assignment stat");
            consume();

            auto expressionList = getExpressionList();
            assert(expressionList, "expected expression list in assignment stat");

            auto assignmentStatement = Node::create(Kind::AssignmentStatement);
            assignmentStatement->setChildren({variableList, expressionList});
            return assignmentStatement;
        }
        else if (auto function_call = getFunctionCall())
        {
            return function_call;
        }

        return nullptr;
    }

    p_Node getBlock()
    {
        auto block = Node::create(Kind::Block);
        p_NodeArray list;

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

    p_Node getChunk()
    {
        auto chunk = Node::create(Kind::Chunk);

        if (auto block = getBlock())
        {
            chunk->setChildren({block});
        }
        else
        {
            chunk->setChildren({p_Node{nullptr}});
        }
        return chunk;
    }


    p_Node parse(const std::string& source)
    {
        TokenStream stream;
        stream.tokenize(source);
        m_Tokens = stream.m_Tokens;
        m_Length = m_Tokens.size();

        // #define PRINT_TOKENS
        // #define RETURN_EARLY

        #ifdef PRINT_TOKENS
        {
            std::clog << "VIEW TOKENS: " << stream.m_Tokens.size() << "\n";

            std::size_t max_length = 0;
            for (Token& Token: stream.m_Tokens) {
                if (Token.literal.m_Length() <= 15) {
                    max_length = std::max(max_length, Token.literal.m_Length());
                }
            }

            for (Token& Token: stream.m_Tokens) {
                std::string type;

                switch (Token.type) {
                    case TokenType::IDENTIFIER: {
                        type = "IDENTIFIER";
                        break;
                    }
                    case TokenType::STRING_RAW: {
                        type = "STRING_RAW";
                        break;
                    }
                    case TokenType::STRING: {
                        type = "STRING";
                        break;
                    }
                    case TokenType::COMMENT_RAW: {
                        type = "COMMENT_RAW";
                        break;
                    }
                    case TokenType::COMMENT: {
                        type = "COMMENT";
                        break;
                    }
                    case TokenType::NUMBER_HEXADECIMAL: {
                        type = "NUMBER_HEXADECIMAL";
                        break;
                    }
                    case TokenType::NUMBER_BINARY: {
                        type = "NUMBER_BINARY";
                        break;
                    }
                    case TokenType::NUMBER: {
                        type = "NUMBER";
                        break;
                    }
                    case TokenType::KEYWORD: {
                        type = "KEYWORD";
                        break;
                    }
                    case TokenType::PUNCTUATION: {
                        type = "PUNCTUATION";
                        break;
                    }
                }

                // if (!(Token.type == TokenType::STRING)) {
                //     continue;
                // }

                if (Token.literal.m_Length() <= 15) {
                    std::cout << Token.literal << std::string(
                        max_length - Token.literal.m_Length(),
                        ' '
                    ) << " -> " << (type) << "\n";
                }
                else {
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


    static int getPrecedence(const Token& currentToken, bool isUnaryOperation = false)
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

        if (isUnaryOperation)
        {
            return static_cast<int>(priority.size()) - 1;
        }

        for (int i = 0; i < priority.size(); i++)
        {
            for (auto& e: priority[i])
            {
                if (currentToken.is(e))
                {
                    return i + 1;
                }
            }
        }
        return -1;
    }

    p_Node getPrimaryExpression()
    {
        if (!next())
        {
            return nullptr;
        }

        Token currentToken = peek();

        switch (currentToken.type)
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
                double value = 0;

                try
                {
                    value = std::stod(consume().literal);
                }
                catch (std::out_of_range e)
                {
                    value = std::numeric_limits<double>::infinity();
                }

                auto number = Node::create(Kind::Numeric);
                number->setChildren({Number(value)});
                return number;
            }

            case TokenType::KEYWORD:
            {
                if (isBoolean(currentToken))
                {
                    auto boolean = Node::create(Kind::Boolean);
                    boolean->setChildren({consume().literal == "true"});
                    return boolean;
                }
                else if (isUnaryOperator(currentToken))
                {
                    consume();
                    auto expr = getExpression(getPrecedence(currentToken, true));
                    assert(expr, "expected expression after " + currentToken.literal);

                    auto unaryOperation = Node::create(Kind::UnaryOperation);
                    unaryOperation->setChildren({currentToken.literal, expr});
                    return unaryOperation;
                }
                else if (isNull(currentToken))
                {
                    auto null = Node::create(Kind::Null);
                    null->setChildren({consume().literal});
                    return null;
                }
                break;
            }
            case TokenType::PUNCTUATION:
            {
                if (currentToken.is("..."))
                {
                    auto varargs = Node::create(Kind::Varargs);
                    varargs->setChildren({consume().literal});
                    return varargs;
                }
                else if (currentToken.is("("))
                {
                    consume();

                    auto expr = getExpression();
                    assert(expr, "expected expression");

                    assert(expectPeek(")"), "expected ) after (");
                    consume();

                    return expr;
                }
                else if (currentToken.is("{"))
                {
                    return getTableConstructor();
                }
                else if (isUnaryOperator(currentToken))
                {
                    consume();
                    auto expr = getExpression(getPrecedence(currentToken, true));
                    assert(expr, "expected expression after " + currentToken.literal);

                    auto unaryOperation = Node::create(Kind::UnaryOperation);
                    unaryOperation->setChildren({currentToken.literal, expr});
                    return unaryOperation;
                }
                break;
            }
        }
        return nullptr;
    }

    p_Node getExpression(int precedence = 0)
    {
        if (auto lhsExpression = getFunctionDefinition())
        {
            return getRhsExpression(precedence, lhsExpression);
        }

        if (auto lhsExpression = getPrefixExpression())
        {
            return getRhsExpression(precedence, lhsExpression);
        }

        if (auto lhsExpression = getPrimaryExpression())
        {
            return getRhsExpression(precedence, lhsExpression);
        }
        return nullptr;
    }

    p_Node getRhsExpression(int minPrecedence, p_Node lhs)
    {
        while (next())
        {
            Token currentToken = peek();
            int currentPrecedence = getPrecedence(currentToken);

            if (currentPrecedence < minPrecedence)
            {
                return lhs;
            }

            consume();

            p_Node rhs = nullptr;

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

            if (rhs == nullptr)
            {
                return rhs;
            }

            if (next())
            {
                int next_precedence = getPrecedence(peek());
                if (currentPrecedence < next_precedence)
                {
                    rhs = getRhsExpression(currentPrecedence + 1, rhs);
                    if (rhs == nullptr)
                    {
                        return rhs;
                    }
                }
            }

            if (isBinaryOperator(currentToken))
            {
                auto binaryOperation = Node::create(Kind::BinaryOperation);
                binaryOperation->setChildren({currentToken.literal, lhs, rhs});
                lhs = binaryOperation;
            }
        }
        return lhs;
    }


    bool next(std::size_t offset = 0) const;

    Token peek(std::size_t offset = 0);

    Token consume();

    std::size_t mark() const;

    void revert(std::size_t marked);

    bool expectPeek(TokenType type, std::size_t offset = 0);

    bool expectPeek(const std::string& match, std::size_t offset = 0);
};


#endif //LUA_PARSER_H