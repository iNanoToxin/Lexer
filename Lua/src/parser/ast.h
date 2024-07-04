// ReSharper disable CppPolymorphicClassWithNonVirtualPublicDestructor
#pragma once
#include <optional>
#include <vector>
#include "Luau/Ast.h"

#define AST_NODE_PUBLIC_METHODS(CLASS, KIND)    \
static constexpr Kind ClassKind = KIND;         \
void visit(AstVisitor *p_Visitor) override      \
{                                               \
    p_Visitor->visit(this);                     \
}                                               \
                                                \
std::string getClassName() const override       \
{                                               \
    return #CLASS;                              \
}

class AstVisitor
{
public:
    virtual ~AstVisitor() {}

    virtual void visit(class AstConstExprNil* p_Node) = 0;
    virtual void visit(class AstConstExprBool* p_Node) = 0;
    virtual void visit(class AstConstExprNumber* p_Node) = 0;
    virtual void visit(class AstConstExprString* p_Node) = 0;
    virtual void visit(class AstExprGroup* p_Node) = 0;
    virtual void visit(class AstExprLocal* p_Node) = 0;
    virtual void visit(class AstExprGlobal* p_Node) = 0;
    virtual void visit(class AstExprVarargs* p_Node) = 0;
    virtual void visit(class AstExprCall* p_Node) = 0;
    virtual void visit(class AstExprIndexName* p_Node) = 0;
    virtual void visit(class AstExprIndexExpr* p_Node) = 0;
    virtual void visit(class AstExprFunction* p_Node) = 0;
    virtual void visit(class AstExprTable* p_Node) = 0;
    virtual void visit(class AstExprUnary* p_Node) = 0;
    virtual void visit(class AstExprBinary* p_Node) = 0;
    virtual void visit(class AstExprTypeAssertion* p_Node) = 0;
    virtual void visit(class AstExprIfElse* p_Node) = 0;
    virtual void visit(class AstExprInterpString* p_Node) = 0;
    virtual void visit(class AstStatBlock* p_Node) = 0;
    virtual void visit(class AstStatIf* p_Node) = 0;
    virtual void visit(class AstStatWhile* p_Node) = 0;
    virtual void visit(class AstStatRepeat* p_Node) = 0;
    virtual void visit(class AstStatBreak* p_Node) = 0;
    virtual void visit(class AstStatContinue* p_Node) = 0;
    virtual void visit(class AstStatReturn* p_Node) = 0;
    virtual void visit(class AstStatExpr* p_Node) = 0;
    virtual void visit(class AstStatLocal* p_Node) = 0;
    virtual void visit(class AstStatFor* p_Node) = 0;
    virtual void visit(class AstStatForIn* p_Node) = 0;
    virtual void visit(class AstStatAssign* p_Node) = 0;
    virtual void visit(class AstStatCompoundAssign* p_Node) = 0;
    virtual void visit(class AstStatFunction* p_Node) = 0;
    virtual void visit(class AstStatLocalFunction* p_Node) = 0;
    virtual void visit(class AstStatTypeAlias* p_Node) = 0;

    virtual void visit(class AstStatDeclareGlobal* p_Node) = 0;
    virtual void visit(class AstStatDeclareFunction* p_Node) = 0;
    virtual void visit(class AstStatDeclareClass* p_Node) = 0;

    // By default, visiting type annotations is disabled; override this in your visitor if you need to!
    virtual void visit(class AstTypeReference* p_Node) = 0;
    virtual void visit(class AstTypeTable* p_Node) = 0;
    virtual void visit(class AstTypeFunction* p_Node) = 0;
    virtual void visit(class AstTypeTypeof* p_Node) = 0;
    virtual void visit(class AstTypeUnion* p_Node) = 0;
    virtual void visit(class AstTypeIntersection* p_Node) = 0;
    virtual void visit(class AstTypeSingletonBool* p_Node) = 0;
    virtual void visit(class AstTypeSingletonString* p_Node) = 0;
    virtual void visit(class AstTypePackExplicit* p_Node) = 0;
    virtual void visit(class AstTypePackVariadic* p_Node) = 0;
    virtual void visit(class AstTypePackGeneric* p_Node) = 0;
};

class AstType;
class AstTypePack;
class AstNode;

template<class T>
using AstArray = std::vector<T>;
using Luau::AstArgumentName;
using Luau::AstName;
using Luau::Location;
using Luau::Position;

#pragma region COMMON_STRUCTS
struct AstLocal
{
    AstName name;
    Location location;
    AstLocal* shadow;
    std::size_t functionDepth;
    std::size_t loopDepth;

    AstType* annotation;

    AstLocal(
        const AstName& p_Name,
        const Location& p_Location,
        AstLocal* p_Shadow,
        const std::size_t p_FunctionDepth,
        const std::size_t p_LoopDepth,
        AstType* p_Annotation
    )
        : name(p_Name)
        , location(p_Location)
        , shadow(p_Shadow)
        , functionDepth(p_FunctionDepth)
        , loopDepth(p_LoopDepth)
        , annotation(p_Annotation) {}
};

struct AstTypeList
{
    AstArray<AstType*> types;
    AstTypePack* tailType = nullptr; // nullptr indicates no tail, not an untyped tail.
};

struct AstGenericType
{
    AstName name;
    Location location;
    AstType* defaultValue = nullptr;
};

struct AstGenericTypePack
{
    AstName name;
    Location location;
    AstTypePack* defaultValue = nullptr;
};

enum class AstTableAccess
{
    Read, Write, ReadWrite
};

struct AstTableIndexer
{
    AstType* indexType;
    AstType* resultType;
    Location location;

    AstTableAccess access = AstTableAccess::ReadWrite;
    std::optional<Location> accessLocation;
};

struct AstTableProp
{
    AstName name;
    Location location;
    AstType* type;
    AstTableAccess access = AstTableAccess::ReadWrite;
    std::optional<Location> accessLocation;
};

struct AstTypeOrPack
{
    AstType* type = nullptr;
    AstTypePack* typePack = nullptr;
};

struct AstDeclaredClassProp
{
    AstName name;
    AstType* type = nullptr;
    bool isMethod = false;
};
#pragma endregion

#pragma region AST_BASE_NODE_TYPES
enum Kind
{
    ConstExprNil, ConstExprBool, ConstExprNumber, ConstExprString, ExprGroup, ExprLocal, ExprGlobal, ExprVarargs,
    ExprCall, ExprIndexName, ExprIndexExpr, ExprFunction, ExprTable, ExprUnary, ExprBinary, ExprTypeAssertion,
    ExprIfElse, ExprInterpString, StatBlock, StatIf, StatWhile, StatRepeat, StatBreak, StatContinue, StatReturn,
    StatExpr, StatLocal, StatFor, StatForIn, StatAssign, StatCompoundAssign, StatFunction, StatLocalFunction,
    StatTypeAlias, StatDeclareGlobal, StatDeclareFunction, StatDeclareClass, TypeReference, TypeTable, TypeFunction,
    TypeTypeof, TypeUnion, TypeIntersection, TypeSingletonBool, TypeSingletonString, TypePackExplicit, TypePackVariadic,
    TypePackGeneric
};

class AstNode
{
private:
    unsigned int m_Tag = 0;
    AstNode* m_Parent = nullptr;

public:
    enum Tag : unsigned int {};

    Location location;
    Kind kind;

    explicit AstNode(const Location& p_Location, const Kind p_Kind)
        : location(p_Location)
        , kind(p_Kind) {}


    void includeTag(unsigned int p_Tag);
    void excludeTag(unsigned int p_Tag);
    bool hasTagAny(unsigned int p_Tag) const;
    bool hasTagAll(unsigned int p_Tag) const;

    void setParent(AstNode* p_Parent)
    {
        m_Parent = p_Parent;
    }

    AstNode* getParent() const
    {
        return m_Parent;
    }

    template<typename T>
    bool is() const
    {
        return kind == T::ClassKind;
    }

    template<typename T>
    T* as()
    {
        return kind == T::ClassKind ? static_cast<T*>(this) : nullptr;
    }

    template<typename T>
    const T* as() const
    {
        return kind == T::ClassKind ? static_cast<const T*>(this) : nullptr;
    }

    virtual void visit(AstVisitor* p_Visitor) = 0;
    virtual std::string getClassName() const = 0;
};

class AstAttr : public AstNode
{
public:
    enum class Type
    {
        Checked, Native
    };

    Type type;

    explicit AstAttr(const Location& p_Location, const Kind p_Kind, const Type p_Type)
        : AstNode(p_Location, p_Kind)
        , type(p_Type) {}
};

class AstExpr : public AstNode
{
public:
    explicit AstExpr(const Location& p_Location, const Kind p_Kind) : AstNode(p_Location, p_Kind) {}
};

class AstStat : public AstNode
{
public:
    bool hasSemicolon = false;
    explicit AstStat(const Location& p_Location, const Kind p_Kind) : AstNode(p_Location, p_Kind) {}
};

class AstType : public AstNode
{
public:
    explicit AstType(const Location& p_Location, const Kind p_Kind) : AstNode(p_Location, p_Kind) {}
};

class AstTypePack : public AstNode
{
public:
    explicit AstTypePack(const Location& p_Location, const Kind p_Kind) : AstNode(p_Location, p_Kind) {}
};
#pragma endregion

#pragma region AST_EXPRESSIONS
class AstConstExprNil final : public AstExpr
{
public:
    explicit AstConstExprNil(const Location& p_Location);
    AST_NODE_PUBLIC_METHODS(AstConstExprNil, ConstExprNil)
};

class AstConstExprBool final : public AstExpr
{
public:
    bool value;

    explicit AstConstExprBool(const Location& p_Location, bool p_Value);
    AST_NODE_PUBLIC_METHODS(AstConstExprBool, ConstExprBool)
};

class AstConstExprNumber final : public AstExpr
{
public:
    double value;

    explicit AstConstExprNumber(const Location& p_Location, double p_Value);
    AST_NODE_PUBLIC_METHODS(AstConstExprNumber, ConstExprNumber)
};

class AstConstExprString final : public AstExpr
{
public:
    enum class QuoteStyle
    {
        Quoted, Unquoted
    };

    std::string value;
    QuoteStyle style;

    explicit AstConstExprString(const Location& p_Location, const std::string& p_Value, QuoteStyle p_Style);
    AST_NODE_PUBLIC_METHODS(AstConstExprString, ConstExprString)
};

class AstExprGroup final : public AstExpr
{
public:
    AstExpr* expr;

    explicit AstExprGroup(const Location& p_Location, AstExpr* p_Expr);
    AST_NODE_PUBLIC_METHODS(AstExprGroup, ExprGroup)
};

class AstExprLocal final : public AstExpr
{
public:
    AstLocal* local;
    bool upvalue;

    explicit AstExprLocal(const Location& p_Location, AstLocal* p_Local, bool p_Upvalue);
    AST_NODE_PUBLIC_METHODS(AstExprLocal, ExprLocal)
};

class AstExprGlobal final : public AstExpr
{
public:
    AstName name;

    explicit AstExprGlobal(const Location& p_Location, const AstName& p_Name);
    AST_NODE_PUBLIC_METHODS(AstExprGlobal, ExprGlobal)
};

class AstExprVarargs final : public AstExpr
{
public:
    explicit AstExprVarargs(const Location& p_Location);
    AST_NODE_PUBLIC_METHODS(AstExprVarargs, ExprVarargs)
};

class AstExprCall final : public AstExpr
{
public:
    AstExpr* func;
    AstArray<AstExpr*> args;
    bool self;
    Location argLocation;

    explicit AstExprCall(
        const Location& p_Location,
        AstExpr* p_Func,
        const AstArray<AstExpr*>& p_Args,
        bool p_Self,
        const Location& p_ArgLocation
    );
    AST_NODE_PUBLIC_METHODS(AstExprCall, ExprCall)
};

class AstExprIndexName final : public AstExpr
{
public:
    AstExpr* expr;
    AstName index;
    Location indexLocation;
    char op;
    Position opPosition;

    explicit AstExprIndexName(
        const Location& p_Location,
        AstExpr* p_Expr,
        const AstName& p_Index,
        const Location& p_IndexLocation,
        char p_Op,
        const Position& p_OpPosition
    );
    AST_NODE_PUBLIC_METHODS(AstExprIndexName, ExprIndexName)
};

class AstExprIndexExpr final : public AstExpr
{
public:
    AstExpr* expr;
    AstExpr* index;

    explicit AstExprIndexExpr(const Location& p_Location, AstExpr* p_Expr, AstExpr* p_Index);
    AST_NODE_PUBLIC_METHODS(AstExprIndexExpr, ExprIndexExpr)
};

class AstExprFunction final : public AstExpr
{
public:
    AstArray<AstAttr*> attributes;
    AstArray<AstGenericType> generics;
    AstArray<AstGenericTypePack> genericPacks;
    AstLocal* self;
    AstArray<AstLocal*> args;
    std::optional<AstTypeList> returnAnnotation;
    bool vararg = false;
    Location varargLocation;
    AstTypePack* varargAnnotation;
    AstStatBlock* body;

    std::size_t functionDepth;
    AstName debugname;
    std::optional<Location> argLocation;

    explicit AstExprFunction(
        const Location& p_Location,
        const AstArray<AstAttr*>& p_Attributes,
        const AstArray<AstGenericType>& p_Generics,
        const AstArray<AstGenericTypePack>& p_GenericPacks,
        AstLocal* p_Self,
        const AstArray<AstLocal*>& p_Args,
        bool p_Vararg,
        const Location& p_VarargLocation,
        AstStatBlock* p_Body,
        std::size_t p_FunctionDepth,
        const AstName& p_Debugname,
        const std::optional<AstTypeList>& p_ReturnAnnotation = {},
        AstTypePack* p_VarargAnnotation = nullptr,
        const std::optional<Location>& p_ArgLocation = std::nullopt
    );
    AST_NODE_PUBLIC_METHODS(AstExprFunction, ExprFunction)
};

class AstExprTable final : public AstExpr
{
public:
    struct Item
    {
        enum Kind
        {
            List,    // {a, b}: key -> nullptr
            Record,  // {a = 1, b = 2}: Key -> AstExprConstantString(QuoteStyle::Unquoted)
            General, // {[a] = b}
        };

        Kind kind;

        AstExpr* key; // nullptr?
        AstExpr* value;
    };

    AstArray<Item> items;

    explicit AstExprTable(const Location& p_Location, const AstArray<Item>& p_Items);
    AST_NODE_PUBLIC_METHODS(AstExprTable, ExprTable)
};

class AstExprUnary final : public AstExpr
{
public:
    enum class Operator
    {
        Minus, Not, Len
    };

    Operator op;
    AstExpr* expr;

    explicit AstExprUnary(const Location& p_Location, const Operator& p_Operator, AstExpr* p_Expr);

    std::string toString() const
    {
        switch (op)
        {
            case Operator::Minus: return "-";
            case Operator::Not: return "not";
            case Operator::Len: return "#";
        }
        return "<unknown operator>";
    }

    AST_NODE_PUBLIC_METHODS(AstExprUnary, ExprUnary)
};

class AstExprBinary final : public AstExpr
{
public:
    enum class Operator
    {
        Add, Sub, Mul, FloatDiv, FloorDiv, Mod, Pow, Concat, NotEqual, Equal, LessThan, LessEqual, GreaterThan,
        GreaterEqual, And, Or
    };

    AstExpr* left;
    Operator op;
    AstExpr* right;

    explicit AstExprBinary(const Location& p_Location, AstExpr* p_Left, const Operator& p_Operator, AstExpr* p_Right);

    std::string toString() const
    {
        switch (op)
        {
            case Operator::Add: return "+";
            case Operator::Sub: return "-";
            case Operator::Mul: return "*";
            case Operator::FloatDiv: return "/";
            case Operator::FloorDiv: return "//";
            case Operator::Mod: return "%";
            case Operator::Pow: return "^";
            case Operator::Concat: return "..";
            case Operator::NotEqual: return "~=";
            case Operator::Equal: return "==";
            case Operator::LessThan: return "<";
            case Operator::LessEqual: return "<=";
            case Operator::GreaterThan: return ">";
            case Operator::GreaterEqual: return ">=";
            case Operator::And: return "and";
            case Operator::Or: return "or";
        }
        return "<unknown operator>";
    }

    AST_NODE_PUBLIC_METHODS(AstExprBinary, ExprBinary)
};

class AstExprTypeAssertion final : public AstExpr
{
public:
    AstExpr* expr;
    AstType* annotation;

    explicit AstExprTypeAssertion(const Location& p_Location, AstExpr* p_Expr, AstType* p_Annotation);
    AST_NODE_PUBLIC_METHODS(AstExprTypeAssertion, ExprTypeAssertion)
};

class AstExprIfElse final : public AstExpr
{
public:
    struct ConditionalExpr
    {
        AstExpr* condition; // nullptr?
        AstExpr* expr;
    };

    AstArray<ConditionalExpr> expressions;

    explicit AstExprIfElse(const Location& p_Location, const AstArray<ConditionalExpr>& p_Expressions);
    AST_NODE_PUBLIC_METHODS(AstExprIfElse, ExprIfElse)
};

class AstExprInterpString final : public AstExpr
{
public:
    AstArray<std::string> strings;
    AstArray<AstExpr*> expressions;

    explicit AstExprInterpString(
        const Location& p_Location,
        const AstArray<std::string>& p_Strings,
        const AstArray<AstExpr*>& p_Expressions
    );

    AST_NODE_PUBLIC_METHODS(AstExprInterpString, ExprInterpString)
};
#pragma endregion

#pragma region AST_STATEMENTS
class AstStatBlock final : public AstStat
{
public:
    AstArray<AstStat*> body;
    bool doBlock;

    explicit AstStatBlock(const Location& p_Location, const AstArray<AstStat*>& p_Body, bool p_DoBlock);
    AST_NODE_PUBLIC_METHODS(AstStatBlock, StatBlock)
};

class AstStatIf final : public AstStat
{
public:
    struct ConditionalBlock
    {
        AstExpr* condition; // nullptr?
        AstStatBlock* block;
    };

    AstArray<ConditionalBlock> blocks;

    explicit AstStatIf(const Location& p_Location, const AstArray<ConditionalBlock>& p_Blocks);
    AST_NODE_PUBLIC_METHODS(AstStatIf, StatIf)
};

class AstStatWhile final : public AstStat
{
public:
    AstExpr* condition;
    AstStatBlock* block;

    explicit AstStatWhile(const Location& p_Location, AstExpr* p_Condition, AstStatBlock* p_Block);
    AST_NODE_PUBLIC_METHODS(AstStatWhile, StatWhile)
};

class AstStatRepeat final : public AstStat
{
public:
    AstStatBlock* block;
    AstExpr* condition;

    explicit AstStatRepeat(const Location& p_Location, AstStatBlock* p_Block, AstExpr* p_Condition);
    AST_NODE_PUBLIC_METHODS(AstStatRepeat, StatRepeat)
};

class AstStatBreak final : public AstStat
{
public:
    explicit AstStatBreak(const Location& p_Location);
    AST_NODE_PUBLIC_METHODS(AstStatBreak, StatBreak)
};

class AstStatContinue final : public AstStat
{
public:
    explicit AstStatContinue(const Location& p_Location);
    AST_NODE_PUBLIC_METHODS(AstStatContinue, StatContinue)
};

class AstStatReturn final : public AstStat
{
public:
    AstArray<AstExpr*> list;

    explicit AstStatReturn(const Location& p_Location, const AstArray<AstExpr*>& p_List);
    AST_NODE_PUBLIC_METHODS(AstStatReturn, StatReturn)
};

class AstStatExpr final : public AstStat
{
public:
    AstExpr* expr;

    explicit AstStatExpr(const Location& p_Location, AstExpr* p_Expr);
    AST_NODE_PUBLIC_METHODS(AstStatExpr, StatExpr)
};

class AstStatLocal final : public AstStat
{
public:
    AstArray<AstLocal*> vars;
    AstArray<AstExpr*> values;
    std::optional<Location> equalSignLocation;

    explicit AstStatLocal(
        const Location& p_Location,
        const AstArray<AstLocal*>& p_Vars,
        const AstArray<AstExpr*>& p_Values,
        const std::optional<Location>& p_EqualSignLocation
    );
    AST_NODE_PUBLIC_METHODS(AstStatLocal, StatLocal)
};

class AstStatFor final : public AstStat
{
public:
    AstLocal* var;
    AstExpr* from;
    AstExpr* to;
    AstExpr* step; // nullptr?
    AstStatBlock* body;

    explicit AstStatFor(
        const Location& p_Location,
        AstLocal* p_Var,
        AstExpr* p_From,
        AstExpr* p_To,
        AstExpr* p_Step,
        AstStatBlock* p_Body
    );
    AST_NODE_PUBLIC_METHODS(AstStatFor, StatFor)
};

class AstStatForIn final : public AstStat
{
public:
    AstArray<AstLocal*> vars;
    AstArray<AstExpr*> values;
    AstStatBlock* body;

    explicit AstStatForIn(
        const Location& p_Location,
        const AstArray<AstLocal*>& p_Vars,
        const AstArray<AstExpr*>& p_Values,
        AstStatBlock* p_Body
    );
    AST_NODE_PUBLIC_METHODS(AstStatForIn, StatForIn)
};

class AstStatAssign final : public AstStat
{
public:
    AstArray<AstExpr*> vars;
    AstArray<AstExpr*> values;
    Location equalSignLocation;

    explicit AstStatAssign(
        const Location& p_Location,
        const AstArray<AstExpr*>& p_Vars,
        const AstArray<AstExpr*>& p_Values,
        const Location& p_EqualSignLocation
    );
    AST_NODE_PUBLIC_METHODS(AstStatAssign, StatAssign)
};

class AstStatCompoundAssign final : public AstStat
{
public:
    AstExpr* var;
    AstExpr* value;
    AstExprBinary::Operator op;
    Location compoundEqualSignLocation;

    explicit AstStatCompoundAssign(
        const Location& p_Location,
        AstExpr* p_Var,
        AstExpr* p_Value,
        const AstExprBinary::Operator& p_Op,
        const Location& p_CompoundEqualSignLocation
    );
    AST_NODE_PUBLIC_METHODS(AstStatCompoundAssign, StatCompoundAssign)
};

class AstStatFunction final : public AstStat
{
public:
    AstExpr* name;
    AstExprFunction* func;

    explicit AstStatFunction(const Location& p_Location, AstExpr* p_Name, AstExprFunction* p_Func);
    AST_NODE_PUBLIC_METHODS(AstStatFunction, StatFunction)
};

class AstStatLocalFunction final : public AstStat
{
public:
    AstExpr* name;
    AstExprFunction* func;

    explicit AstStatLocalFunction(const Location& p_Location, AstExpr* p_Name, AstExprFunction* p_Func);
    AST_NODE_PUBLIC_METHODS(AstStatLocalFunction, StatLocalFunction)
};

class AstStatTypeAlias final : public AstStat
{
public:
    AstName name;
    Location nameLocation;
    AstArray<AstGenericType> generics;
    AstArray<AstGenericTypePack> genericPacks;
    AstType* type;
    bool exported;

    explicit AstStatTypeAlias(
        const Location& p_Location,
        const AstName& p_Name,
        const Location& p_NameLocation,
        const AstArray<AstGenericType>& p_Generics,
        const AstArray<AstGenericTypePack>& p_GenericPacks,
        AstType* p_Type,
        bool p_Exported
    );
    AST_NODE_PUBLIC_METHODS(AstStatTypeAlias, StatTypeAlias)
};

class AstStatDeclareGlobal final : public AstStat
{
public:
    AstName name;
    AstType* type;

    explicit AstStatDeclareGlobal(const Location& p_Location, const AstName& p_Name, AstType* p_Type);
    AST_NODE_PUBLIC_METHODS(AstStatDeclareGlobal, StatDeclareGlobal)
};

class AstStatDeclareFunction final : public AstStat
{
public:
    AstArray<AstAttr*> attributes;
    AstName name;
    AstArray<AstGenericType> generics;
    AstArray<AstGenericTypePack> genericPacks;
    AstTypeList params;
    AstArray<AstArgumentName> paramNames;
    AstTypeList returnTypes;

    explicit AstStatDeclareFunction(
        const Location& p_Location,
        const AstArray<AstAttr*>& p_Attributes,
        const AstName& p_Name,
        const AstArray<AstGenericType>& p_Generics,
        const AstArray<AstGenericTypePack>& p_GenericPacks,
        const AstTypeList& p_Params,
        const AstArray<AstArgumentName>& p_ParamNames,
        const AstTypeList& p_ReturnTypes
    );

    explicit AstStatDeclareFunction(
        const Location& p_Location,
        const AstName& p_Name,
        const AstArray<AstGenericType>& p_Generics,
        const AstArray<AstGenericTypePack>& p_GenericPacks,
        const AstTypeList& p_Params,
        const AstArray<AstArgumentName>& p_ParamNames,
        const AstTypeList& p_ReturnTypes
    );
    AST_NODE_PUBLIC_METHODS(AstStatDeclareGlobal, StatDeclareGlobal)
};

class AstStatDeclareClass final : public AstStat
{
public:
    AstName name;
    std::optional<AstName> superName;

    AstArray<AstDeclaredClassProp> props;
    AstTableIndexer* indexer;

    explicit AstStatDeclareClass(
        const Location& p_Location,
        const AstName& p_Name,
        std::optional<AstName> p_SuperName,
        const AstArray<AstDeclaredClassProp>& p_Props,
        AstTableIndexer* p_Indexer = nullptr
    );
    AST_NODE_PUBLIC_METHODS(AstStatDeclareClass, StatDeclareClass)
};

#pragma endregion

#pragma region AST_TYPES
class AstTypeReference final : public AstType
{
public:
    bool hasParameterList;
    std::optional<AstName> prefix;
    std::optional<Location> prefixLocation;
    AstName name;
    Location nameLocation;
    AstArray<AstTypeOrPack> parameters;

    explicit AstTypeReference(
        const Location& p_Location,
        std::optional<AstName> p_Prefix,
        AstName p_Name,
        const std::optional<Location>& p_PrefixLocation,
        const Location& p_NameLocation,
        bool p_HasParameterList = false,
        const AstArray<AstTypeOrPack>& p_Parameters = {}
    );
    AST_NODE_PUBLIC_METHODS(AstTypeReference, TypeReference)
};

class AstTypeTable final : public AstType
{
public:
    AstArray<AstTableProp> props;
    AstTableIndexer* indexer;

    explicit AstTypeTable(
        const Location& p_Location,
        const AstArray<AstTableProp>& p_Props,
        AstTableIndexer* p_Indexer
    );
    AST_NODE_PUBLIC_METHODS(AstTypeTable, TypeTable)
};

class AstTypeFunction final : public AstType
{
public:
    AstArray<AstAttr*> attributes;
    AstArray<AstGenericType> generics;
    AstArray<AstGenericTypePack> genericPacks;
    AstTypeList argTypes;
    AstArray<std::optional<AstArgumentName>> argNames;
    AstTypeList returnTypes;

    explicit AstTypeFunction(
        const Location& p_Location,
        const AstArray<AstAttr*>& p_Attributes,
        const AstArray<AstGenericType>& p_Generics,
        const AstArray<AstGenericTypePack>& p_GenericPacks,
        const AstTypeList& p_ArgTypes,
        const AstArray<std::optional<AstArgumentName>>& p_ArgNames,
        const AstTypeList& p_ReturnTypes
    );

    explicit AstTypeFunction(
        const Location& p_Location,
        const AstArray<AstGenericType>& p_Generics,
        const AstArray<AstGenericTypePack>& p_GenericPacks,
        const AstTypeList& p_ArgTypes,
        const AstArray<std::optional<AstArgumentName>>& p_ArgNames,
        const AstTypeList& p_ReturnTypes
    );
    AST_NODE_PUBLIC_METHODS(AstTypeFunction, TypeFunction)
};

class AstTypeTypeof final : public AstType
{
public:
    AstExpr* expr;

    explicit AstTypeTypeof(const Location& p_Location, AstExpr* p_Expr);
    AST_NODE_PUBLIC_METHODS(AstTypeTypeof, TypeTypeof)
};

class AstTypeUnion final : public AstType
{
public:
    AstArray<AstType*> types;

    explicit AstTypeUnion(const Location& p_Location, const AstArray<AstType*>& p_Types);
    AST_NODE_PUBLIC_METHODS(AstTypeUnion, TypeUnion)
};

class AstTypeIntersection final : public AstType
{
public:
    AstArray<AstType*> types;

    explicit AstTypeIntersection(const Location& p_Location, const AstArray<AstType*>& p_Types);
    AST_NODE_PUBLIC_METHODS(AstTypeIntersection, TypeIntersection)
};

class AstTypeSingletonBool final : public AstType
{
public:
    const bool value;

    explicit AstTypeSingletonBool(const Location& p_Location, bool p_Value);
    AST_NODE_PUBLIC_METHODS(AstTypeSingletonBool, TypeSingletonBool)
};

class AstTypeSingletonString final : public AstType
{
public:
    const std::string value;

    explicit AstTypeSingletonString(const Location& p_Location, const std::string& p_Value);
    AST_NODE_PUBLIC_METHODS(AstTypeSingletonString, TypeSingletonString)
};

class AstTypePackExplicit final : public AstTypePack
{
public:
    AstTypeList typeList;

    explicit AstTypePackExplicit(const Location& p_Location, const AstTypeList& p_TypeList);
    AST_NODE_PUBLIC_METHODS(AstTypePackExplicit, TypePackExplicit)
};

class AstTypePackVariadic final : public AstTypePack
{
public:
    AstType* variadicType;

    explicit AstTypePackVariadic(const Location& p_Location, AstType* p_VariadicType);
    AST_NODE_PUBLIC_METHODS(AstTypePackVariadic, TypePackVariadic)
};

class AstTypePackGeneric final : public AstTypePack
{
public:
    AstName genericName;

    explicit AstTypePackGeneric(const Location& p_Location, const AstName& p_GenericName);
    AST_NODE_PUBLIC_METHODS(AstTypePackGeneric, TypePackGeneric)
};
#pragma endregion
