#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include <iostream>
#include <memory>
#include <utility>
#include <tuple>
#include <vector>
#include "tokenizer.h"

#include "Node.h"


bool isBinaryOperator(const token& currentToken);
bool isFieldSeparator(const token& currentToken);
bool isUnaryOperator(const token& currentToken);
bool isBoolean(const token& currentToken);
bool isConditional(const token& currentToken);
bool isNull(const token& currentToken);



#define assert(condition, message)                        \
do {                                                      \
    if (!(condition)) {                                   \
        std::cerr << "Assertion `" #condition "` failed." \
        << "\n\tFile: " << __FILE__                       \
        << "\n\tFunc: " << __FUNCTION__                   \
        << "\n\tLine: " << __LINE__                       \
        << "\n\tMessage: " << message                     \
        << std::endl;                                     \
        abort();                                          \
    }                                                     \
} while (false)




class Parser
{
public:
    std::size_t m_Index = 0;
    std::size_t m_Length = 0;
    std::vector<token> m_Tokens;

    p_Base getName()
    {
        return expectPeek(token_type::IDENTIFIER) ? getPrimaryExpression() : nullptr;
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
            auto attribute = std::make_shared<Node<p_Base, p_Base>>();
            attribute->setKind(Kind::Attribute);
            attribute->setSize(2);

            auto attributeType = getName();

            assert(attributeType, "expected attribute type");
            assert(expectPeek(">"), "expected > after < in attrib");
            consume();
            Node<>::setParent<p_Base>(name, (p_Base&) attribute);
            Node<>::setParent<p_Base>(attributeType, (p_Base&) attribute);

            attribute->setChildren({name, attributeType});
            return attribute;
        }
        return name;
    }

    p_Base getAttributeList()
    {
        auto attributeList = std::make_shared<Node<p_BaseArray>>();
        attributeList->setKind(Kind::AttributeList);
        attributeList->setSize(1);
        p_BaseArray list;

        if (auto attribute = getAttributeName())
        {
            Node<>::setParent<p_Base>(attribute, (p_Base&) attributeList);
            list.push_back(attribute);
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            auto attribute = getAttributeName();
            assert(attribute, "expected attribute variable");

            Node<>::setParent<p_Base>(attribute, (p_Base&) attributeList);
            list.push_back(attribute);
        }

        attributeList->setChildren({list});
        return attributeList;
    }

    p_Base getExpressionList()
    {
        auto expressionList = std::make_shared<Node<p_BaseArray>>();
        expressionList->setKind(Kind::ExpressionList);
        expressionList->setSize(1);
        p_BaseArray list;

        if (auto expression = getExpression())
        {
            Node<>::setParent<p_Base>(expression, (p_Base&) expressionList);
            list.push_back(std::move(expression));
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            auto expression = getExpression();
            assert(expression, "expression expected");

            Node<>::setParent<p_Base>(expression, (p_Base&) expressionList);
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

        auto returnStatement = std::make_shared<Node<p_Base>>();
        returnStatement->setKind(Kind::ReturnStatement);
        returnStatement->setSize(1);

        auto expressionList = getExpressionList();
        Node<>::setParent<p_BaseArray>(expressionList, (p_Base&) returnStatement);

        if (expectPeek(";"))
        {
            consume();
        }

        returnStatement->setChildren({expressionList});
        return returnStatement;
    }

    p_Base getFunctionName()
    {
        auto functionName = std::make_shared<Node<p_Base>>();
        functionName->setKind(Kind::FunctionName);
        functionName->setSize(1);

        p_Base root = getName();
        if (!root)
        {
            return nullptr;
        }
        Node<>::setParent<p_Base>(root, (p_Base&) functionName);

        while (expectPeek("."))
        {
            consume();

            auto name = getName();
            assert(name, "expected name for function");

            auto memberExpression = std::make_shared<Node<p_Base, p_Base>>();
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

            auto methodExpression = std::make_shared<Node<p_Base, p_Base>>();
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
        auto nameList = std::make_shared<Node<p_BaseArray>>();
        nameList->setSize(1);
        p_BaseArray list;

        if (auto name = getName())
        {
            Node<>::setParent<p_Base>(name, (p_Base&) nameList);
            list.push_back(name);
        }
        else
        {
            return nullptr;
        }

        while (expectPeek(","))
        {
            if (isParameterList && expectPeek("..."))
            {
                auto varargs = getPrimaryExpression();
                Node<>::setParent<p_Base>(varargs, (p_Base&) nameList);
                list.push_back(varargs);
                break;
            }

            auto name = getName();
            assert(name, "expected name");
            Node<>::setParent<p_Base>(name, (p_Base&) nameList);
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

            auto tableIndexValueExpression = std::make_shared<Node<p_Base, p_Base>>();
            tableIndexValueExpression->setKind(Kind::TableIndexValue);
            tableIndexValueExpression->setSize(2);

            auto expression = getExpression();
            assert(expression, "expected index in field");
            Node<>::setParent<p_Base>(expression, (p_Base&) tableIndexValueExpression);

            assert(expectPeek("]"), "expected ] after [ in field");
            consume();
            assert(expectPeek("="), "expected = after ] in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");
            Node<>::setParent<p_Base>(value, (p_Base&) tableIndexValueExpression);


            tableIndexValueExpression->setChildren({expression, value});
            return tableIndexValueExpression;
        }
        else if (expectPeek(token_type::IDENTIFIER) && expectPeek("=", 1))
        {
            auto tableNameValueExpression = std::make_shared<Node<p_Base, p_Base>>();
            tableNameValueExpression->setKind(Kind::TableNameValue);
            tableNameValueExpression->setSize(2);

            auto name = getName();
            Node<>::setParent<p_Base>(name, (p_Base&) tableNameValueExpression);


            assert(expectPeek("="), "expected = after name in field");
            consume();

            auto value = getExpression();
            assert(value, "expected value in field");
            Node<>::setParent<p_Base>(value, (p_Base&) tableNameValueExpression);

            tableNameValueExpression->setChildren({name, value});
            return tableNameValueExpression;
        }
        else if (auto expression = getExpression())
        {
            auto tableValueExpression = std::make_shared<Node<p_Base>>();
            tableValueExpression->setKind(Kind::TableValue);
            tableValueExpression->setSize(1);
            tableValueExpression->setChildren({expression});
            return tableValueExpression;
        }
        return nullptr;
    }

    p_Base getFieldList()
    {
        auto fieldList = std::make_shared<Node<p_BaseArray>>();
        fieldList->setKind(Kind::FieldList);
        fieldList->setSize(1);

        p_BaseArray list;

        while (auto field = getField())
        {
            Node<>::setParent<p_Base>(field, (p_Base&) fieldList);
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

            auto argumentList = std::make_shared<Node<p_Base>>();
            argumentList->setKind(Kind::ArgumentList);
            argumentList->setSize(1);

            auto expressionList = getExpressionList();

            assert(expectPeek(")"), "expected ) after ( in args");
            consume();

            argumentList->setChildren({expressionList});
            return argumentList;
        }
        else if (expectPeek(token_type::STRING) || expectPeek(token_type::STRING_RAW))
        {
            auto argumentList = std::make_shared<Node<p_Base>>();
            argumentList->setKind(Kind::ArgumentList);
            argumentList->setSize(1);
            argumentList->setChildren({getPrimaryExpression()});
            return argumentList;
        }
        else if (auto tableConstructor = getTableConstructor())
        {
            auto argumentList = std::make_shared<Node<p_Base>>();
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

        auto tableConstructorExpression = std::make_shared<Node<p_Base>>();
        tableConstructorExpression->setKind(Kind::TableConstructor);
        tableConstructorExpression->setSize(1);

        auto fieldList = getFieldList();
        Node<>::setParent<p_Base>(fieldList, (p_Base&) tableConstructorExpression);

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

                auto indexExpression = std::make_shared<Node<p_Base, p_Base>>();
                indexExpression->setKind(Kind::Index);
                indexExpression->setSize(2);

                auto expression = getExpression();
                assert(expression, "expected expression in var");

                assert(expectPeek("]"), "expected ] after [ in var");
                consume();
                Node<>::setParent<p_Base>(root, (p_Base&) indexExpression);
                Node<>::setParent<p_Base>(expression, (p_Base&) indexExpression);

                indexExpression->setChildren({root, expression});
                root = indexExpression;
                isValidExpression = true;
            }
            else if (expectPeek("."))
            {
                consume();

                auto memberExpression = std::make_shared<Node<p_Base, p_Base>>();
                memberExpression->setKind(Kind::Member);
                memberExpression->setSize(2);

                auto name = getName();
                assert(name, "expected name in var");
                Node<>::setParent<p_Base>(root, (p_Base&) memberExpression);
                Node<>::setParent<p_Base>(name, (p_Base&) memberExpression);

                memberExpression->setChildren({root, name});
                root = memberExpression;
                isValidExpression = true;
            }
            else if (expectPeek(":"))
            {
                consume();

                auto name = getName();
                assert(name, "expected name in var");

                auto methodExpression = std::make_shared<Node<p_Base, p_Base>>();
                methodExpression->setKind(Kind::Method);
                methodExpression->setSize(2);
                methodExpression->setChildren({root, name});
                Node<>::setParent<p_Base>(root, (p_Base&) methodExpression);
                Node<>::setParent<p_Base>(name, (p_Base&) methodExpression);
                root = methodExpression;

                auto argumentList = getArgumentList();
                assert(argumentList, "expected argumentList in var");

                auto functionCall = std::make_shared<Node<p_Base, p_Base>>();
                functionCall->setKind(Kind::FunctionCall);
                functionCall->setSize(2);
                functionCall->setChildren({root, argumentList});
                Node<>::setParent<p_Base>(root, (p_Base&) functionCall);
                Node<>::setParent<p_Base>(argumentList, (p_Base&) functionCall);
                root = functionCall;

                isValidExpression = false;
            }
            else if (auto args = getArgumentList())
            {
                auto functionCall = std::make_shared<Node<p_Base, p_Base>>();
                functionCall->setKind(Kind::FunctionCall);
                functionCall->setSize(2);
                functionCall->setChildren({root, args});
                Node<>::setParent<p_Base>(root, (p_Base&) functionCall);
                Node<>::setParent<p_Base>(args, (p_Base&) functionCall);
                root = functionCall;

                isValidExpression = false;
            }
            else
            {
                break;
            }
        }

        if (!isPrefixExpression and !isValidExpression)
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
        auto variableList = std::make_shared<Node<p_BaseArray>>();
        variableList->setKind(Kind::VariableList);
        variableList->setSize(1);
        p_BaseArray list;

        auto variable = getVariable();
        if (!variable)
        {
            return nullptr;
        }
        Node<>::setParent<p_Base>(variable, (p_Base&) variableList);
        list.push_back(variable);

        while (expectPeek(","))
        {
            consume();

            variable = getVariable();
            assert(variable, "expression expected in variable list");

            Node<>::setParent<p_Base>(variable, (p_Base&) variableList);
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

        auto functionBody = std::make_shared<Node<p_Base, p_Base>>();
        functionBody->setKind(Kind::FunctionBody);
        functionBody->setSize(2);
        functionBody->setChildren({parameterList, block});
        Node<>::setParent<p_Base>(parameterList, (p_Base&) functionBody);
        Node<>::setParent<p_Base>(block, (p_Base&) functionBody);
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

        auto functionDefinition = std::make_shared<Node<p_Base, p_Base>>();
        functionDefinition->setKind(Kind::FunctionDefinition);
        functionDefinition->setSize(2);
        functionDefinition->setChildren({nullptr, functionBody});
        Node<>::setParent<p_Base>(functionBody, (p_Base&) functionDefinition);
        return functionDefinition;
    }

    p_Base getStatement()
    {
        if (expectPeek(";"))
        {
            consume();
            auto semicolon = std::make_shared<Node<>>();
            semicolon->setKind(Kind::Semicolon);
            semicolon->setSize(0);
            return semicolon;
        }
        else if (expectPeek("break"))
        {
            consume();
            auto breakStatement = std::make_shared<Node<>>();
            breakStatement->setKind(Kind::Semicolon);
            breakStatement->setSize(0);
            return breakStatement;
        }
        else if (expectPeek("if"))
        {
            p_BaseArray list;
            consume();

            auto ifStatement = std::make_shared<Node<p_BaseArray>>();
            ifStatement->setKind(Kind::IfStatement);
            ifStatement->setSize(1);

            auto expression = getExpression();
            assert(expression, "expected expression in if stat");

            assert(expectPeek("then"), "expected then in if stat");
            consume();

            auto block = getBlock();


            auto conditionalBlock = std::make_shared<Node<p_Base, p_Base>>();
            conditionalBlock->setKind(Kind::ConditionalBlock);
            conditionalBlock->setSize(2);
            conditionalBlock->setChildren({expression, block});
            conditionalBlock->setParent(ifStatement);
            Node<>::setParent<p_Base>(expression, (p_Base&) conditionalBlock);
            Node<>::setParent<p_Base>(block, (p_Base&) conditionalBlock);
            list.push_back(conditionalBlock);

            while (expectPeek("elseif"))
            {
                consume();

                expression = getExpression();
                assert(expression, "expected expression in elseif stat");

                assert(expectPeek("then"), "expected then in elseif stat");
                consume();

                block = getBlock();

                conditionalBlock = std::make_shared<Node<p_Base, p_Base>>();
                conditionalBlock->setKind(Kind::ConditionalBlock);
                conditionalBlock->setSize(2);
                conditionalBlock->setChildren({expression, block});
                conditionalBlock->setParent(ifStatement);
                Node<>::setParent<p_Base>(expression, (p_Base&) conditionalBlock);
                Node<>::setParent<p_Base>(block, (p_Base&) conditionalBlock);
                list.push_back(conditionalBlock);
            }

            if (expectPeek("else"))
            {
                consume();

                block = getBlock();

                conditionalBlock = std::make_shared<Node<p_Base, p_Base>>();
                conditionalBlock->setKind(Kind::ConditionalBlock);
                conditionalBlock->setSize(2);
                conditionalBlock->setChildren({nullptr, block});
                conditionalBlock->setParent(ifStatement);
                Node<>::setParent<p_Base>(block, (p_Base&) conditionalBlock);
                Node<>::setParent<p_Base>(conditionalBlock, (p_Base&) ifStatement);
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

            auto whileStatement = std::make_shared<Node<p_Base>>();
            whileStatement->setKind(Kind::WhileStatement);
            whileStatement->setSize(1);

            auto conditionalBlock = std::make_shared<Node<p_Base, p_Base>>();
            conditionalBlock->setKind(Kind::ConditionalBlock);
            conditionalBlock->setSize(2);
            conditionalBlock->setChildren({expression, block});
            conditionalBlock->setParent(whileStatement);
            Node<>::setParent<p_Base>(expression, (p_Base&) conditionalBlock);
            Node<>::setParent<p_Base>(block, (p_Base&) conditionalBlock);


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

            auto repeatStatement = std::make_shared<Node<p_Base>>();
            repeatStatement->setKind(Kind::RepeatStatement);
            repeatStatement->setSize(1);

            auto conditionalBlock = std::make_shared<Node<p_Base, p_Base>>();
            conditionalBlock->setKind(Kind::ConditionalBlock);
            conditionalBlock->setSize(2);
            conditionalBlock->setChildren({expression, block});
            conditionalBlock->setParent(repeatStatement);
            Node<>::setParent<p_Base>(expression, (p_Base&) conditionalBlock);
            Node<>::setParent<p_Base>(block, (p_Base&) conditionalBlock);

            repeatStatement->setChildren({conditionalBlock});
            return repeatStatement;
        }
        else if (expectPeek("do"))
        {
            consume();

            auto block = getBlock();

            assert(expectPeek("end"), "expected end in do statement");
            consume();

            auto doStatement = std::make_shared<Node<p_Base>>();
            doStatement->setKind(Kind::DoStatement);
            doStatement->setSize(1);
            doStatement->setChildren({block});
            Node<>::setParent<p_Base>(block, (p_Base&) doStatement);
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

                auto localStatement = std::make_shared<Node<p_Base>>();
                localStatement->setKind(Kind::LocalStatement);
                localStatement->setSize(1);

                auto functionDefinition = std::make_shared<Node<p_Base, p_Base>>();
                functionDefinition->setKind(Kind::FunctionDefinition);
                functionDefinition->setSize(2);
                functionDefinition->setChildren({name, body});
                functionDefinition->setParent(localStatement);
                Node<>::setParent<p_Base>(name, (p_Base&) functionDefinition);
                Node<>::setParent<p_Base>(body, (p_Base&) functionDefinition);

                localStatement->setChildren({functionDefinition});
                return localStatement;
            }
            else
            {
                auto localStatement = std::make_shared<Node<p_Base>>();
                localStatement->setKind(Kind::LocalStatement);
                localStatement->setSize(1);

                auto attributeNameList = getAttributeList();
                assert(attributeNameList, "expected attribute name list in local stat");

                if (expectPeek("="))
                {
                    consume();

                    auto expressionList = getExpressionList();
                    assert(expressionList, "expected expression list in local stat");

                    auto assignmentStatement = std::make_shared<Node<p_Base, p_Base>>();
                    assignmentStatement->setKind(Kind::AssignmentStatement);
                    assignmentStatement->setSize(2);
                    assignmentStatement->setChildren({attributeNameList, expressionList});
                    assignmentStatement->setParent(localStatement);
                    Node<>::setParent<p_Base>(attributeNameList, (p_Base&) assignmentStatement);
                    Node<>::setParent<p_Base>(expressionList, (p_Base&) assignmentStatement);

                    localStatement->setChildren({assignmentStatement});
                    return localStatement;
                }

                localStatement->setChildren({attributeNameList});
                Node<>::setParent<p_Base>(attributeNameList, (p_Base&) localStatement);
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

            auto functionDefinition = std::make_shared<Node<p_Base, p_Base>>();
            functionDefinition->setKind(Kind::FunctionDefinition);
            functionDefinition->setSize(2);
            functionDefinition->setChildren({name, body});
            Node<>::setParent<p_Base>(name, (p_Base&) functionDefinition);
            Node<>::setParent<p_Base>(body, (p_Base&) functionDefinition);
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

                auto forStatement = std::make_shared<Node<p_Base, p_Base, p_Base, p_Base, p_Base>>();
                forStatement->setKind(Kind::ForStatement);
                forStatement->setSize(5);
                forStatement->setChildren({name, init, goal, step, block});
                Node<>::setParent<p_Base>(name, (p_Base&) forStatement);
                Node<>::setParent<p_Base>(init, (p_Base&) forStatement);
                Node<>::setParent<p_Base>(goal, (p_Base&) forStatement);
                Node<>::setParent<p_Base>(step, (p_Base&) forStatement);
                Node<>::setParent<p_Base>(block, (p_Base&) forStatement);
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

                auto forStatement = std::make_shared<Node<p_Base, p_Base, p_Base>>();
                forStatement->setKind(Kind::ForStatement);
                forStatement->setSize(3);
                forStatement->setChildren({nameList, expressionList, block});
                Node<>::setParent<p_Base>(nameList, (p_Base&) forStatement);
                Node<>::setParent<p_Base>(expressionList, (p_Base&) forStatement);
                Node<>::setParent<p_Base>(block, (p_Base&) forStatement);
                return forStatement;
            }
        }
        else if (expectPeek("goto"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in goto stat");

            auto gotoStatement = std::make_shared<Node<p_Base>>();
            gotoStatement->setKind(Kind::GotoStatement);
            gotoStatement->setSize(1);
            gotoStatement->setChildren({name});
            Node<>::setParent<p_Base>(name, (p_Base&) gotoStatement);
            return gotoStatement;
        }
        else if (expectPeek("::"))
        {
            consume();

            auto name = getName();
            assert(name, "expected name in label");

            assert(expectPeek("::"), "expected :: after :: in label");
            consume();

            auto label = std::make_shared<Node<p_Base>>();
            label->setKind(Kind::Label);
            label->setSize(1);
            label->setChildren({name});
            Node<>::setParent<p_Base>(name, (p_Base&) label);
            return label;
        }

        if (auto variableList = getVariableList())
        {
            assert(expectPeek("="), "expected = in assignment stat");
            consume();

            auto expressionList = getExpressionList();
            assert(expressionList, "expected expression list in assignment stat");

            auto assignmentStatement = std::make_shared<Node<p_Base, p_Base>>();
            assignmentStatement->setKind(Kind::AssignmentStatement);
            assignmentStatement->setSize(2);
            assignmentStatement->setChildren({variableList, expressionList});
            Node<>::setParent<p_Base>(variableList, (p_Base&) assignmentStatement);
            Node<>::setParent<p_Base>(expressionList, (p_Base&) assignmentStatement);
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
        auto block = std::make_shared<Node<p_BaseArray>>();
        block->setKind(Kind::Block);
        block->setSize(1);
        p_BaseArray list;

        while (auto stat = getStatement())
        {
            Node<>::setParent<p_Base>(stat, (p_Base&) block);
            list.push_back(stat);
        }

        if (auto stat = getReturnStatement())
        {
            Node<>::setParent<p_Base>(stat, (p_Base&) block);
            list.push_back(stat);
        }

        if (list.empty())
        {
            return nullptr;
        }

        block->setChildren({list});
        return block;
    }



    p_Base parse(const std::string& source)
    {
        token_stream stream;
        stream.tokenize(source);
        m_Tokens = stream.tokens;
        m_Length = m_Tokens.size();

        // #define PRINT_TOKENS
        // #define RETURN_EARLY

        #ifdef PRINT_TOKENS
        {
            std::clog << "VIEW TOKENS: " << stream.tokens.size() << "\n";

            std::size_t max_length = 0;
            for (token& token: stream.tokens) {
                if (token.literal.length() <= 15) {
                    max_length = std::max(max_length, token.literal.length());
                }
            }

            for (token& token: stream.tokens) {
                std::string type;

                switch (token.type) {
                    case token_type::IDENTIFIER: {
                        type = "IDENTIFIER";
                        break;
                    }
                    case token_type::STRING_RAW: {
                        type = "STRING_RAW";
                        break;
                    }
                    case token_type::STRING: {
                        type = "STRING";
                        break;
                    }
                    case token_type::COMMENT_RAW: {
                        type = "COMMENT_RAW";
                        break;
                    }
                    case token_type::COMMENT: {
                        type = "COMMENT";
                        break;
                    }
                    case token_type::NUMBER_HEXADECIMAL: {
                        type = "NUMBER_HEXADECIMAL";
                        break;
                    }
                    case token_type::NUMBER_BINARY: {
                        type = "NUMBER_BINARY";
                        break;
                    }
                    case token_type::NUMBER: {
                        type = "NUMBER";
                        break;
                    }
                    case token_type::KEYWORD: {
                        type = "KEYWORD";
                        break;
                    }
                    case token_type::PUNCTUATION: {
                        type = "PUNCTUATION";
                        break;
                    }
                }

                // if (!(token.type == token_type::STRING)) {
                //     continue;
                // }

                if (token.literal.length() <= 15) {
                    std::cout << token.literal << std::string(
                        max_length - token.literal.length(),
                        ' '
                    ) << " -> " << (type) << "\n";
                }
                else {
                    std::cout << token.literal << " -> " << (type) << "\n";
                }
            }

            std::cout << "\n";
        }
        #endif

        #ifdef RETURN_EARLY
        return;
        #endif

        std::string path = "../tests/output.lua";
        auto ptr = getBlock();
        assert(ptr, "failed to parse");

        // {
        //     std::ofstream file(path);
        //     assert(file.is_open(), "Failed to open the file.");
        //     file << ptr->tostring();
        //     file.close();
        // }
        // COUT(ptr->tostring());
        return ptr;
    }


    static std::size_t getPrecedence(const token& currentToken, bool isUnaryOperation = false)
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
            return priority.size() - 1;
        }

        for (std::size_t i = 0; i < priority.size(); i++)
        {
            for (auto& e: priority[i])
            {
                if (currentToken.is(e))
                {
                    return i + 1;
                }
            }
        }
        return 0;
    }

    p_Base getPrimaryExpression()
    {
        if (!next())
        {
            return nullptr;
        }

        token currentToken = peek();

        switch (currentToken.type)
        {
            case token_type::IDENTIFIER:
            {
                auto identifier = std::make_shared<Node<std::string>>();
                identifier->setChildren({consume().literal});
                identifier->setKind(Kind::Identifier);
                identifier->setSize(1);
                return identifier;
            }
            case token_type::STRING_RAW:
            case token_type::STRING:
            {
                auto string = std::make_shared<Node<std::string>>();
                string->setChildren({consume().literal});
                string->setKind(Kind::String);
                string->setSize(1);
                return string;
            }
            case token_type::COMMENT_RAW:
            case token_type::COMMENT:
            {
                break;
            }
            case token_type::NUMBER_HEXADECIMAL:
            case token_type::NUMBER_BINARY:
            case token_type::NUMBER:
            {
                auto number = std::make_shared<Node<std::string>>();
                number->setChildren({consume().literal});
                number->setKind(Kind::Numeric);
                number->setSize(1);
                return number;
            }
            case token_type::KEYWORD:
            {
                if (isBoolean(currentToken))
                {
                    auto boolean = std::make_shared<Node<std::string>>();
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

                    auto unaryOperation = std::make_shared<Node<std::string, p_Base>>();
                    unaryOperation->setChildren({consume().literal, expr});
                    unaryOperation->setKind(Kind::UnaryOperation);
                    unaryOperation->setSize(2);
                    return unaryOperation;
                }
                else if (isNull(currentToken))
                {
                    auto null = std::make_shared<Node<std::string>>();
                    null->setChildren({consume().literal});
                    null->setKind(Kind::Null);
                    null->setSize(1);
                    return null;
                }
                break;
            }
            case token_type::PUNCTUATION:
            {
                if (currentToken.is("..."))
                {
                    auto varargs = std::make_shared<Node<std::string>>();
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

                    auto unaryOperation = std::make_shared<Node<std::string, p_Base>>();
                    unaryOperation->setChildren({consume().literal, expr});
                    unaryOperation->setKind(Kind::UnaryOperation);
                    unaryOperation->setSize(2);
                    return unaryOperation;
                }
                break;
            }
        }
        return nullptr;
    }

    p_Base getExpression(std::size_t precedence = 0)
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

    p_Base getRhsExpression(std::size_t minPrecedence, p_Base lhs)
    {
        while (next())
        {
            token currentToken = peek();
            std::size_t currentPrecedence = getPrecedence(currentToken);

            if (currentPrecedence <= minPrecedence)
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
                std::size_t next_precedence = getPrecedence(peek());
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
                auto binaryOperation = std::make_shared<Node<std::string, p_Base, p_Base>>();
                binaryOperation->setKind(Kind::BinaryOperation);
                binaryOperation->setSize(3);
                binaryOperation->setChildren({currentToken.literal, lhs, rhs});
                Node<>::setParent<p_Base>(lhs, (p_Base&) binaryOperation);
                Node<>::setParent<p_Base>(rhs, (p_Base&) binaryOperation);
                lhs = binaryOperation;
            }
        }
        return lhs;
    }




    bool next(std::size_t offset = 0) const;

    token peek(std::size_t offset = 0);

    token consume();

    std::size_t mark() const;

    void revert(std::size_t marked);

    bool expectPeek(token_type type, std::size_t offset = 0);

    bool expectPeek(const std::string& match, std::size_t offset = 0);
};


#endif //LUA_PARSER_H
