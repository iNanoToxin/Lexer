#ifndef ASTVISITOR_H
#define ASTVISITOR_H

#include <ast/attribute_node.h>
#include <ast/boolean_node.h>
#include <ast/identifier_node.h>
#include <ast/nil_node.h>
#include <ast/number_node.h>
#include <ast/string_node.h>
#include <ast/varargs_node.h>

#include <ast/binary_op_node.h>
#include <ast/unary_op_node.h>

#include <ast/argument_list_node.h>
#include <ast/attribute_list_node.h>
#include <ast/expression_list_node.h>
#include <ast/field_list_node.h>
#include <ast/name_list_node.h>
#include <ast/parameter_list_node.h>
#include <ast/variable_list_node.h>

#include <ast/block_node.h>
#include <ast/chunk_node.h>

#include <ast/assignment_stat_node.h>
#include <ast/break_stat.h>
#include <ast/continue_stat.h>
#include <ast/do_stat_node.h>
#include <ast/generic_for_stat_node.h>
#include <ast/goto_stat_node.h>
#include <ast/if_stat_node.h>
#include <ast/local_stat_node.h>
#include <ast/numeric_for_stat_node.h>
#include <ast/repeat_stat_node.h>
#include <ast/return_stat_node.h>
#include <ast/while_stat_node.h>

#include <ast/index_node.h>
#include <ast/member_node.h>
#include <ast/method_node.h>

#include <ast/table_constructor_node.h>
#include <ast/table_index_value_node.h>
#include <ast/table_name_value_node.h>
#include <ast/table_value_node.h>

#include <ast/func_body_node.h>
#include <ast/func_call_node.h>
#include <ast/func_def_node.h>
#include <ast/func_name_node.h>

#include <ast/label_node.h>
#include <ast/semicolon_node.h>

#include "../ast_node.h"

class AttributeNode;
class BooleanNode;
class IdentifierNode;
class NilNode;
class NumberNode;
class StringNode;
class VarargsNode;
class BinaryOpNode;
class UnaryOpNode;
class ArgumentListNode;
class AttributeListNode;
class ExpressionListNode;
class FieldListNode;
class NameListNode;
class ParameterListNode;
class VariableListNode;
class BlockNode;
class ChunkNode;
class AssignmentStatNode;
class BreakStat;
class ContinueStat;
class DoStatNode;
class GenericForStatNode;
class GotoStatNode;
class IfStatNode;
class LocalStatNode;
class NumericForStatNode;
class RepeatStatNode;
class ReturnStatNode;
class WhileStatNode;
class IndexNode;
class MemberNode;
class MethodNode;
class TableConstructorNode;
class TableIndexValueNode;
class TableNameValueNode;
class TableValueNode;
class FuncBodyNode;
class FuncCallNode;
class FuncDefNode;
class FuncNameNode;
class LabelNode;
class SemicolonNode;

class AstVisitor {
public:
    virtual ~AstVisitor() = default;
    virtual void visit(AttributeNode* p_Node) = 0;
    virtual void visit(BooleanNode* p_Node) = 0;
    virtual void visit(IdentifierNode* p_Node) = 0;
    virtual void visit(NilNode* p_Node) = 0;
    virtual void visit(NumberNode* p_Node) = 0;
    virtual void visit(StringNode* p_Node) = 0;
    virtual void visit(VarargsNode* p_Node) = 0;
    virtual void visit(BinaryOpNode* p_Node) = 0;
    virtual void visit(UnaryOpNode* p_Node) = 0;
    virtual void visit(ArgumentListNode* p_Node) = 0;
    virtual void visit(AttributeListNode* p_Node) = 0;
    virtual void visit(ExpressionListNode* p_Node) = 0;
    virtual void visit(FieldListNode* p_Node) = 0;
    virtual void visit(NameListNode* p_Node) = 0;
    virtual void visit(ParameterListNode* p_Node) = 0;
    virtual void visit(VariableListNode* p_Node) = 0;
    virtual void visit(BlockNode* p_Node) = 0;
    virtual void visit(ChunkNode* p_Node) = 0;
    virtual void visit(AssignmentStatNode* p_Node) = 0;
    virtual void visit(BreakStat* p_Node) = 0;
    virtual void visit(ContinueStat* p_Node) = 0;
    virtual void visit(DoStatNode* p_Node) = 0;
    virtual void visit(GenericForStatNode* p_Node) = 0;
    virtual void visit(GotoStatNode* p_Node) = 0;
    virtual void visit(IfStatNode* p_Node) = 0;
    virtual void visit(LocalStatNode* p_Node) = 0;
    virtual void visit(NumericForStatNode* p_Node) = 0;
    virtual void visit(RepeatStatNode* p_Node) = 0;
    virtual void visit(ReturnStatNode* p_Node) = 0;
    virtual void visit(WhileStatNode* p_Node) = 0;
    virtual void visit(IndexNode* p_Node) = 0;
    virtual void visit(MemberNode* p_Node) = 0;
    virtual void visit(MethodNode* p_Node) = 0;
    virtual void visit(TableConstructorNode* p_Node) = 0;
    virtual void visit(TableIndexValueNode* p_Node) = 0;
    virtual void visit(TableNameValueNode* p_Node) = 0;
    virtual void visit(TableValueNode* p_Node) = 0;
    virtual void visit(FuncBodyNode* p_Node) = 0;
    virtual void visit(FuncCallNode* p_Node) = 0;
    virtual void visit(FuncDefNode* p_Node) = 0;
    virtual void visit(FuncNameNode* p_Node) = 0;
    virtual void visit(LabelNode* p_Node) = 0;
    virtual void visit(SemicolonNode* p_Node) = 0;

    virtual void destroy()
    {
        delete this;
    }
};

#endif
