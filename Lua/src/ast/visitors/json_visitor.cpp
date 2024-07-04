#include "json_visitor.h"
#include <string>
#include "../../utilities/string.h"

#define add_entry(NAME)                \
do                                     \
{                                      \
    if (p_Node->NAME != nullptr)       \
    {                                  \
        m_Builder.addKey(#NAME);       \
        p_Node->NAME->accept(*this);   \
    }                                  \
    else                               \
    {                                  \
        m_Builder.addNullEntry(#NAME); \
    }                                  \
}                                      \
while (false)

#define add_object(BODY)                               \
do                                                     \
{                                                      \
    m_Builder.addObject();                             \
    m_Builder.addEntry("kind", p_Node->getKindName()); \
    m_Builder.addEntry("static", p_Node->isStatic());  \
    BODY                                               \
    m_Builder.endObject();                             \
}                                                      \
while (false)


void JsonVisitor::visit(const std::shared_ptr<AttributeNode>& p_Node)
{
    add_object({
        add_entry(value);
        add_entry(attribute);
    });
}
void JsonVisitor::visit(const std::shared_ptr<BooleanNode>& p_Node)
{
    add_object({
        m_Builder.addEntry("value", p_Node->value);
    });
}
void JsonVisitor::visit(const std::shared_ptr<IdentifierNode>& p_Node)
{
    add_object({
        m_Builder.addEntry("name", p_Node->getName());
    });
}
void JsonVisitor::visit(const std::shared_ptr<NilNode>& p_Node)
{
    add_object();
}
void JsonVisitor::visit(const std::shared_ptr<NumberNode>& p_Node)
{
    add_object({
        if (p_Node->isInt())
        {
            m_Builder.addEntry("value", p_Node->getInt());
        }
        else
        {
            m_Builder.addEntry("value", p_Node->getDouble());
        }
    });
}
void JsonVisitor::visit(const std::shared_ptr<StringNode>& p_Node)
{
    add_object({
        m_Builder.addEntry("string", String::parse_escape_string(p_Node->getString()));
    });
}
void JsonVisitor::visit(const std::shared_ptr<VarargsNode>& p_Node)
{
    add_object();
}

void JsonVisitor::visit(const std::shared_ptr<BinaryOpNode>& p_Node)
{
    add_object({
        m_Builder.addEntry("op", p_Node->op);
        add_entry(lhs);
        add_entry(rhs);
    });
}
void JsonVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    add_object({
        m_Builder.addEntry("op", p_Node->op);
        add_entry(value);
    });
}

void JsonVisitor::visit(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    add_object({
        add_entry(list);
    });
}
void JsonVisitor::visit(const std::shared_ptr<AttributeListNode>& p_Node)
{
    add_object({
        m_Builder.addArray("list");
        for (const std::shared_ptr<AstNode>& child : p_Node->list)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<ExpressionListNode>& p_Node)
{
    add_object({
        m_Builder.addArray("list");
        for (const std::shared_ptr<AstNode>& child : p_Node->list)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<FieldListNode>& p_Node)
{
    add_object({
        m_Builder.addArray("list");
        for (const std::shared_ptr<AstNode>& child : p_Node->list)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<NameListNode>& p_Node)
{
    add_object({
        m_Builder.addArray("list");
        for (const std::shared_ptr<AstNode>& child : p_Node->list)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<ParameterListNode>& p_Node)
{
    add_object({
        m_Builder.addArray("list");
        for (const std::shared_ptr<AstNode>& child : p_Node->list)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<VariableListNode>& p_Node)
{
    add_object({
        m_Builder.addArray("list");
        for (const std::shared_ptr<AstNode>& child : p_Node->list)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}

void JsonVisitor::visit(const std::shared_ptr<BlockNode>& p_Node)
{
    add_object({
        m_Builder.addArray("statements");
        for (const std::shared_ptr<AstNode>& child : p_Node->statements)
        {
            child->accept(*this);
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<ChunkNode>& p_Node)
{
    add_object({
        add_entry(block);
    });
}

void JsonVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    add_object({
        add_entry(lValues);
        add_entry(rValues);
    });
}
void JsonVisitor::visit(const std::shared_ptr<BreakStat>& p_Node)
{
    add_object();
}
void JsonVisitor::visit(const std::shared_ptr<ContinueStat>& p_Node)
{
    add_object();
}
void JsonVisitor::visit(const std::shared_ptr<DoStatNode>& p_Node)
{
    add_object({
        add_entry(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    add_object({
        add_entry(names);
        add_entry(expressions);
        add_entry(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<GotoStatNode>& p_Node)
{
    add_object({
        add_entry(label);
    });
}
void JsonVisitor::visit(const std::shared_ptr<IfStatNode>& p_Node)
{
    add_object({
        m_Builder.addArray("control_blocks");
        for (const AstNodePair& pair : p_Node->blocks)
        {
            m_Builder.addObject();
            if (pair.first != nullptr)
            {
                m_Builder.addKey("condition");
                pair.first->accept(*this);
            }
            else
            {
                m_Builder.addNullEntry("condition");
            }
            if (pair.second != nullptr)
            {
                m_Builder.addKey("block");
                pair.second->accept(*this);
            }
            else
            {
                m_Builder.addNullEntry("block");
            }
            m_Builder.endObject();
        }
        m_Builder.endArray();
    });
}
void JsonVisitor::visit(const std::shared_ptr<LocalStatNode>& p_Node)
{
    add_object({
        add_entry(statement);
    });
}
void JsonVisitor::visit(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    add_object({
        add_entry(name);
        add_entry(init);
        add_entry(goal);
        add_entry(step);
        add_entry(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<RepeatStatNode>& p_Node)
{
    add_object({
        add_entry(block);
        add_entry(condition);
    });
}
void JsonVisitor::visit(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    add_object({
        add_entry(args);
    });
}
void JsonVisitor::visit(const std::shared_ptr<WhileStatNode>& p_Node)
{
    add_object({
        add_entry(condition);
        add_entry(block);
    });
}

void JsonVisitor::visit(const std::shared_ptr<IndexNode>& p_Node)
{
    add_object({
        add_entry(root);
        add_entry(index);
    });
}
void JsonVisitor::visit(const std::shared_ptr<MemberNode>& p_Node)
{
    add_object({
        add_entry(root);
        add_entry(member);
    });
}
void JsonVisitor::visit(const std::shared_ptr<MethodNode>& p_Node)
{
    add_object({
        add_entry(root);
        add_entry(method);
    });
}

void JsonVisitor::visit(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    add_object({
        add_entry(fields);
    });
}
void JsonVisitor::visit(const std::shared_ptr<TableIndexValueNode>& p_Node)
{
    add_object({
        add_entry(index);
        add_entry(value);
    });
}
void JsonVisitor::visit(const std::shared_ptr<TableNameValueNode>& p_Node)
{
    add_object({
        add_entry(name);
        add_entry(value);
    });
}
void JsonVisitor::visit(const std::shared_ptr<TableValueNode>& p_Node)
{
    add_object({
        add_entry(value);
    });
}

void JsonVisitor::visit(const std::shared_ptr<FuncBodyNode>& p_Node)
{
    add_object({
        add_entry(parameters);
        add_entry(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<FuncCallNode>& p_Node)
{
    add_object({
        add_entry(root);
        add_entry(args);
    });
}
void JsonVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    add_object({
        add_entry(name);
        add_entry(body);
    });
}
void JsonVisitor::visit(const std::shared_ptr<FuncNameNode>& p_Node)
{
    add_object({
        add_entry(name);
    });
}

void JsonVisitor::visit(const std::shared_ptr<LabelNode>& p_Node)
{
    add_object({
        add_entry(label);
    });
}
void JsonVisitor::visit(const std::shared_ptr<SemicolonNode>& p_Node)
{
    add_object();
}

std::string JsonVisitor::getResult() const
{
    return m_Builder.str();
}
