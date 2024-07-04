#pragma once
#include <sstream>
#include <string>
#include <vector>
#include <utilities/assert.h>

#include "location.h"
#include "fmt/printf.h"

struct Lexeme
{
private:
    unsigned int m_Length;

public:
    enum Type
    {
        Eof = 0,
        Char_Begin = 1,
        Char_End = 256,

        Number,
        Name,
        RawString,
        QuotedString,
        Comment,
        BlockComment,

        InterpString_Begin,
        InterpString_Mid,
        InterpString_End,
        InterpString_Simple,

        Attribute,
        BrokenString,
        BrokenComment,
        BrokenUnicode,
        BrokenInterpDoubleBrace,
        Error,

        Equal,
        LessEqual,
        GreaterEqual,
        NotEqual,
        Dot2,
        Dot3,
        SkinnyArrow,
        DoubleColon,
        FloorDiv,

        Add_Assign,
        Sub_Assign,
        Mul_Assign,
        FloatDiv_Assign,
        FloorDiv_Assign,
        Mod_Assign,
        Pow_Assign,
        Concat_Assign,

        Reserved_Keyword_Begin,
        Keyword_And = Reserved_Keyword_Begin,
        Keyword_Break,
        Keyword_Do,
        Keyword_Else,
        Keyword_Elseif,
        Keyword_End,
        Keyword_False,
        Keyword_For,
        Keyword_Function,
        Keyword_If,
        Keyword_In,
        Keyword_Local,
        Keyword_Nil,
        Keyword_Not,
        Keyword_Or,
        Keyword_Repeat,
        Keyword_Return,
        Keyword_Then,
        Keyword_True,
        Keyword_Until,
        Keyword_While,
        Reserved_Keyword_End
    };

    Type type;
    Location location;
    union
    {
        const char* data;       // String, Number, Comment
        const char* name;       // Name
        unsigned int codepoint; // BrokenUnicode
    };

    Lexeme(const Location& p_Location, Type p_Type);
    Lexeme(const Location& p_Location, char p_Character);
    Lexeme(const Location& p_Location, Type p_Type, const char* p_Data, size_t p_Size);
    Lexeme(const Location& p_Location, Type p_Type, const char* p_Name);

    unsigned int getLength() const;
    std::string toString() const;
};


class Lexer
{
private:
    const char* m_Buffer;
    std::size_t m_BufferSize;
    std::size_t m_Offset;
    unsigned int m_Line;
    unsigned int m_LineOffset;
    Lexeme m_Lexeme;
    Location m_PrevLocation;
    bool m_SkipComments;
    bool m_ReadNames;

    enum class BraceType
    {
        InterpolatedString,
        Normal
    };
    std::vector<BraceType> m_BraceStack;

    char peekchar(std::size_t p_LookAhead = 0) const;
    Position position() const;
    void consume();
    void consumeAny();

    Lexeme readCommentBody();
    int skipLongSeparator();
    Lexeme readLongString(const Position& p_Start, int p_SeparatorCount, Lexeme::Type p_Type, Lexeme::Type p_Broken);
    Lexeme readQuotedString();
    Lexeme readInterpolatedStringBegin();
    Lexeme readInterpolatedStringSection(Position p_Start, Lexeme::Type p_FormatType, Lexeme::Type p_EndType);
    void readBackslashInString();
    Lexeme readNumber(const Position& p_Start, unsigned int p_StartOffset);
    Lexeme readName();
    Lexeme readUtf8Error();

public:
    Lexer(const char* p_Buffer, const std::size_t p_BufferSize)
        : m_Buffer(p_Buffer)
        , m_BufferSize(p_BufferSize)
        , m_Offset(0)
        , m_Line(0)
        , m_LineOffset(0)
        , m_Lexeme(Location(), Lexeme::Eof)
        , m_SkipComments(false)
        , m_ReadNames(true) {}
};
