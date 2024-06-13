#include "./assert.h"
#include <iostream>
#include <sstream>

void assert_condition(const int p_Line, const char* p_File, const char* p_Func, const char* p_Condition, const bool p_Success, const std::string& p_Message, const char* p_Identifier)
{
    if (p_Success) return;

    std::stringstream stream;
    stream << "Assertion Failed: `" << p_Condition << "`" << "\n";
    if (p_Identifier != nullptr)
    {
        stream << "    " << "Identifier: " << p_Identifier << "\n";
    }
    stream << "    " << "Func: " << p_Func << "\n";
    stream << "    " << "Line: " << p_Line << "\n";
    stream << "    " << "File: " << p_File << "\n";
    stream << "    " << "Message: " << p_Message;

    std::cerr << stream.rdbuf() << std::endl;
    std::exit(0);
}

void failure(const int p_Line, const char* p_File, const char* p_Func, const std::string& p_Condition, const std::string& p_Message, const char* p_Identifier)
{
    std::stringstream stream;
    stream << "Failure: " << p_Condition << "\n";
    if (p_Identifier != nullptr)
    {
        stream << "    " << "Identifier: " << p_Identifier << "\n";
    }
    stream << "    " << "Func: " << p_Func << "\n";
    stream << "    " << "Line: " << p_Line << "\n";
    stream << "    " << "File: " << p_File << "\n";
    stream << "    " << "Message: " << p_Message;

    std::cerr << stream.rdbuf() << std::endl;
    std::exit(0);
}
