#include "location.h"

bool Position::operator==(const Position& p_Rhs) const
{
    return this->column == p_Rhs.column && this->line == p_Rhs.line;
}

bool Position::operator!=(const Position& p_Rhs) const
{
    return !(*this == p_Rhs);
}

bool Position::operator<(const Position& p_Rhs) const
{
    if (line == p_Rhs.line)
    {
        return column < p_Rhs.column;
    }
    else
    {
        return line < p_Rhs.line;
    }
}

bool Position::operator>(const Position& p_Rhs) const
{
    if (line == p_Rhs.line)
    {
        return column > p_Rhs.column;
    }
    else
    {
        return line > p_Rhs.line;
    }
}

bool Position::operator<=(const Position& p_Rhs) const
{
    return *this == p_Rhs || *this < p_Rhs;
}

bool Position::operator>=(const Position& p_Rhs) const
{
    return *this == p_Rhs || *this > p_Rhs;
}

void Position::shift(const Position& p_Start, const Position& p_OldEnd, const Position& p_NewEnd)
{
    if (*this >= p_Start)
    {
        if (this->line > p_OldEnd.line)
        {
            this->line += (p_NewEnd.line - p_OldEnd.line);
        }
        else
        {
            this->line = p_NewEnd.line;
            this->column += (p_NewEnd.column - p_OldEnd.column);
        }
    }
}

bool Location::operator==(const Location& p_Rhs) const
{
    return this->begin == p_Rhs.begin && this->end == p_Rhs.end;
}

bool Location::operator!=(const Location& p_Rhs) const
{
    return !(*this == p_Rhs);
}

bool Location::encloses(const Location& p_Location) const
{
    return begin <= p_Location.begin && end >= p_Location.end;
}

bool Location::overlaps(const Location& p_Location) const
{
    return (begin <= p_Location.begin && end >= p_Location.begin) || (begin <= p_Location.end && end >= p_Location.end) || (begin >= p_Location.begin && end <= p_Location.end);
}

bool Location::contains(const Position& p_Position) const
{
    return begin <= p_Position && p_Position < end;
}

bool Location::containsClosed(const Position& p_Position) const
{
    return begin <= p_Position && p_Position <= end;
}

void Location::extend(const Location& p_Other)
{
    if (p_Other.begin < begin)
    {
        begin = p_Other.begin;
    }
    if (p_Other.end > end)
    {
        end = p_Other.end;
    }
}

void Location::shift(const Position& p_Start, const Position& p_OldEnd, const Position& p_NewEnd)
{
    begin.shift(p_Start, p_OldEnd, p_NewEnd);
    end.shift(p_Start, p_OldEnd, p_NewEnd);
}
