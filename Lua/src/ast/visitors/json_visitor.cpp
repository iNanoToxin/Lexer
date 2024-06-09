#include "json_visitor.h"
#include <string>
#include "../../utilities/string.h"

#define ADD_ENTRY(NAME)                \
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

#define ADD_OBJECT(BODY)                               \
do                                                     \
{                                                      \
    m_Builder.addObject();                             \
    m_Builder.addEntry("kind", p_Node->getKindName()); \
    BODY                                               \
    m_Builder.endObject();                             \
}                                                      \
while (false)


void JsonVisitor::visit(const std::shared_ptr<AttributeNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(value);
        ADD_ENTRY(attribute);
    });
}
void JsonVisitor::visit(const std::shared_ptr<BooleanNode>& p_Node)
{
    ADD_OBJECT({
        m_Builder.addEntry("value", p_Node->value);
    });
}
void JsonVisitor::visit(const std::shared_ptr<IdentifierNode>& p_Node)
{
    ADD_OBJECT({
        m_Builder.addEntry("name", p_Node->getName());
    });
}
void JsonVisitor::visit(const std::shared_ptr<NilNode>& p_Node)
{
    ADD_OBJECT();
}
void JsonVisitor::visit(const std::shared_ptr<NumberNode>& p_Node)
{
    ADD_OBJECT({
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
    ADD_OBJECT({
        m_Builder.addEntry("string", String::parse_escape_string(p_Node->getString()));
    });
}
void JsonVisitor::visit(const std::shared_ptr<VarargsNode>& p_Node)
{
    ADD_OBJECT();
}

void JsonVisitor::visit(const std::shared_ptr<BinaryOpNode>& p_Node)
{
    ADD_OBJECT({
        m_Builder.addEntry("op", p_Node->op);
        ADD_ENTRY(lhs);
        ADD_ENTRY(rhs);
    });
}
void JsonVisitor::visit(const std::shared_ptr<UnaryOpNode>& p_Node)
{
    ADD_OBJECT({
        m_Builder.addEntry("op", p_Node->op);
        ADD_ENTRY(value);
    });
}

void JsonVisitor::visit(const std::shared_ptr<ArgumentListNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(list);
    });
}
void JsonVisitor::visit(const std::shared_ptr<AttributeListNode>& p_Node)
{
    ADD_OBJECT({
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
    ADD_OBJECT({
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
    ADD_OBJECT({
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
    ADD_OBJECT({
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
    ADD_OBJECT({
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
    ADD_OBJECT({
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
    ADD_OBJECT({
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
    ADD_OBJECT({
        ADD_ENTRY(block);
    });
}

void JsonVisitor::visit(const std::shared_ptr<AssignmentStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(lValues);
        ADD_ENTRY(rValues);
    });
}
void JsonVisitor::visit(const std::shared_ptr<BreakStat>& p_Node)
{
    ADD_OBJECT();
}
void JsonVisitor::visit(const std::shared_ptr<ContinueStat>& p_Node)
{
    ADD_OBJECT();
}
void JsonVisitor::visit(const std::shared_ptr<DoStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<GenericForStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(nameList);
        ADD_ENTRY(expressionList);
        ADD_ENTRY(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<GotoStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(label);
    });
}
void JsonVisitor::visit(const std::shared_ptr<IfStatNode>& p_Node)
{
    ADD_OBJECT({
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
    ADD_OBJECT({
        ADD_ENTRY(statement);
    });
}
void JsonVisitor::visit(const std::shared_ptr<NumericForStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(name);
        ADD_ENTRY(init);
        ADD_ENTRY(goal);
        ADD_ENTRY(step);
        ADD_ENTRY(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<RepeatStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(block);
        ADD_ENTRY(condition);
    });
}
void JsonVisitor::visit(const std::shared_ptr<ReturnStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(args);
    });
}
void JsonVisitor::visit(const std::shared_ptr<WhileStatNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(condition);
        ADD_ENTRY(block);
    });
}

void JsonVisitor::visit(const std::shared_ptr<IndexNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(root);
        ADD_ENTRY(index);
    });
}
void JsonVisitor::visit(const std::shared_ptr<MemberNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(root);
        ADD_ENTRY(member);
    });
}
void JsonVisitor::visit(const std::shared_ptr<MethodNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(root);
        ADD_ENTRY(method);
    });
}

void JsonVisitor::visit(const std::shared_ptr<TableConstructorNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(fieldList);
    });
}
void JsonVisitor::visit(const std::shared_ptr<TableIndexValueNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(index);
        ADD_ENTRY(value);
    });
}
void JsonVisitor::visit(const std::shared_ptr<TableNameValueNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(name);
        ADD_ENTRY(value);
    });
}
void JsonVisitor::visit(const std::shared_ptr<TableValueNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(value);
    });
}

void JsonVisitor::visit(const std::shared_ptr<FuncBodyNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(parameters);
        ADD_ENTRY(block);
    });
}
void JsonVisitor::visit(const std::shared_ptr<FuncCallNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(root);
        ADD_ENTRY(args);
    });
}
void JsonVisitor::visit(const std::shared_ptr<FuncDefNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(name);
        ADD_ENTRY(body);
    });
}
void JsonVisitor::visit(const std::shared_ptr<FuncNameNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(name);
    });
}

void JsonVisitor::visit(const std::shared_ptr<LabelNode>& p_Node)
{
    ADD_OBJECT({
        ADD_ENTRY(label);
    });
}
void JsonVisitor::visit(const std::shared_ptr<SemicolonNode>& p_Node)
{
    ADD_OBJECT();
}

std::string JsonVisitor::getResult() const
{
    return m_Builder.str();
}
