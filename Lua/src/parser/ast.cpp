#include "ast.h"

void AstNode::includeTag(const unsigned int p_Tag)
{
    m_Tag |= p_Tag;
}

void AstNode::excludeTag(const unsigned int p_Tag)
{
    m_Tag &= ~p_Tag;
}

bool AstNode::hasTagAny(const unsigned int p_Tag) const
{
    return (m_Tag & p_Tag) != 0u;
}

bool AstNode::hasTagAll(const unsigned int p_Tag) const
{
    return (m_Tag & p_Tag) == p_Tag;
}

#pragma region SET_PARENT_FUNCTIONS
template<class T>
void set_parent(T* p_Node, AstNode* p_Parent)
{
    if (p_Node)
    {
        p_Node->setParent(p_Parent);
    }
}

template<class T>
void set_parent(const AstArray<T>& p_List, AstNode* p_Parent)
{
    for (const T& object : p_List)
    {
        set_parent(object, p_Parent);
    }
}

// ReSharper disable once CppParameterMayBeConstPtrOrRef
void set_parent(AstLocal* p_Local, AstNode* p_Parent)
{
    set_parent(p_Local->annotation, p_Parent);
}

void set_parent(const AstTypeList& p_TypeList, AstNode* p_Parent)
{
    set_parent(p_TypeList.types, p_Parent);
    set_parent(p_TypeList.tailType, p_Parent);
}

void set_parent(const AstGenericType& p_Type, AstNode* p_Parent)
{
    set_parent(p_Type.defaultValue, p_Parent);
}

void set_parent(const AstGenericTypePack& p_Type, AstNode* p_Parent)
{
    set_parent(p_Type.defaultValue, p_Parent);
}

// ReSharper disable once CppParameterMayBeConstPtrOrRef
void set_parent(AstTableIndexer* p_TableIndexer, AstNode* p_Parent)
{
    set_parent(p_TableIndexer->indexType, p_Parent);
    set_parent(p_TableIndexer->resultType, p_Parent);
}

void set_parent(const AstTableProp& p_TableProp, AstNode* p_Parent)
{
    set_parent(p_TableProp.type, p_Parent);
}

void set_parent(const AstTypeOrPack& p_TypeOrPack, AstNode* p_Parent)
{
    set_parent(p_TypeOrPack.type, p_Parent);
    set_parent(p_TypeOrPack.typePack, p_Parent);
}

void set_parent(const AstDeclaredClassProp& p_DeclaredClassProp, AstNode* p_Parent)
{
    set_parent(p_DeclaredClassProp.type, p_Parent);
}

void set_parent(const AstExprTable::Item& p_Item, AstNode* p_Parent)
{
    switch (p_Item.kind)
    {
        case AstExprTable::Item::List:
        {
            set_parent(p_Item.value, p_Parent);
            break;
        }
        case AstExprTable::Item::Record:
        case AstExprTable::Item::General:
        {
            set_parent(p_Item.key, p_Parent);
            set_parent(p_Item.value, p_Parent);
            break;
        }
    }
}

void set_parent(const AstExprIfElse::ConditionalExpr& p_Statement, AstNode* p_Parent)
{
    set_parent(p_Statement.condition, p_Parent);
    set_parent(p_Statement.expr, p_Parent);
}

void set_parent(const AstStatIf::ConditionalBlock& p_Statement, AstNode* p_Parent)
{
    set_parent(p_Statement.condition, p_Parent);
    set_parent(p_Statement.block, p_Parent);
}
#pragma endregion

#pragma region AST_EXPRESSION_CONSTRUCTOR
AstConstExprNil::AstConstExprNil(const Location& p_Location) : AstExpr(p_Location, ConstExprNil) {}

AstConstExprBool::AstConstExprBool(const Location& p_Location, const bool p_Value)
    : AstExpr(p_Location, ConstExprBool)
    , value(p_Value) {}

AstConstExprNumber::AstConstExprNumber(const Location& p_Location, const double p_Value)
    : AstExpr(p_Location, ConstExprNumber)
    , value(p_Value) {}

AstConstExprString::AstConstExprString(const Location& p_Location, const std::string& p_Value, const QuoteStyle p_Style)
    : AstExpr(p_Location, ConstExprString)
    , value(p_Value)
    , style(p_Style) {}

AstExprGroup::AstExprGroup(const Location& p_Location, AstExpr* p_Expr)
    : AstExpr(p_Location, ExprGroup)
    , expr(p_Expr) {}

AstExprLocal::AstExprLocal(const Location& p_Location, AstLocal* p_Local, const bool p_Upvalue)
    : AstExpr(p_Location, ExprLocal)
    , local(p_Local)
    , upvalue(p_Upvalue)
{
    set_parent(local, this);
}

AstExprGlobal::AstExprGlobal(const Location& p_Location, const AstName& p_Name)
    : AstExpr(p_Location, ExprGlobal)
    , name(p_Name) {}

AstExprVarargs::AstExprVarargs(const Location& p_Location) : AstExpr(p_Location, ExprVarargs) {}

AstExprCall::AstExprCall(
    const Location& p_Location,
    AstExpr* p_Func,
    const AstArray<AstExpr*>& p_Args,
    const bool p_Self,
    const Location& p_ArgLocation
)
    : AstExpr(p_Location, ExprCall)
    , func(p_Func)
    , args(p_Args)
    , self(p_Self)
    , argLocation(p_ArgLocation)
{
    set_parent(func, this);
    set_parent(args, this);
}

AstExprIndexName::AstExprIndexName(
    const Location& p_Location,
    AstExpr* p_Expr,
    const AstName& p_Index,
    const Location& p_IndexLocation,
    const char p_Op,
    const Position& p_OpPosition
)
    : AstExpr(p_Location, ExprIndexName)
    , expr(p_Expr)
    , index(p_Index)
    , indexLocation(p_IndexLocation)
    , op(p_Op)
    , opPosition(p_OpPosition)
{
    set_parent(expr, this);
}

AstExprIndexExpr::AstExprIndexExpr(const Location& p_Location, AstExpr* p_Expr, AstExpr* p_Index)
    : AstExpr(p_Location, ExprIndexExpr)
    , expr(p_Expr)
    , index(p_Index)
{
    set_parent(expr, this);
    set_parent(index, this);
}

AstExprFunction::AstExprFunction(
    const Location& p_Location,
    const AstArray<AstAttr*>& p_Attributes,
    const AstArray<AstGenericType>& p_Generics,
    const AstArray<AstGenericTypePack>& p_GenericPacks,
    AstLocal* p_Self,
    const AstArray<AstLocal*>& p_Args,
    const bool p_Vararg,
    const Location& p_VarargLocation,
    AstStatBlock* p_Body,
    const std::size_t p_FunctionDepth,
    const AstName& p_Debugname,
    const std::optional<AstTypeList>& p_ReturnAnnotation,
    AstTypePack* p_VarargAnnotation,
    const std::optional<Location>& p_ArgLocation
)
    : AstExpr(p_Location, ExprFunction)
    , attributes(p_Attributes)
    , generics(p_Generics)
    , genericPacks(p_GenericPacks)
    , self(p_Self)
    , args(p_Args)
    , returnAnnotation(p_ReturnAnnotation)
    , vararg(p_Vararg)
    , varargLocation(p_VarargLocation)
    , varargAnnotation(p_VarargAnnotation)
    , body(p_Body)
    , functionDepth(p_FunctionDepth)
    , debugname(p_Debugname)
    , argLocation(p_ArgLocation)
{
    set_parent(attributes, this);
    set_parent(generics, this);
    set_parent(genericPacks, this);
    set_parent(self, this);
    set_parent(args, this);
    if (returnAnnotation.has_value())
    {
        set_parent(returnAnnotation.value(), this);
    }
    set_parent(varargAnnotation, this);
    set_parent(body, this);
}

AstExprTable::AstExprTable(const Location& p_Location, const AstArray<Item>& p_Items)
    : AstExpr(p_Location, ExprTable)
    , items(p_Items)
{
    set_parent(items, this);
}

AstExprUnary::AstExprUnary(const Location& p_Location, const Operator& p_Operator, AstExpr* p_Expr)
    : AstExpr(p_Location, ExprUnary)
    , op(p_Operator)
    , expr(p_Expr)
{
    set_parent(expr, this);
}

AstExprBinary::AstExprBinary(const Location& p_Location, AstExpr* p_Left, const Operator& p_Operator, AstExpr* p_Right)
    : AstExpr(p_Location, ExprBinary)
    , left(p_Left)
    , op(p_Operator)
    , right(p_Right)
{
    set_parent(left, this);
    set_parent(right, this);
}

AstExprTypeAssertion::AstExprTypeAssertion(const Location& p_Location, AstExpr* p_Expr, AstType* p_Annotation)
    : AstExpr(p_Location, ExprTypeAssertion)
    , expr(p_Expr)
    , annotation(p_Annotation)
{
    set_parent(expr, this);
    set_parent(annotation, this);
}

AstExprIfElse::AstExprIfElse(const Location& p_Location, const AstArray<ConditionalExpr>& p_Expressions)
    : AstExpr(p_Location, ExprIfElse)
    , expressions(p_Expressions)
{
    set_parent(expressions, this);
}

AstExprInterpString::AstExprInterpString(
    const Location& p_Location,
    const AstArray<std::string>& p_Strings,
    const AstArray<AstExpr*>& p_Expressions
)
    : AstExpr(p_Location, ExprInterpString)
    , strings(p_Strings)
    , expressions(p_Expressions)
{
    set_parent(p_Expressions, this);
}
#pragma endregion

#pragma region AST_STATEMENT_CONSTRUCTOR
AstStatBlock::AstStatBlock(const Location& p_Location, const AstArray<AstStat*>& p_Body, const bool p_DoBlock)
    : AstStat(p_Location, StatBlock)
    , body(p_Body)
    , doBlock(p_DoBlock)
{
    set_parent(body, this);
}

AstStatIf::AstStatIf(const Location& p_Location, const AstArray<ConditionalBlock>& p_Blocks)
    : AstStat(p_Location, StatIf)
    , blocks(p_Blocks)
{
    set_parent(blocks, this);
}

AstStatWhile::AstStatWhile(const Location& p_Location, AstExpr* p_Condition, AstStatBlock* p_Block)
    : AstStat(p_Location, StatWhile)
    , condition(p_Condition)
    , block(p_Block)
{
    set_parent(condition, this);
    set_parent(block, this);
}

AstStatRepeat::AstStatRepeat(const Location& p_Location, AstStatBlock* p_Block, AstExpr* p_Condition)
    : AstStat(p_Location, StatRepeat)
    , block(p_Block)
    , condition(p_Condition)
{
    set_parent(block, this);
    set_parent(condition, this);
}

AstStatBreak::AstStatBreak(const Location& p_Location): AstStat(p_Location, StatBreak) {}

AstStatContinue::AstStatContinue(const Location& p_Location): AstStat(p_Location, StatContinue) {}

AstStatReturn::AstStatReturn(const Location& p_Location, const AstArray<AstExpr*>& p_List)
    : AstStat(p_Location, StatReturn)
    , list(p_List)
{
    set_parent(list, this);
}

AstStatExpr::AstStatExpr(const Location& p_Location, AstExpr* p_Expr)
    : AstStat(p_Location, StatExpr)
    , expr(p_Expr)
{
    set_parent(expr, this);
}

AstStatLocal::AstStatLocal(
    const Location& p_Location,
    const AstArray<AstLocal*>& p_Vars,
    const AstArray<AstExpr*>& p_Values,
    const std::optional<Location>& p_EqualSignLocation
)
    : AstStat(p_Location, StatLocal)
    , vars(p_Vars)
    , values(p_Values)
    , equalSignLocation(p_EqualSignLocation)
{
    set_parent(p_Vars, this);
    set_parent(p_Values, this);
}

AstStatFor::AstStatFor(
    const Location& p_Location,
    AstLocal* p_Var,
    AstExpr* p_From,
    AstExpr* p_To,
    AstExpr* p_Step,
    AstStatBlock* p_Body
)
    : AstStat(p_Location, StatFor)
    , var(p_Var)
    , from(p_From)
    , to(p_To)
    , step(p_Step)
    , body(p_Body)
{
    set_parent(var, this);
    set_parent(from, this);
    set_parent(to, this);
    set_parent(step, this);
    set_parent(body, this);
}

AstStatForIn::AstStatForIn(
    const Location& p_Location,
    const AstArray<AstLocal*>& p_Vars,
    const AstArray<AstExpr*>& p_Values,
    AstStatBlock* p_Body
)
    : AstStat(p_Location, StatForIn)
    , vars(p_Vars)
    , values(p_Values)
    , body(p_Body)
{
    set_parent(vars, this);
    set_parent(values, this);
    set_parent(body, this);
}

AstStatAssign::AstStatAssign(
    const Location& p_Location,
    const AstArray<AstExpr*>& p_Vars,
    const AstArray<AstExpr*>& p_Values,
    const Location& p_EqualSignLocation
)
    : AstStat(p_Location, StatAssign)
    , vars(p_Vars)
    , values(p_Values)
    , equalSignLocation(p_EqualSignLocation)
{
    set_parent(vars, this);
    set_parent(values, this);
}

AstStatCompoundAssign::AstStatCompoundAssign(
    const Location& p_Location,
    AstExpr* p_Var,
    AstExpr* p_Value,
    const AstExprBinary::Operator& p_Op,
    const Location& p_CompoundEqualSignLocation
)
    : AstStat(p_Location, StatCompoundAssign)
    , var(p_Var)
    , value(p_Value)
    , op(p_Op)
    , compoundEqualSignLocation(p_CompoundEqualSignLocation)
{
    set_parent(var, this);
    set_parent(value, this);
}

AstStatFunction::AstStatFunction(const Location& p_Location, AstExpr* p_Name, AstExprFunction* p_Func)
    : AstStat(p_Location, StatFunction)
    , name(p_Name)
    , func(p_Func)
{
    set_parent(name, this);
    set_parent(func, this);
}

AstStatLocalFunction::AstStatLocalFunction(const Location& p_Location, AstExpr* p_Name, AstExprFunction* p_Func)
    : AstStat(p_Location, StatLocalFunction)
    , name(p_Name)
    , func(p_Func)
{
    set_parent(name, this);
    set_parent(func, this);
}

AstStatTypeAlias::AstStatTypeAlias(
    const Location& p_Location,
    const AstName& p_Name,
    const Location& p_NameLocation,
    const AstArray<AstGenericType>& p_Generics,
    const AstArray<AstGenericTypePack>& p_GenericPacks,
    AstType* p_Type,
    const bool p_Exported
)
    : AstStat(p_Location, StatTypeAlias)
    , name(p_Name)
    , nameLocation(p_NameLocation)
    , generics(p_Generics)
    , genericPacks(p_GenericPacks)
    , type(p_Type)
    , exported(p_Exported)
{
    set_parent(generics, this);
    set_parent(genericPacks, this);
    set_parent(type, this);
}

AstStatDeclareGlobal::AstStatDeclareGlobal(const Location& p_Location, const AstName& p_Name, AstType* p_Type)
    : AstStat(p_Location, StatDeclareGlobal)
    , name(p_Name)
    , type(p_Type)
{
    set_parent(type, this);
}

AstStatDeclareFunction::AstStatDeclareFunction(
    const Location& p_Location,
    const AstArray<AstAttr*>& p_Attributes,
    const AstName& p_Name,
    const AstArray<AstGenericType>& p_Generics,
    const AstArray<AstGenericTypePack>& p_GenericPacks,
    const AstTypeList& p_Params,
    const AstArray<AstArgumentName>& p_ParamNames,
    const AstTypeList& p_ReturnTypes
)
    : AstStat(p_Location, StatDeclareFunction)
    , attributes(p_Attributes)
    , name(p_Name)
    , generics(p_Generics)
    , genericPacks(p_GenericPacks)
    , params(p_Params)
    , paramNames(p_ParamNames)
    , returnTypes(p_ReturnTypes)
{
    set_parent(attributes, this);
    set_parent(generics, this);
    set_parent(genericPacks, this);
    set_parent(params, this);
    set_parent(returnTypes, this);
}

AstStatDeclareFunction::AstStatDeclareFunction(
    const Location& p_Location,
    const AstName& p_Name,
    const AstArray<AstGenericType>& p_Generics,
    const AstArray<AstGenericTypePack>& p_GenericPacks,
    const AstTypeList& p_Params,
    const AstArray<AstArgumentName>& p_ParamNames,
    const AstTypeList& p_ReturnTypes
)
    : AstStatDeclareFunction(
        p_Location,
        {},
        p_Name,
        p_Generics,
        p_GenericPacks,
        p_Params,
        p_ParamNames,
        p_ReturnTypes
    ) {}

AstStatDeclareClass::AstStatDeclareClass(
    const Location& p_Location,
    const AstName& p_Name,
    const std::optional<AstName> p_SuperName,
    const AstArray<AstDeclaredClassProp>& p_Props,
    AstTableIndexer* p_Indexer
)
    : AstStat(p_Location, StatDeclareClass)
    , name(p_Name)
    , superName(p_SuperName)
    , props(p_Props)
    , indexer(p_Indexer)
{
    set_parent(props, this);
    set_parent(indexer, this);
}
#pragma endregion

#pragma region AST_TYPES_CONSTRUCTOR
AstTypeReference::AstTypeReference(
    const Location& p_Location,
    const std::optional<AstName> p_Prefix,
    const AstName p_Name,
    const std::optional<Location>& p_PrefixLocation,
    const Location& p_NameLocation,
    const bool p_HasParameterList,
    const AstArray<AstTypeOrPack>& p_Parameters
)
    : AstType(p_Location, TypeReference)
    , hasParameterList(p_HasParameterList)
    , prefix(p_Prefix)
    , prefixLocation(p_PrefixLocation)
    , name(p_Name)
    , nameLocation(p_NameLocation)
    , parameters(p_Parameters)
{
    set_parent(parameters, this);
}

AstTypeTable::AstTypeTable(
    const Location& p_Location,
    const AstArray<AstTableProp>& p_Props,
    AstTableIndexer* p_Indexer
)
    : AstType(p_Location, TypeTable)
    , props(p_Props)
    , indexer(p_Indexer)
{
    set_parent(props, this);
    set_parent(indexer, this);
}

AstTypeFunction::AstTypeFunction(
    const Location& p_Location,
    const AstArray<AstAttr*>& p_Attributes,
    const AstArray<AstGenericType>& p_Generics,
    const AstArray<AstGenericTypePack>& p_GenericPacks,
    const AstTypeList& p_ArgTypes,
    const AstArray<std::optional<AstArgumentName>>& p_ArgNames,
    const AstTypeList& p_ReturnTypes
)
    : AstType(p_Location, TypeFunction)
    , attributes(p_Attributes)
    , generics(p_Generics)
    , genericPacks(p_GenericPacks)
    , argTypes(p_ArgTypes)
    , argNames(p_ArgNames)
    , returnTypes(p_ReturnTypes)
{
    set_parent(attributes, this);
    set_parent(generics, this);
    set_parent(genericPacks, this);
    set_parent(argTypes, this);
    set_parent(returnTypes, this);
}

AstTypeFunction::AstTypeFunction(
    const Location& p_Location,
    const AstArray<AstGenericType>& p_Generics,
    const AstArray<AstGenericTypePack>& p_GenericPacks,
    const AstTypeList& p_ArgTypes,
    const AstArray<std::optional<AstArgumentName>>& p_ArgNames,
    const AstTypeList& p_ReturnTypes
) : AstTypeFunction(p_Location, {}, p_Generics, p_GenericPacks, p_ArgTypes, p_ArgNames, p_ReturnTypes) {}

AstTypeTypeof::AstTypeTypeof(const Location& p_Location, AstExpr* p_Expr)
    : AstType(p_Location, TypeTypeof)
    , expr(p_Expr)
{
    set_parent(expr, this);
}

AstTypeUnion::AstTypeUnion(const Location& p_Location, const AstArray<AstType*>& p_Types)
    : AstType(p_Location, TypeUnion)
    , types(p_Types)
{
    set_parent(types, this);
}

AstTypeIntersection::AstTypeIntersection(const Location& p_Location, const AstArray<AstType*>& p_Types)
    : AstType(p_Location, TypeIntersection)
    , types(p_Types)
{
    set_parent(types, this);
}

AstTypeSingletonBool::AstTypeSingletonBool(const Location& p_Location, const bool p_Value)
    : AstType(p_Location, TypeSingletonBool)
    , value(p_Value) {}

AstTypeSingletonString::AstTypeSingletonString(const Location& p_Location, const std::string& p_Value)
    : AstType(p_Location, TypeSingletonString)
    , value(p_Value) {}

AstTypePackExplicit::AstTypePackExplicit(const Location& p_Location, const AstTypeList& p_TypeList)
    : AstTypePack(p_Location, TypePackExplicit)
    , typeList(p_TypeList)
{
    set_parent(typeList, this);
}

AstTypePackVariadic::AstTypePackVariadic(const Location& p_Location, AstType* p_VariadicType)
    : AstTypePack(p_Location, TypePackVariadic)
    , variadicType(p_VariadicType)
{
    set_parent(variadicType, this);
}

AstTypePackGeneric::AstTypePackGeneric(const Location& p_Location, const AstName& p_GenericName)
    : AstTypePack(p_Location, TypePackGeneric)
    , genericName(p_GenericName) {}
#pragma endregion
