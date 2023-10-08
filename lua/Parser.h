#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include <iostream>
#include <memory>
#include <utility>
#include <tuple>
#include <vector>
#include <fstream>
#include "Tokenizer.h"

#include "Node.h"


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

    p_Base getName()
    {
        return expectPeek(TokenType::IDENTIFIER) ? getPrimaryExpression() : nullptr;
    }

    p_Base getAttributeName()
    {
        auto name = getName();

        if (!name)
        {
            return nullptr;
        }

        if (expectPeek("<"))
        {
            consume();
            auto attribute = std::make_shared<Node>();
            attribute->setKind(Kind::Attribute);
            attribute->setSize(2);

            auto attributeType = getName();

            assert(attributeType, "expected attribute type");
            assert(expectPeek(">"), "expected > after < in attrib");
            consume();
            Node::setParent(name, attribute);
            Node::setParent(attributeType, attribute);

            attribute->setChildren({name, attributeType});
            return attribute;
        }
        return name;
    }

    p_Base getAttributeList()
    {
        auto attributeList = std::make_shared<Node>();
        attributeList->setKind(Kind::AttributeList);
        attributeList->setSize(1);
        p_BaseArray list;
        std::cout << "13" << std::endl;

        if (auto attribute = getAttributeName())
        {
            std::cout << "14" << std::endl;
            Node::setParent(attribute, attributeList);
            std::cout << "21" << std::endl;
            list.push_back(attribute);
        }
        else
        {
            return nullptr;
        }
        std::cout << "15" << std::endl;

        while (expectPeek(","))
        {
            consume();

            auto attribute = getAttributeName();
            assert(attribute, "expected attribute variable");

            Node::setParent(attribute, attributeList);
            list.push_back(attribute);
        }

        attributeList->setChildren({list});
        return attributeList;
    }

    p_Base getExpressionList()
    {
        auto expressionList = std::make_shared<Node>();
        expressionList->setKind(Kind::ExpressionList);
        expressionList->setSize(1);
        p_BaseArray list;

        if (auto expression = getExpression())
        {
            Node::setParent(expression, expressionList);
            list.push_back(std::move(expression));
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

            Node::setParent(expression, expressionList);
            list.push_back(std::move(expression));
        }

        expressionList->setChildren({list});
        return expressionList;
    }

    p_Base getReturnStatement()
    {
        if (!expectPeek("return"))
        {
            return nullptr;
        }
        consume();

        auto returnStatement = std::make_shared<Node>();
        returnStatement->setKind(Kind::ReturnStatement);
        returnStatement->setSize(1);

        auto expressionList = getExpressionList();
        Node::setParent(expressionList, returnStatement);

        if (expectPeek(";"))
        {
            consume();
        }

        returnStatement->setChildren({expressionList});
        return returnStatement;
    }

    p_Base getFunctionName()
    {
        auto functionName = std::make_shared<Node>();
        functionName->setKind(Kind::FunctionName);
        functionName->setSize(1);

        p_Base root = getName();
        if (!root)
        {
            return nullptr;
        }
        Node::setParent(root, functionName);

        while (expectPeek("."))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for function");

            auto memberExpression = std::make_shared<Node>();
            memberExpression->setKind(Kind::Member);
            memberExpression->setSize(2);
            memberExpression->setChildren({root, name});
            memberExpression->setParent(root);
            root = memberExpression;
        }

        if (expectPeek(":"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for method");

            auto methodExpression = std::make_shared<Node>();
            methodExpression->setKind(Kind::Method);
            methodExpression->setSize(2);
            methodExpression->setChildren({root, name});
            methodExpression->setParent(root);
            root = methodExpression;
        }

        functionName->setChildren({root});
        return functionName;
    }

    p_Base getNameList(bool isParameterList = false)
    {
        auto nameList = std::make_shared<Node>();
        nameList->setSize(1);
        p_BaseArray list;

        if (auto name = getName())
        {
            Node::setParent(name, nameList);
            list.push_back(name);
        }
        else if (isParameterList && expectPeek("..."))
        {
            auto varargs = getPrimaryExpression();
            Node::setParent(varargs, nameList);
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
                Node::setParent(varargs, nameList);
                list.push_back(varargs);
                break;
            }

            auto name = getName();
            assert(name, "expected name");
            Node::setParent(name, nameList);
            list.push_back(name);
        }

        nameList->setKind(isParameterList ? Kind::ParameterList : Kind::NameList);
        nameList->setChildren({list});
        return nameList;
    }

    p_Base getParameterList()
    {
        return getNameList(true);
    }

    p_Base getField()
    {
        if (expectPeek("["))
        {
            consume();

            auto tableIndexValueExpression = std::make_shared<Node>();
            tableIndexValueExpression->setKind(Kind::TableIndexValue);
            tableIndexValueExpression->setSize(2);

            auto expression = getExpression();
            assert(expression, "expected m_Index in field");
            Node::setParent(expression, tableIndexValueExpression);

            assert(expectPeek("]"), "expected ] after [ in field");
            consume();
            assert(expectPeek("="), "expected = after ] in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");
            Node::setParent(value, tableIndexValueExpression);


            tableIndexValueExpression->setChildren({expression, value});
            return tableIndexValueExpression;
        }
        else if (expectPeek(TokenType::IDENTIFIER) && expectPeek("=", 1))
        {
            auto tableNameValueExpression = std::make_shared<Node>();
            tableNameValueExpression->setKind(Kind::TableNameValue);
            tableNameValueExpression->setSize(2);

            auto name = getName();
            Node::setParent(name, tableNameValueExpression);


            assert(expectPeek("="), "expected = after name in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");
            Node::setParent(value, tableNameValueExpression);

            tableNameValueExpression->setChildren({name, value});
            return tableNameValueExpression;
        }
        else if (auto expression = getExpression())
        {
            auto tableValueExpression = std::make_shared<Node>();
            tableValueExpression->setKind(Kind::TableValue);
            tableValueExpression->setSize(1);
            tableValueExpression->setChildren({expression});
            return tableValueExpression;
        }
        return nullptr;
    }

    p_Base getFieldList()
    {
        auto fieldList = std::make_shared<Node>();
        fieldList->setKind(Kind::FieldList);
        fieldList->setSize(1);

        p_BaseArray list;

        while (auto field = getField())
        {
            Node::setParent(field, fieldList);
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

    p_Base getArgumentList()
    {
        if (expectPeek("("))
        {
            consume();

            auto argumentList = std::make_shared<Node>();
            argumentList->setKind(Kind::ArgumentList);
            argumentList->setSize(1);

            auto expressionList = getExpressionList();

            assert(expectPeek(")"), "expected ) after ( in args");
            consume();

            argumentList->setChildren({expressionList});
            return argumentList;
        }
        else if (expectPeek(TokenType::STRING) || expectPeek(TokenType::STRING_RAW))
        {
            auto argumentList = std::make_shared<Node>();
            argumentList->setKind(Kind::ArgumentList);
            argumentList->setSize(1);
            argumentList->setChildren({getPrimaryExpression()});
            return argumentList;
        }
        else if (auto tableConstructor = getTableConstructor())
        {
            auto argumentList = std::make_shared<Node>();
            argumentList->setKind(Kind::ArgumentList);
            argumentList->setSize(1);
            argumentList->setChildren({tableConstructor});
            return argumentList;
        }
        return nullptr;
    }

    p_Base getTableConstructor()
    {
        if (!expectPeek("{"))
        {
            return nullptr;
        }
        consume();

        auto tableConstructorExpression = std::make_shared<Node>();
        tableConstructorExpression->setKind(Kind::TableConstructor);
        tableConstructorExpression->setSize(1);

        auto fieldList = getFieldList();
        Node::setParent(fieldList, tableConstructorExpression);

        assert(expectPeek("}"), "expected } after { in table constructor");
        consume();

        tableConstructorExpression->setChildren({fieldList});
        return tableConstructorExpression;
    }

    p_Base getVariable(bool isPrefixExpression = false)
    {
        p_Base root = nullptr;
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

                auto indexExpression = std::make_shared<Node>();
                indexExpression->setKind(Kind::Index);
                indexExpression->setSize(2);

                auto expression = getExpression();
                assert(expression, "expected expression in var");

                assert(expectPeek("]"), "expected ] after [ in var");
                consume();
                Node::setParent(root, indexExpression);
                Node::setParent(expression, indexExpression);

                indexExpression->setChildren({root, expression});
                root = indexExpression;
                isValidExpression = true;
            }
            else if (expectPeek("."))
            {
                consume();

                auto memberExpression = std::make_shared<Node>();
                memberExpression->setKind(Kind::Member);
                memberExpression->setSize(2);

                auto name = getName();
                assert(name, "expected name in var");
                Node::setParent(root, memberExpression);
                Node::setParent(name, memberExpression);

                memberExpression->setChildren({root, name});
                root = memberExpression;
                isValidExpression = true;
            }
            else if (expectPeek(":"))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in var");

                auto methodExpression = std::make_shared<Node>();
                methodExpression->setKind(Kind::Method);
                methodExpression->setSize(2);
                methodExpression->setChildren({root, name});
                Node::setParent(root, methodExpression);
                Node::setParent(name, methodExpression);
                root = methodExpression;

                auto argumentList = getArgumentList();
                assert(argumentList, "expected argumentList in var");

                auto functionCall = std::make_shared<Node>();
                functionCall->setKind(Kind::FunctionCall);
                functionCall->setSize(2);
                functionCall->setChildren({root, argumentList});
                Node::setParent(root, functionCall);
                Node::setParent(argumentList, functionCall);
                root = functionCall;

                isValidExpression = false;
            }
            else if (auto args = getArgumentList())
            {
                auto functionCall = std::make_shared<Node>();
                functionCall->setKind(Kind::FunctionCall);
                functionCall->setSize(2);
                functionCall->setChildren({root, args});
                Node::setParent(root, functionCall);
                Node::setParent(args, functionCall);
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

    p_Base getPrefixExpression()
    {
        return getVariable(true);
    }

    p_Base getFunctionCall()
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

    p_Base getVariableList()
    {
        auto variableList = std::make_shared<Node>();
        variableList->setKind(Kind::VariableList);
        variableList->setSize(1);
        p_BaseArray list;

        auto variable = getVariable();
        if (!variable)
        {
            return nullptr;
        }
        Node::setParent(variable, variableList);
        list.push_back(variable);

        while (expectPeek(","))
        {
            consume();

            variable = getVariable();
            assert(variable, "expression expected in variable list");

            Node::setParent(variable, variableList);
            list.push_back(variable);
        }

        variableList->setChildren({list});
        return variableList;
    }

    p_Base getFunctionBody()
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

        auto functionBody = std::make_shared<Node>();
        functionBody->setKind(Kind::FunctionBody);
        functionBody->setSize(2);
        functionBody->setChildren({parameterList, block});
        Node::setParent(parameterList, functionBody);
        Node::setParent(block, functionBody);
        return functionBody;
    }

    p_Base getFunctionDefinition()
    {
        if (!expectPeek("function"))
        {
            return nullptr;
        }
        consume();

        auto functionBody = getFunctionBody();
        assert(functionBody, "expected function body in function definition");

        auto functionDefinition = std::make_shared<Node>();
        functionDefinition->setKind(Kind::FunctionDefinition);
        functionDefinition->setSize(2);
        functionDefinition->setChildren({std::monostate{}, functionBody});
        Node::setParent(functionBody, functionDefinition);
        return functionDefinition;
    }

    p_Base getStatement()
    {
        std::cout << "2" << std::endl;
        if (expectPeek(";"))
        {
            consume();
            auto semicolon = std::make_shared<Node>();
            semicolon->setKind(Kind::Semicolon);
            semicolon->setSize(0);
            return semicolon;
        }
        else if (expectPeek("break"))
        {
            consume();
            auto breakStatement = std::make_shared<Node>();
            breakStatement->setKind(Kind::BreakStatement);
            breakStatement->setSize(0);
            return breakStatement;
        }
        // For Luau continue
        /*else if (expectPeek("continue"))
        {
            consume();
            auto continueStatement = std::make_shared<Node>();
            continueStatement->setKind(Kind::BreakStatement);
            continueStatement->setSize(0);
            return continueStatement;
        }*/
        else if (expectPeek("if"))
        {
            consume();
            p_BaseArray list;

            auto ifStatement = std::make_shared<Node>();
            ifStatement->setKind(Kind::IfStatement);
            ifStatement->setSize(1);

            auto expression = getExpression();
            assert(expression, "expected expression in if stat");

            assert(expectPeek("then"), "expected then in if stat");
            consume();

            auto block = getBlock();


            auto conditionalBlock = std::make_shared<Node>();
            conditionalBlock->setKind(Kind::ConditionalBlock);
            conditionalBlock->setSize(2);
            conditionalBlock->setChildren({expression, block});
            conditionalBlock->setParent(ifStatement);
            Node::setParent(expression, conditionalBlock);
            Node::setParent(block, conditionalBlock);
            list.push_back(conditionalBlock);

            while (expectPeek("elseif"))
            {
                consume();

                expression = getExpression();
                assert(expression, "expected expression in elseif stat");

                assert(expectPeek("then"), "expected then in elseif stat");
                consume();

                block = getBlock();

                conditionalBlock = std::make_shared<Node>();
                conditionalBlock->setKind(Kind::ConditionalBlock);
                conditionalBlock->setSize(2);
                conditionalBlock->setChildren({expression, block});
                conditionalBlock->setParent(ifStatement);
                Node::setParent(expression, conditionalBlock);
                Node::setParent(block, conditionalBlock);
                list.push_back(conditionalBlock);
            }

            if (expectPeek("else"))
            {
                consume();

                block = getBlock();

                conditionalBlock = std::make_shared<Node>();
                conditionalBlock->setKind(Kind::ConditionalBlock);
                conditionalBlock->setSize(2);
                conditionalBlock->setChildren({std::monostate{}, block});
                conditionalBlock->setParent(ifStatement);
                Node::setParent(block, conditionalBlock);
                Node::setParent(conditionalBlock, ifStatement);
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

            auto whileStatement = std::make_shared<Node>();
            whileStatement->setKind(Kind::WhileStatement);
            whileStatement->setSize(1);

            auto conditionalBlock = std::make_shared<Node>();
            conditionalBlock->setKind(Kind::ConditionalBlock);
            conditionalBlock->setSize(2);
            conditionalBlock->setChildren({expression, block});
            conditionalBlock->setParent(whileStatement);
            Node::setParent(expression, conditionalBlock);
            Node::setParent(block, conditionalBlock);


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

            auto repeatStatement = std::make_shared<Node>();
            repeatStatement->setKind(Kind::RepeatStatement);
            repeatStatement->setSize(1);

            auto conditionalBlock = std::make_shared<Node>();
            conditionalBlock->setKind(Kind::ConditionalBlock);
            conditionalBlock->setSize(2);
            conditionalBlock->setChildren({expression, block});
            conditionalBlock->setParent(repeatStatement);
            Node::setParent(expression, conditionalBlock);
            Node::setParent(block, conditionalBlock);

            repeatStatement->setChildren({conditionalBlock});
            return repeatStatement;
        }
        else if (expectPeek("do"))
        {
            consume();

            auto block = getBlock();

            assert(expectPeek("end"), "expected end in do statement");
            consume();

            auto doStatement = std::make_shared<Node>();
            doStatement->setKind(Kind::DoStatement);
            doStatement->setSize(1);
            doStatement->setChildren({block});
            Node::setParent(block, doStatement);
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

                auto localStatement = std::make_shared<Node>();
                localStatement->setKind(Kind::LocalStatement);
                localStatement->setSize(1);

                auto functionDefinition = std::make_shared<Node>();
                functionDefinition->setKind(Kind::FunctionDefinition);
                functionDefinition->setSize(2);
                functionDefinition->setChildren({name, body});
                functionDefinition->setParent(localStatement);
                Node::setParent(name, functionDefinition);
                Node::setParent(body, functionDefinition);

                localStatement->setChildren({functionDefinition});
                return localStatement;
            }
            else
            {
                std::cout << "3" << std::endl;
                auto localStatement = std::make_shared<Node>();
                localStatement->setKind(Kind::LocalStatement);
                localStatement->setSize(1);
                std::cout << "11" << std::endl;

                auto attributeNameList = getAttributeList();
                std::cout << "12" << std::endl;
                assert(attributeNameList, "expected attribute name list in local stat");

                if (expectPeek("="))
                {
                    consume();

                    auto expressionList = getExpressionList();
                    assert(expressionList, "expected expression list in local stat");

                    auto assignmentStatement = std::make_shared<Node>();
                    assignmentStatement->setKind(Kind::AssignmentStatement);
                    assignmentStatement->setSize(2);
                    assignmentStatement->setChildren({attributeNameList, expressionList});
                    assignmentStatement->setParent(localStatement);
                    Node::setParent(attributeNameList, assignmentStatement);
                    Node::setParent(expressionList, assignmentStatement);

                    localStatement->setChildren({assignmentStatement});
                    return localStatement;
                }

                localStatement->setChildren({attributeNameList});
                std::cout << "4" << std::endl;
                Node::setParent(attributeNameList, localStatement);
                std::cout << "5" << std::endl;
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

            auto functionDefinition = std::make_shared<Node>();
            functionDefinition->setKind(Kind::FunctionDefinition);
            functionDefinition->setSize(2);
            functionDefinition->setChildren({name, body});
            Node::setParent(name, functionDefinition);
            Node::setParent(body, functionDefinition);
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

                p_Base step = nullptr;

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

                auto forStatement = std::make_shared<Node>();
                forStatement->setKind(Kind::ForStatement);
                forStatement->setSize(5);
                if (step == nullptr) {
                    forStatement->setChildren({name, init, goal, std::monostate{}, block});
                }
                else {
                    forStatement->setChildren({name, init, goal, step, block});
                }
                Node::setParent(name, forStatement);
                Node::setParent(init, forStatement);
                Node::setParent(goal, forStatement);
                Node::setParent(step, forStatement);
                Node::setParent(block, forStatement);
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

                auto forStatement = std::make_shared<Node>();
                forStatement->setKind(Kind::ForStatement);
                forStatement->setSize(3);
                forStatement->setChildren({nameList, expressionList, block});
                Node::setParent(nameList, forStatement);
                Node::setParent(expressionList, forStatement);
                Node::setParent(block, forStatement);
                return forStatement;
            }
        }
        else if (expectPeek("goto"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in goto stat");

            auto gotoStatement = std::make_shared<Node>();
            gotoStatement->setKind(Kind::GotoStatement);
            gotoStatement->setSize(1);
            gotoStatement->setChildren({name});
            Node::setParent(name, gotoStatement);
            return gotoStatement;
        }
        else if (expectPeek("::"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in label");

            assert(expectPeek("::"), "expected :: after :: in label");
            consume();

            auto label = std::make_shared<Node>();
            label->setKind(Kind::Label);
            label->setSize(1);
            label->setChildren({name});
            Node::setParent(name, label);
            return label;
        }

        if (auto variableList = getVariableList())
        {
            assert(expectPeek("="), "expected = in assignment stat");
            consume();

            auto expressionList = getExpressionList();
            assert(expressionList, "expected expression list in assignment stat");

            auto assignmentStatement = std::make_shared<Node>();
            assignmentStatement->setKind(Kind::AssignmentStatement);
            assignmentStatement->setSize(2);
            assignmentStatement->setChildren({variableList, expressionList});
            Node::setParent(variableList, assignmentStatement);
            Node::setParent(expressionList, assignmentStatement);
            return assignmentStatement;
        }
        else if (auto function_call = getFunctionCall())
        {
            return function_call;
        }

        return nullptr;
    }

    p_Base getBlock()
    {
        auto block = std::make_shared<Node>();
        block->setKind(Kind::Block);
        block->setSize(1);
        p_BaseArray list;

        while (auto stat = getStatement())
        {
            Node::setParent(stat, block);
            list.push_back(stat);
        }

        if (auto stat = getReturnStatement())
        {
            Node::setParent(stat, block);
            list.push_back(stat);
        }

        if (list.empty())
        {
            return nullptr;
        }

        block->setChildren({list});
        return block;
    }

    p_Base getChunk() {
        auto chunk = std::make_shared<Node>();
        chunk->setKind(Kind::Chunk);
        chunk->setSize(1);

        std::cout << "1" << std::endl;
        if (auto block = getBlock()) {
            Node::setParent(block, chunk);
            chunk->setChildren({block});
        }
        else {
            chunk->setChildren({std::monostate{}});
        }
        std::cout << "1 end" << std::endl;
        return chunk;
    }


    p_Base parse(const std::string& source)
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

        std::string path = "../tests/output.lua";
        auto ptr = getChunk();
        assert(ptr, "failed to parse");

        std::cout << (ptr == nullptr) << std::endl;

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

    p_Base getPrimaryExpression()
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
                auto identifier = std::make_shared<Node>();
                identifier->setChildren({consume().literal});
                identifier->setKind(Kind::Identifier);
                identifier->setSize(1);
                return identifier;
            }
            case TokenType::STRING_RAW:
            case TokenType::STRING:
            {
                auto string = std::make_shared<Node>();
                string->setChildren({consume().literal});
                string->setKind(Kind::String);
                string->setSize(1);
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
                auto number = std::make_shared<Node>();
                number->setChildren({consume().literal});
                number->setKind(Kind::Numeric);
                number->setSize(1);
                return number;
            }
            case TokenType::KEYWORD:
            {
                if (isBoolean(currentToken))
                {
                    auto boolean = std::make_shared<Node>();
                    boolean->setChildren({consume().literal});
                    boolean->setKind(Kind::Boolean);
                    boolean->setSize(1);
                    return boolean;
                }
                else if (isUnaryOperator(currentToken))
                {
                    consume();
                    auto expr = getExpression(getPrecedence(currentToken, true));
                    assert(expr, "expected expression after " + currentToken.literal);

                    auto unaryOperation = std::make_shared<Node>();
                    unaryOperation->setChildren({currentToken.literal, expr});
                    unaryOperation->setKind(Kind::UnaryOperation);
                    unaryOperation->setSize(2);
                    return unaryOperation;
                }
                else if (isNull(currentToken))
                {
                    auto null = std::make_shared<Node>();
                    null->setChildren({consume().literal});
                    null->setKind(Kind::Null);
                    null->setSize(1);
                    return null;
                }
                break;
            }
            case TokenType::PUNCTUATION:
            {
                if (currentToken.is("..."))
                {
                    auto varargs = std::make_shared<Node>();
                    varargs->setChildren({consume().literal});
                    varargs->setKind(Kind::Varargs);
                    varargs->setSize(1);
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

                    auto unaryOperation = std::make_shared<Node>();
                    unaryOperation->setChildren({currentToken.literal, expr});
                    unaryOperation->setKind(Kind::UnaryOperation);
                    unaryOperation->setSize(2);
                    return unaryOperation;
                }
                break;
            }
        }
        return nullptr;
    }

    p_Base getExpression(int precedence = 0)
    {
        if (auto lhsExpression = getFunctionDefinition())
        {
            return getRhsExpression(precedence, std::move(lhsExpression));
        }

        if (auto lhsExpression = getPrefixExpression())
        {
            return getRhsExpression(precedence, std::move(lhsExpression));
        }

        if (auto lhsExpression = getPrimaryExpression())
        {
            return getRhsExpression(precedence, std::move(lhsExpression));
        }
        return nullptr;
    }

    p_Base getRhsExpression(int minPrecedence, p_Base lhs)
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

            p_Base rhs = nullptr;

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
                    rhs = getRhsExpression(currentPrecedence + 1, std::move(rhs));
                    if (rhs == nullptr)
                    {
                        return rhs;
                    }
                }
            }

            if (isBinaryOperator(currentToken))
            {
                auto binaryOperation = std::make_shared<Node>();
                binaryOperation->setKind(Kind::BinaryOperation);
                binaryOperation->setSize(3);
                binaryOperation->setChildren({currentToken.literal, lhs, rhs});
                Node::setParent(lhs, binaryOperation);
                Node::setParent(rhs, binaryOperation);
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
