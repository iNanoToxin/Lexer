#include "json_builder.h"

void JsonBuilder::indentLine()
{
    m_Stream << std::string(m_Width * m_Depth, ' ');
}

void JsonBuilder::addCommaIfNeeded()
{
    if (m_Separator)
    {
        m_Stream << ",";
    }
    if (!m_First)
    {
        m_Stream << "\n";
    }
    m_First = false;
}

void JsonBuilder::addObject(const char* p_Name)
{
    if (!m_Key)
    {
        addCommaIfNeeded();
        indentLine();
    }
    if (p_Name == nullptr)
    {
        m_Stream << "{";
    }
    else
    {
        m_Stream << "\"" << p_Name << "\": {";
    }
    m_Depth++;
    m_Separator = false;
    m_Key = false;
}

void JsonBuilder::endObject()
{
    LL_assert(m_Depth > 0, "Object does not exist.");
    m_Depth--;
    m_Stream << "\n";
    indentLine();
    m_Stream << "}";
    m_Separator = true;
}

void JsonBuilder::addArray(const char* p_Name)
{
    if (!m_Key)
    {
        addCommaIfNeeded();
        indentLine();
    }
    if (p_Name == nullptr)
    {
        m_Stream << "[";
    }
    else
    {
        m_Stream << "\"" << p_Name << "\": [";
    }
    m_Depth++;
    m_Separator = false;
    m_Key = false;
}

void JsonBuilder::endArray()
{
    LL_assert(m_Depth > 0, "Array does not exist.");
    m_Depth--;
    m_Stream << "\n";
    indentLine();
    m_Stream << "]";
    m_Separator = true;
}

void JsonBuilder::addEntry(const char* p_Name, const std::string& p_Entry)
{
    addKey(p_Name);
    m_Stream << "\"" << p_Entry << "\"";
    m_Key = false;
}

void JsonBuilder::addEntry(const char* p_Name, const bool p_Entry)
{
    addKey(p_Name);
    m_Stream << (p_Entry ? "true" : "false");
    m_Key = false;
}

void JsonBuilder::addNullEntry(const char* p_Name)
{
    addKey(p_Name);
    m_Stream << "null";
    m_Key = false;
}

void JsonBuilder::addKey(const char* p_Name)
{
    addCommaIfNeeded();
    indentLine();
    m_Stream << "\"" << p_Name << "\": ";
    m_Separator = true;
    m_Key = true;
}

std::string JsonBuilder::str() const
{
    return m_Stream.str();
}
