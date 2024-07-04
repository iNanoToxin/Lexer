#pragma once
#include <string>


#include "ast.h"
#include "Luau/Lexer.h"
#include "Luau/Parser.h"

using Luau::Allocator;
using Luau::AstNameTable;
using Luau::Lexeme;
using Luau::Lexer;
using Luau::DenseHashMap;
using Luau::HotComment;
using Luau::Comment;
using Luau::kParseNameError;
using Luau::ConstantNumberParseResult;

struct ParseResult
{
    AstStatBlock* root;
    size_t lines = 0;

    std::vector<HotComment> hotcomments;
    std::vector<Comment> commentLocations;
};

class Parser
{
public:
    struct ParseOptions
    {
        bool allowDeclarationSyntax = false;
        bool captureComments = false;
    };

    static ParseResult parse(
        const char* buffer,
        std::size_t bufferSize,
        AstNameTable& names,
        Allocator& allocator,
        ParseOptions options = ParseOptions(false, false)
    );

private:
    struct Name;
    struct Binding;

    Parser(
        const char* buffer,
        std::size_t bufferSize,
        AstNameTable& names,
        Allocator& allocator,
        const ParseOptions& options
    );

    bool blockFollow(const Lexeme& l);

    AstStatBlock* parseChunk();

    // chunk ::= {stat [`;']} [laststat [`;']]
    // block ::= chunk
    AstStatBlock* parseBlock(bool p_DoBlock = false);

    AstStatBlock* parseBlockNoScope(bool p_DoBlock = false);

    // stat ::=
    // varlist `=' explist |
    // functioncall |
    // do block end |
    // while exp do block end |
    // repeat block until exp |
    // if exp then block {elseif exp then block} [else block] end |
    // for Name `=' exp `,' exp [`,' exp] do block end |
    // for namelist in explist do block end |
    // [attributes] function funcname funcbody |
    // [attributes] local function Name funcbody |
    // local namelist [`=' explist]
    // laststat ::= return [explist] | break
    AstStat* parseStat();

    // if exp then block {elseif exp then block} [else block] end
    AstStat* parseIf();

    // while exp do block end
    AstStat* parseWhile();

    // repeat block until exp
    AstStat* parseRepeat();

    // do block end
    AstStat* parseDo();

    // break
    AstStat* parseBreak();

    // continue
    AstStat* parseContinue(const Location& start);

    // for Name `=' exp `,' exp [`,' exp] do block end |
    // for namelist in explist do block end |
    AstStat* parseFor();

    // funcname ::= Name {`.' Name} [`:' Name]
    AstExpr* parseFunctionName(Location start, bool& hasself, AstName& debugname);

    // function funcname funcbody
    LUAU_FORCEINLINE AstStat* parseFunctionStat(const AstArray<AstAttr*>& attributes = {nullptr, 0});

    std::pair<bool, AstAttr::Type> validateAttribute(
        const char* attributeName,
        const std::vector<AstAttr*>& attributes
    );

    // attribute ::= '@' NAME
    void parseAttribute(std::vector<AstAttr*>& attribute);

    // attributes ::= {attribute}
    AstArray<AstAttr*> parseAttributes();

    // attributes local function Name funcbody
    // attributes function funcname funcbody
    // attributes `declare function' Name`(' [parlist] `)' [`:` Type]
    // declare Name '{' Name ':' attributes `(' [parlist] `)' [`:` Type] '}'
    AstStat* parseAttributeStat();

    // local function Name funcbody |
    // local namelist [`=' explist]
    AstStat* parseLocal(const AstArray<AstAttr*>& attributes);

    // return [explist]
    AstStat* parseReturn();

    // type Name `=' Type
    AstStat* parseTypeAlias(const Location& start, bool exported);

    AstDeclaredClassProp parseDeclaredClassMethod();

    // `declare global' Name: Type |
    // `declare function' Name`(' [parlist] `)' [`:` Type]
    AstStat* parseDeclaration(const Location& start, const AstArray<AstAttr*>& attributes);

    // varlist `=' explist
    AstStat* parseAssignment(AstExpr* initial);

    // var [`+=' | `-=' | `*=' | `/=' | `%=' | `^=' | `..='] exp
    AstStat* parseCompoundAssignment(AstExpr* initial, AstExprBinary::Operator op);

    std::pair<AstLocal*, AstArray<AstLocal*>> prepareFunctionArguments(
        const Location& start,
        bool hasself,
        const std::vector<Binding>& args
    );

    // funcbodyhead ::= `(' [namelist [`,' `...'] | `...'] `)' [`:` Type]
    // funcbody ::= funcbodyhead block end
    std::pair<AstExprFunction*, AstLocal*> parseFunctionBody(
        bool hasself,
        const Lexeme& matchFunction,
        const AstName& debugname,
        const Name* localName,
        const AstArray<AstAttr*>& attributes
    );

    // explist ::= {exp `,'} exp
    void parseExprList(std::vector<AstExpr*>& result);

    // binding ::= Name [`:` Type]
    Binding parseBinding();

    // bindinglist ::= (binding | `...') {`,' bindinglist}
    // Returns the location of the vararg ..., or std::nullopt if the function is not vararg.
    std::tuple<bool, Location, AstTypePack*> parseBindingList(std::vector<Binding>& result, bool allowDot3 = false);

    AstType* parseOptionalType();

    // TypeList ::= Type [`,' TypeList]
    // ReturnType ::= Type | `(' TypeList `)'
    // TableProp ::= Name `:' Type
    // TableIndexer ::= `[' Type `]' `:' Type
    // PropList ::= (TableProp | TableIndexer) [`,' PropList]
    // Type
    //      ::= Name
    //      |   `nil`
    //      |   `{' [PropList] `}'
    //      |   `(' [TypeList] `)' `->` ReturnType

    // Returns the variadic annotation, if it exists.
    AstTypePack* parseTypeList(
        std::vector<AstType*>& result,
        std::vector<std::optional<AstArgumentName>>& resultNames
    );

    std::optional<AstTypeList> parseOptionalReturnType();
    std::pair<Location, AstTypeList> parseReturnType();

    AstTableIndexer* parseTableIndexer(AstTableAccess access, std::optional<Location> accessLocation);

    AstTypeOrPack parseFunctionType(bool allowPack, const AstArray<AstAttr*>& attributes);
    AstType* parseFunctionTypeTail(
        const Lexeme& begin,
        const AstArray<AstAttr*>& attributes,
        AstArray<AstGenericType> generics,
        AstArray<AstGenericTypePack> genericPacks,
        AstArray<AstType*> params,
        AstArray<std::optional<AstArgumentName>> paramNames,
        AstTypePack* varargAnnotation
    );

    AstType* parseTableType(bool inDeclarationContext = false);
    AstTypeOrPack parseSimpleType(bool allowPack, bool inDeclarationContext = false);

    AstTypeOrPack parseTypeOrPack();
    AstType* parseType(bool inDeclarationContext = false);

    AstTypePack* parseTypePack();
    AstTypePack* parseVariadicArgumentTypePack();

    AstType* parseTypeSuffix(AstType* type, const Location& begin);

    static std::optional<AstExprUnary::Operator> parseUnaryOp(const Lexeme& l);
    static std::optional<AstExprBinary::Operator> parseBinaryOp(const Lexeme& l);
    static std::optional<AstExprBinary::Operator> parseCompoundOp(const Lexeme& l);

    struct BinaryOpPriority
    {
        unsigned char left, right;
    };

    std::optional<AstExprUnary::Operator> checkUnaryConfusables();
    std::optional<AstExprBinary::Operator> checkBinaryConfusables(
        const BinaryOpPriority binaryPriority[],
        unsigned int limit
    );

    // subexpr -> (asexp | unop subexpr) { binop subexpr }
    // where `binop' is any binary operator with a priority higher than `limit'
    AstExpr* parseExpr(unsigned int limit = 0);

    // NAME
    AstExpr* parseNameExpr(const char* context = nullptr);

    // prefixexp -> NAME | '(' expr ')'
    AstExpr* parsePrefixExpr();

    // primaryexp -> prefixexp { `.' NAME | `[' exp `]' | `:' NAME funcargs | funcargs }
    AstExpr* parsePrimaryExpr(bool asStatement);

    // asexp -> simpleexp [`::' Type]
    AstExpr* parseAssertionExpr();

    // simpleexp -> NUMBER | STRING | NIL | true | false | ... | constructor | [attributes] FUNCTION body | primaryexp
    AstExpr* parseSimpleExpr();

    // args ::=  `(' [explist] `)' | tableconstructor | String
    AstExpr* parseFunctionArgs(AstExpr* func, bool self);

    // tableconstructor ::= `{' [fieldlist] `}'
    // fieldlist ::= field {fieldsep field} [fieldsep]
    // field ::= `[' exp `]' `=' exp | Name `=' exp | exp
    // fieldsep ::= `,' | `;'
    AstExpr* parseTableConstructor();

    // TODO: Add grammar rules here?
    AstExpr* parseIfElseExpr();

    // stringinterp ::= <INTERP_BEGIN> exp {<INTERP_MID> exp} <INTERP_END>
    AstExpr* parseInterpString();

    // Name
    std::optional<Name> parseNameOpt(const char* context = nullptr);
    Name parseName(const char* context = nullptr);
    Name parseIndexName(const char* context, const Position& previous);

    // `<' namelist `>'
    std::pair<AstArray<AstGenericType>, AstArray<AstGenericTypePack>> parseGenericTypeList(bool withDefaultValues);

    // `<' Type[, ...] `>'
    AstArray<AstTypeOrPack> parseTypeParams();

    std::optional<AstArray<char>> parseCharArray();
    AstExpr* parseString();
    AstExpr* parseNumber();

    AstLocal* pushLocal(const Binding& binding);

    unsigned int saveLocals();

    void restoreLocals(unsigned int offset);

    // check that parser is at lexeme/symbol, move to next lexeme/symbol on success, report failure and continue on failure
    bool expectAndConsume(char value, const char* context = nullptr);
    bool expectAndConsume(Lexeme::Type type, const char* context = nullptr);
    void expectAndConsumeFail(Lexeme::Type type, const char* context);

    struct MatchLexeme
    {
        MatchLexeme(const Lexeme& l)
            : type(l.type)
            , position(l.location.begin) {}

        Lexeme::Type type;
        Position position;
    };

    bool expectMatchAndConsume(char value, const MatchLexeme& begin, bool searchForMissing = false);
    void expectMatchAndConsumeFail(Lexeme::Type type, const MatchLexeme& begin, const char* extra = nullptr);
    bool expectMatchAndConsumeRecover(char value, const MatchLexeme& begin, bool searchForMissing);

    bool expectMatchEndAndConsume(Lexeme::Type type, const MatchLexeme& begin);
    void expectMatchEndAndConsumeFail(Lexeme::Type type, const MatchLexeme& begin);

    template <typename T>
    AstArray<T> copy(const T* data, std::size_t size);

    template <typename T>
    AstArray<T> copy(const std::vector<T>& data);

    template <typename T>
    AstArray<T> copy(std::initializer_list<T> data);

    AstArray<char> copy(const std::string& data);

    void incrementRecursionCounter(const char* context);

    void nextLexeme();

    struct Function
    {
        bool vararg;
        unsigned int loopDepth;

        Function()
            : vararg(false)
            , loopDepth(0) {}
    };

    struct Local
    {
        AstLocal* local;
        unsigned int offset;

        Local()
            : local(nullptr)
            , offset(0) {}
    };

    struct Name
    {
        AstName name;
        Location location;

        Name(const AstName& name, const Location& location)
            : name(name)
            , location(location) {}
    };

    struct Binding
    {
        Name name;
        AstType* annotation;

        explicit Binding(const Name& name, AstType* annotation = nullptr)
            : name(name)
            , annotation(annotation) {}
    };

    ParseOptions options;

    Lexer lexer;
    Allocator& allocator;

    std::vector<Comment> commentLocations;
    std::vector<HotComment> hotcomments;

    bool hotcommentHeader = true;

    unsigned int recursionCounter;

    AstName nameSelf;
    AstName nameNumber;
    AstName nameError;
    AstName nameNil;

    MatchLexeme endMismatchSuspect;

    std::vector<Function> functionStack;

    DenseHashMap<AstName, AstLocal*> localMap;
    std::vector<AstLocal*> localStack;

    std::vector<unsigned int> matchRecoveryStopOnToken;


    std::string scratchData;
};
