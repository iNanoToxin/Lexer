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

class AstVisitor
{
public:
    virtual ~AstVisitor() = default;
    virtual void visit(const std::shared_ptr<AttributeNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BooleanNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<IdentifierNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NilNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NumberNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<StringNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<VarargsNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BinaryOpNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<UnaryOpNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ArgumentListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<AttributeListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ExpressionListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FieldListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NameListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ParameterListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<VariableListNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BlockNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ChunkNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<AssignmentStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<BreakStat>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ContinueStat>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<DoStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<GenericForStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<GotoStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<IfStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<LocalStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<NumericForStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<RepeatStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<ReturnStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<WhileStatNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<IndexNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<MemberNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<MethodNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableConstructorNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableIndexValueNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableNameValueNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<TableValueNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncBodyNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncCallNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncDefNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<FuncNameNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<LabelNode>& p_Node) = 0;
    virtual void visit(const std::shared_ptr<SemicolonNode>& p_Node) = 0;

    virtual void destroy()
    {
        delete this;
    }
};

#endif
