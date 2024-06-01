#include "parser.h"

#include <fmt/format.h>
#include "ast/visitors/ast_visitor.h"
#include "utilities/assert.h"
#include "utilities/util.h"

bool is_binary_operator(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("+")
           || p_CurrentToken.is("-")
           || p_CurrentToken.is("*")
           || p_CurrentToken.is("/")
           || p_CurrentToken.is("//")
           || p_CurrentToken.is("^")
           || p_CurrentToken.is("%")
           || p_CurrentToken.is("&")
           || p_CurrentToken.is("~")
           || p_CurrentToken.is("|")
           || p_CurrentToken.is(">>")
           || p_CurrentToken.is("<<")
           || p_CurrentToken.is("..")
           || p_CurrentToken.is("<")
           || p_CurrentToken.is("<=")
           || p_CurrentToken.is(">")
           || p_CurrentToken.is(">=")
           || p_CurrentToken.is("==")
           || p_CurrentToken.is("~=")
           || p_CurrentToken.is("and")
           || p_CurrentToken.is("or");
}

bool is_field_separator(const Token& p_CurrentToken)
{
    return p_CurrentToken.is(",") || p_CurrentToken.is(";");
}

bool is_unary_operator(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("-")
           || p_CurrentToken.is("not")
           || p_CurrentToken.is("#")
           || p_CurrentToken.is("~");
}

bool is_boolean(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("true") || p_CurrentToken.is("false");
}

bool is_conditional(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("and") || p_CurrentToken.is("or");
}

bool is_null(const Token& p_CurrentToken)
{
    return p_CurrentToken.is("nil");
}

bool is_rhs_associative(const Token& p_Token)
{
    return p_Token.literal == "^" || p_Token.literal == "..";
}

std::shared_ptr<AstNode> Parser::parse(const std::string& p_Source) {
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

std::shared_ptr<AstNode> Parser::getName() {
    return expectPeek(TokenType::IDENTIFIER) ? getPrimaryExpression() : nullptr;
}

std::shared_ptr<AstNode> Parser::getAttributeName() {
    std::shared_ptr<AstNode> variable = getName();

    if (variable == nullptr)
    {
        return nullptr;
    }

    if (expectPeek("<"))
    {
        consume();

        const std::shared_ptr<AstNode> attribute = getName();
        LL_assert(attribute != nullptr, "Expected attribute after `<`.");
        LL_assert(expectPeek(">"), "Expected `>` after attribute.");
        consume();
        return AttributeNode::create(variable, attribute);
    }
    return variable;
}

std::shared_ptr<AstNode> Parser::getVariable(const bool p_IsPrefixExpression) {
    const std::size_t marked = mark();
    bool is_valid_expression = true;
    std::shared_ptr<AstNode> root = nullptr;

    while (true)
    {
        if (root == nullptr)
        {
            if (const std::shared_ptr<AstNode> name = getName())
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

            std::shared_ptr<AstNode> index = getExpression();
            LL_assert(index != nullptr, "Expected expression after `[`.");
            LL_assert(expectPeek("]"), "Expected `]` after expression.");
            consume();
            root = IndexNode::create(root, index);
            is_valid_expression = true;
        }
        else if (expectPeek("."))
        {
            consume();

            std::shared_ptr<AstNode> member = getName();
            LL_assert(member != nullptr, "Expected member name after `.`.");
            root = MemberNode::create(root, member);
            is_valid_expression = true;
        }
        else if (expectPeek(":"))
        {
            consume();

            std::shared_ptr<AstNode> method = getName();
            LL_assert(method != nullptr, "Expected method name after `:`.");
            root = MethodNode::create(root, method);

            std::shared_ptr<AstNode> argument_list = getArgumentList();
            LL_assert(argument_list != nullptr, "Expected argument list after method name.");
            root = FuncCallNode::create(root, argument_list);

            is_valid_expression = false;
        }
        else if (const std::shared_ptr<AstNode> argument_list = getArgumentList())
        {
            root = FuncCallNode::create(root, argument_list);
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

std::shared_ptr<AstNode> Parser::getAttributeList() {
    std::vector<std::shared_ptr<AstNode>> list;

    if (const std::shared_ptr<AstNode> attribute = getAttributeName())
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

        std::shared_ptr<AstNode> attribute = getAttributeName();
        LL_assert(attribute != nullptr, "Expected attribute variable after `,` in attribute list.");
        list.push_back(attribute);
    }
    return AttributeListNode::create(list);
}

std::shared_ptr<AstNode> Parser::getExpressionList() {
    std::vector<std::shared_ptr<AstNode>> list;

    if (const std::shared_ptr<AstNode> expression = getExpression())
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

        std::shared_ptr<AstNode> expression = getExpression();
        LL_assert(expression != nullptr, "Expression expected after `,` in expression list.");

        list.push_back(expression);
    }
    return ExpressionListNode::create(list);
}

std::shared_ptr<AstNode> Parser::getNameList(const bool p_IsParameterList) {
    std::vector<std::shared_ptr<AstNode>> list;

    bool running = false;
    do
    {
        if (running) consume();

        if (p_IsParameterList && expectPeek("..."))
        {
            list.push_back(getPrimaryExpression());
            return ParameterListNode::create(list);
        }

        if (std::shared_ptr<AstNode> name = getName())
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
        return ParameterListNode::create(list);
    }
    return NameListNode::create(list);
}

std::shared_ptr<AstNode> Parser::getParameterList() {
    return getNameList(true);
}

std::shared_ptr<AstNode> Parser::getFieldList() {
    std::vector<std::shared_ptr<AstNode>> list;

    while (std::shared_ptr<AstNode> field = getField())
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
    return FieldListNode::create(list);
}

std::shared_ptr<AstNode> Parser::getArgumentList() {
    if (expectPeek("("))
    {
        consume();

        const std::shared_ptr<AstNode> argument_list = getExpressionList();
        LL_assert(expectPeek(")"), "Expected `)` after arguments.");
        consume();

        return ArgumentListNode::create(argument_list);
    }
    if (expectPeek(TokenType::STRING) || expectPeek(TokenType::STRING_RAW))
    {
        return ArgumentListNode::create(getPrimaryExpression());
    }
    if (const std::shared_ptr<AstNode> table_constructor = getTableConstructor())
    {
        return ArgumentListNode::create(table_constructor);
    }
    return nullptr;
}

std::shared_ptr<AstNode> Parser::getVariableList() {
    std::shared_ptr<AstNode> variable = getVariable();
    if (!variable)
    {
        return nullptr;
    }

    std::vector<std::shared_ptr<AstNode>> list;

    list.push_back(variable);

    while (expectPeek(","))
    {
        consume();

        variable = getVariable();
        LL_assert(variable != nullptr, "Expression expected in variable list.");
        list.push_back(variable);
    }

    return VariableListNode::create(list);
}

std::shared_ptr<AstNode> Parser::getTableConstructor() {
    if (!expectPeek("{"))
    {
        return nullptr;
    }
    consume();

    const std::shared_ptr<AstNode> field_list = getFieldList();
    LL_assert(expectPeek("}"), "Expected `}` after field list in table constructor.");
    consume();

    return TableConstructorNode::create(field_list);
}

std::shared_ptr<AstNode> Parser::getField() {
    if (expectPeek("["))
    {
        consume();

        const std::shared_ptr<AstNode> index = getExpression();
        LL_assert(index != nullptr, "Expected index in table field.");
        LL_assert(expectPeek("]"), "Expected `]` after index.");
        consume();
        LL_assert(expectPeek("="), "Expected `=` after `]` in table field.");
        consume();

        const std::shared_ptr<AstNode> value = getExpression();
        LL_assert(value != nullptr, "Expected value after `=` in table field.");

        return TableIndexValueNode::create(index, value);
    }
    if (expectPeek(TokenType::IDENTIFIER) && expectPeek("=", 1))
    {
        const std::shared_ptr<AstNode> index = getName();
        LL_assert(expectPeek("="), "`Expected `=` after index in table field.");
        consume();

        const std::shared_ptr<AstNode> value = getExpression();
        LL_assert(value != nullptr, "Expected value after `=` in table field.");

        return TableNameValueNode::create(index, value);
    }
    if (const std::shared_ptr<AstNode> value = getExpression())
    {
        return TableValueNode::create(value);
    }
    return nullptr;
}

std::shared_ptr<AstNode> Parser::getFunctionName() {
    std::shared_ptr<AstNode> root = getName();
    if (root == nullptr)
    {
        return nullptr;
    }

    while (expectPeek("."))
    {
        consume();

        std::shared_ptr<AstNode> name = getName();
        LL_assert(name != nullptr, "Expected name after `.` in function name.");

        root = MemberNode::create(root, name);
    }

    if (expectPeek(":"))
    {
        consume();

        const std::shared_ptr<AstNode> name = getName();
        LL_assert(name != nullptr, "Expected name after `:` in function name.");

        root = MethodNode::create(root, name);
    }

    return FuncNameNode::create(root);
}

std::shared_ptr<AstNode> Parser::getFunctionCall() {
    const std::size_t marked = mark();
    std::shared_ptr<AstNode> expression = getPrefixExpression();

    if (expression == nullptr || !expression->is(AstKind::FuncCallNode))
    {
        revert(marked);
        return nullptr;
    }
    return expression;
}

std::shared_ptr<AstNode> Parser::getFunctionBody() {
    if (!expectPeek("("))
    {
        return nullptr;
    }
    consume();

    const std::shared_ptr<AstNode> parameter_list = getParameterList();

    LL_assert(expectPeek(")"), "Expected `)` after parameter list in `function` body.");
    consume();

    const std::shared_ptr<AstNode> block = getBlock();
    LL_assert(expectPeek("end"), "Expected `end` after `function` body.");
    consume();

    return FuncBodyNode::create(parameter_list, block);
}

std::shared_ptr<AstNode> Parser::getFunctionDefinition() {
    if (!expectPeek("function"))
    {
        return nullptr;
    }
    consume();

    const std::shared_ptr<AstNode> function_body = getFunctionBody();
    LL_assert(function_body != nullptr, "Expected function body in `function` definition.");

    return FuncDefNode::create(nullptr, function_body);
}

std::shared_ptr<AstNode> Parser::getStatement() {
    if (expectPeek(";"))
    {
        consume();
        return SemicolonNode::create();
    }
    if (expectPeek("break"))
    {
        consume();
        return BreakStat::create();
    }
    // For Luau continue
    if (expectPeek("continue"))
    {
        consume();
        return ContinueStat::create();
    }
    if (expectPeek("if"))
    {
        consume();
        std::vector<AstNodePair> list;

        std::shared_ptr<AstNode> condition = getExpression();
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

        return IfStatNode::create(list);
    }
    if (expectPeek("while"))
    {
        consume();

        std::shared_ptr<AstNode> condition = getExpression();
        LL_assert(condition != nullptr, "Expected condition in `while` statement.");
        LL_assert(expectPeek("do"), "Expected `do` in `while` statement.");
        consume();

        std::shared_ptr<AstNode> block = getBlock();
        LL_assert(expectPeek("end"), "Expected `end` after `while` statement.");
        consume();

        return WhileStatNode::create(condition, block);
    }
    if (expectPeek("repeat"))
    {
        consume();

        std::shared_ptr<AstNode> block = getBlock();
        LL_assert(expectPeek("until"), "Expected `until` in `repeat` statement.");
        consume();

        std::shared_ptr<AstNode> condition = getExpression();
        LL_assert(condition != nullptr, "Expected condition in `repeat` statement.");

        return RepeatStatNode::create(block, condition);
    }
    if (expectPeek("do"))
    {
        consume();

        std::shared_ptr<AstNode> block = getBlock();
        LL_assert(expectPeek("end"), "Expected `end` after `do` statement.");
        consume();

        return DoStatNode::create(block);
    }
    if (expectPeek("local"))
    {
        consume();

        if (expectPeek("function"))
        {
            consume();

            std::shared_ptr<AstNode> name = getName();
            LL_assert(name != nullptr, "Expected name in `local` function.");

            std::shared_ptr<AstNode> body = getFunctionBody();
            LL_assert(body != nullptr, "Expected function body in `local` function.");

            return LocalStatNode::create(FuncDefNode::create(name, body));
        }
        else
        {
            std::shared_ptr<AstNode> variable_list = getAttributeList();
            LL_assert(variable_list != nullptr, "Expected attribute name list in `local` statement.");

            if (expectPeek("="))
            {
                consume();

                std::shared_ptr<AstNode> expression_list = getExpressionList();
                LL_assert(expression_list != nullptr, "Expected expression list in `local` statement.");

                return LocalStatNode::create(AssignmentStatNode::create(variable_list, expression_list));
            }
            return LocalStatNode::create(variable_list);
        }
    }
    if (expectPeek("function"))
    {
        consume();

        std::shared_ptr<AstNode> name = getFunctionName();
        LL_assert(name != nullptr, "expected name in function");

        std::shared_ptr<AstNode> body = getFunctionBody();
        LL_assert(body != nullptr, "expected function body in function");

        return FuncDefNode::create(name, body);
    }
    if (expectPeek("for"))
    {
        consume();

        if (expectPeek("=", 1))
        {
            std::shared_ptr<AstNode> name = getName();
            LL_assert(name != nullptr, "Expected name in numeric `for` statement.");
            LL_assert(expectPeek("="), "Expected `=` in numeric `for` statement.");
            consume();

            std::shared_ptr<AstNode> init = getExpression();
            LL_assert(init != nullptr, "Expected expression in numeric `for` statement.");
            LL_assert(expectPeek(","), "expected `,` in numeric `for` statement.");
            consume();

            std::shared_ptr<AstNode> goal = getExpression();
            LL_assert(goal != nullptr, "Expected expression in numeric `for` statement.");

            std::shared_ptr<AstNode> step = nullptr;
            if (expectPeek(","))
            {
                consume();

                step = getExpression();
                LL_assert(step != nullptr, "Expected expression in numeric `for` statement.");
            }
            LL_assert(expectPeek("do"), "Expected `do` in numeric `for` statement.");
            consume();

            std::shared_ptr<AstNode> block = getBlock();
            LL_assert(expectPeek("end"), "Expected `do` in numeric `for` statement.");
            consume();

            return NumericForStatNode::create(name, init, goal, step, block);
        }
        else
        {
            std::shared_ptr<AstNode> name_list = getNameList();
            LL_assert(name_list != nullptr, "Expected name list in generic `for` statement.");
            LL_assert(expectPeek("in"), "Expected `in` after name list in generic `for` statement.");
            consume();

            std::shared_ptr<AstNode> expression_list = getExpressionList();
            LL_assert(expression_list != nullptr, "Expected expression list in generic `for` statement.");
            LL_assert(expectPeek("do"), "Expected `do` in generic `for` statement.");
            consume();

            std::shared_ptr<AstNode> block = getBlock();
            LL_assert(expectPeek("end"), "Expected `end` after generic `for` statement.");
            consume();

            return GenericForStatNode::create(name_list, expression_list, block);
        }
    }
    if (expectPeek("goto"))
    {
        consume();

        std::shared_ptr<AstNode> label = getName();
        LL_assert(label != nullptr, "Expected label in `goto` statement.");

        return GotoStatNode::create(label);
    }
    if (expectPeek("::"))
    {
        consume();

        std::shared_ptr<AstNode> label = getName();
        LL_assert(label != nullptr, "Expected label in `label` statement.");
        LL_assert(expectPeek("::"), "expected `::` after label in `label` statement.");
        consume();

        return LabelNode::create(label);
    }

    if (std::shared_ptr<AstNode> variable_list = getVariableList())
    {
        LL_assert(expectPeek("="), "Expected `=` in assignment statement.");
        consume();

        std::shared_ptr<AstNode> expression_list = getExpressionList();
        LL_assert(expression_list != nullptr, "Expected expression list in assignment statement.");

        return AssignmentStatNode::create(variable_list, expression_list);
    }
    if (std::shared_ptr<AstNode> function_call = getFunctionCall())
    {
        return function_call;
    }

    return nullptr;
}

std::shared_ptr<AstNode> Parser::getReturnStatement() {
    if (!expectPeek("return"))
    {
        return nullptr;
    }
    consume();

    const std::shared_ptr<AstNode> expression_list = getExpressionList();
    if (expectPeek(";"))
    {
        consume();
    }

    return ReturnStatNode::create(expression_list);
}

std::shared_ptr<AstNode> Parser::getBlock() {
    std::vector<std::shared_ptr<AstNode>> list;

    while (std::shared_ptr<AstNode> stat = getStatement())
    {
        list.push_back(stat);
    }

    if (const std::shared_ptr<AstNode> stat = getReturnStatement())
    {
        list.push_back(stat);
    }

    return list.empty() ? nullptr : BlockNode::create(list);
}

std::shared_ptr<AstNode> Parser::getChunk() {
    return ChunkNode::create(getBlock());
}

std::shared_ptr<AstNode> Parser::getExpression(const int p_Precedence) {
    if (const std::shared_ptr<AstNode> function_definition = getFunctionDefinition())
    {
        return getRhsExpression(p_Precedence, function_definition);
    }
    if (const std::shared_ptr<AstNode> prefix_expression = getPrefixExpression())
    {
        return getRhsExpression(p_Precedence, prefix_expression);
    }
    if (const std::shared_ptr<AstNode> primary_expression = getPrimaryExpression())
    {
        return getRhsExpression(p_Precedence, primary_expression);
    }
    return nullptr;
}

std::shared_ptr<AstNode> Parser::getPrefixExpression() {
    return getVariable(true);
}

std::shared_ptr<AstNode> Parser::getPrimaryExpression() {
    if (!next())
    {
        return nullptr;
    }

    const Token current_token = peek();

    switch (current_token.type)
    {
        case TokenType::IDENTIFIER:
        {
            return IdentifierNode::create(consume().literal);
        }
        case TokenType::STRING_RAW:
        case TokenType::STRING:
        {
            return StringNode::create(consume().literal);
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
            const std::optional<double> value = Util::to_number(consume().literal);
            return NumberNode::create(*value);
        }

        case TokenType::KEYWORD:
        {
            if (is_boolean(current_token))
            {
                return BooleanNode::create(consume().literal == "true");
            }
            if (is_unary_operator(current_token))
            {
                consume();
                const std::shared_ptr<AstNode> expression = getExpression(Util::get_precedence(true));
                LL_assert(expression != nullptr, fmt::format("Expected expression after `{}`.", current_token.literal));

                return UnaryOpNode::create(current_token.literal, expression);
            }
            if (is_null(current_token))
            {
                consume();
                return NilNode::create();
            }
            break;
        }
        case TokenType::PUNCTUATION:
        {
            if (current_token.is("..."))
            {
                consume();
                return VarargsNode::create();
            }
            if (current_token.is("("))
            {
                consume();

                std::shared_ptr<AstNode> expression = getExpression();
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
                const std::shared_ptr<AstNode> expression = getExpression(Util::get_precedence(true));
                LL_assert(expression != nullptr, fmt::format("Expected expression after `{}`.", current_token.literal));

                if (current_token.is("-"))
                {
                    return UnaryOpNode::create("-", expression);
                }
                if (current_token.is("~"))
                {
                    return UnaryOpNode::create("~", expression);
                }
                if (current_token.is("#"))
                {
                    return UnaryOpNode::create("#", expression);
                }
            }
            break;
        }
    }
    return nullptr;
}

std::shared_ptr<AstNode> Parser::getRhsExpression(const int p_Precedence, std::shared_ptr<AstNode> p_Lhs) {
    while (next())
    {
        Token current_token = peek();
        const int current_precedence = Util::get_precedence(current_token.literal);

        if (current_precedence < p_Precedence)
        {
            return p_Lhs;
        }

        consume();

        std::shared_ptr<AstNode> rhs = getFunctionDefinition();
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
            p_Lhs = BinaryOpNode::create(p_Lhs, current_token.literal, rhs);
        }
    }
    return p_Lhs;
}

bool Parser::next(const std::size_t p_Offset) const
{
    return m_Index + p_Offset < m_Length;
}

Token Parser::peek(const std::size_t p_Offset)
{
    return m_Tokens.at(m_Index + p_Offset);
}

std::size_t Parser::mark() const
{
    return m_Index;
}

void Parser::consume(std::string& p_Out, const TokenType p_Type)
{
    if (expectPeek(p_Type))
    {
        p_Out = consume().literal;
    }
}

Token Parser::consume()
{
    return m_Tokens.at(m_Index++);
}

void Parser::revert(const std::size_t p_Marked)
{
    m_Index = p_Marked;
}

bool Parser::expectPeek(const TokenType p_Type, const std::size_t p_Offset)
{
    return next(p_Offset) && peek(p_Offset).type == p_Type;
}

bool Parser::expectPeek(const std::string& p_Match, const std::size_t p_Offset)
{
    return next(p_Offset) && peek(p_Offset).literal == p_Match;
}
