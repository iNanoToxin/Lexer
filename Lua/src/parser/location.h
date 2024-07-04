#pragma once

struct Position
{
    unsigned int line, column;

    Position(const unsigned int p_Line, const unsigned int p_Column) : line(p_Line), column(p_Column) {}

    bool operator==(const Position& p_Rhs) const;
    bool operator!=(const Position& p_Rhs) const;
    bool operator<(const Position& p_Rhs) const;
    bool operator>(const Position& p_Rhs) const;
    bool operator<=(const Position& p_Rhs) const;
    bool operator>=(const Position& p_Rhs) const;

    void shift(const Position& p_Start, const Position& p_OldEnd, const Position& p_NewEnd);
};

struct Location
{
    Position begin, end;

    Location() : begin(0, 0), end(0, 0) {}
    Location(const Position& p_Begin, const Position& p_End) : begin(p_Begin), end(p_End) {}
    Location(const Position& p_Begin, const unsigned int p_Length) : begin(p_Begin), end(p_Begin.line, p_Begin.column + p_Length) {}
    Location(const Location& p_Begin, const Location& p_End) : begin(p_Begin.begin), end(p_End.end) {}

    bool operator==(const Location& p_Rhs) const;
    bool operator!=(const Location& p_Rhs) const;

    bool encloses(const Location& p_Location) const;
    bool overlaps(const Location& p_Location) const;
    bool contains(const Position& p_Position) const;
    bool containsClosed(const Position& p_Position) const;
    void extend(const Location& p_Other);
    void shift(const Position& p_Start, const Position& p_OldEnd, const Position& p_NewEnd);
};
