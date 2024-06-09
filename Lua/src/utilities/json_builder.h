#pragma once
#include <sstream>
#include "./assert.h"

class JsonBuilder
{
private:
    std::stringstream m_Stream;
    std::size_t m_Depth = 0;
    std::size_t m_Width;
    bool m_Separator = false;
    bool m_First = true;
    bool m_Key = false;

    void indentLine();
    void addCommaIfNeeded();
public:
    explicit JsonBuilder(const std::size_t p_Width) : m_Width(p_Width) {}

    void addObject(const char* p_Name = nullptr);
    void endObject();
    void addArray(const char* p_Name = nullptr);
    void endArray();

    template <typename T>
    void addEntry(const char* p_Name, const T& p_Entry)
    {
        addKey(p_Name);
        m_Stream << p_Entry;
        m_Key = false;
    }
    void addEntry(const char* p_Name, const std::string& p_Entry);
    void addEntry(const char* p_Name, bool p_Entry);
    void addNullEntry(const char* p_Name);
    void addKey(const char* p_Name);

    std::string str() const;
};