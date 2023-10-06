#ifndef LUA_PARSER_H
#define LUA_PARSER_H

#include <iostream>
#include <memory>
#include <utility>
#include <tuple>
#include <vector>
#include "tokenizer.h"

#include "Node.h"




class Parser {
public:
    std::size_t m_Index = 0;
    std::size_t m_Length = 0;
    std::vector<token> m_Tokens;

    p_Base getPrimary()
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
            {
                break;
            }
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
                if (is_boolean(currentToken))
                {
                    auto boolean = std::make_shared<Node<std::string>>();
                    boolean->setChildren({consume().literal});
                    boolean->setKind(Kind::Boolean);
                    boolean->setSize(1);
                    return boolean;
                }
                else if (is_unop(currentToken))
                {
                    consume();
                    auto expr = parse_next(get_precedence(currentToken, true));
                    assert(expr, "expected expression after " + currentToken.literal);

                    auto unaryOperator = std::make_shared<Node<std::string, p_Base>>();
                    unaryOperator->setChildren({consume().literal, expr});
                    unaryOperator->setKind(Kind::UnaryOperator);
                    unaryOperator->setSize(2);
                    return unaryOperator;
                }
                else if (is_null(currentToken))
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

                    auto expr = parse_next();
                    assert(expr, "expected expression");

                    assert(expect_peek(")"), "expected ) after (");
                    consume();

                    return expr;
                }
                else if (currentToken.is("{"))
                {
                    return get_table_contructor();
                }
                else if (is_unop(currentToken))
                {
                    consume();
                    auto expr = parse_next(get_precedence(currentToken, true));
                    assert(expr, "expected expression after " + currentToken.literal);

                    auto unaryOperator = std::make_shared<Node<std::string, p_Base>>();
                    unaryOperator->setChildren({consume().literal, expr});
                    unaryOperator->setKind(Kind::UnaryOperator);
                    unaryOperator->setSize(2);
                    return unaryOperator;
                }
                break;
            }
        }
        return nullptr;
    }

    bool next(std::size_t offset = 0) const;
    token peek(std::size_t offset = 0);
    token consume();
    std::size_t mark() const;
    void revert(std::size_t marked);

    bool expect_peek(token_type type, std::size_t offset = 0);
    bool expect_peek(const std::string& match, std::size_t offset = 0);
};


#endif //LUA_PARSER_H
