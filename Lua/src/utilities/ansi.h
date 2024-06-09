#pragma once
#include <sstream>

enum class AnsiColor {
    Default = 0,
    Black = 30,
    Red = 31,
    Green = 32,
    Yellow = 33,
    Blue = 34,
    Magenta = 35,
    Cyan = 36,
    Gray = 37,
    BrightBlack = 90,
    BrightRed = 91,
    BrightGreen = 92,
    BrightYellow = 93,
    BrightBlue = 94,
    BrightMagenta = 95,
    BrightCyan = 96,
    BrightGray = 97
};

template <class T>
class Ansi
{
private:
    T m_Data;
    int m_Color;

public:
    explicit Ansi(const AnsiColor p_Color, T p_Data) : m_Data(std::move(p_Data)), m_Color(static_cast<int>(p_Color)) {}
    explicit Ansi(const int p_Color, T p_Data) : m_Data(std::move(p_Data)), m_Color(p_Color) {}

    friend std::ostream& operator<<(std::ostream& p_Stream, const Ansi& p_Obj)
    {
        p_Stream << "\033[" << p_Obj.m_Color << "m" << p_Obj.m_Data << "\033[0m";
        return p_Stream;
    }
};
