#include "lexer.h"
#include "Luau/Confusables.h"
#include "utilities/assert.h"

Lexeme::Lexeme(const Location& p_Location, const Type p_Type)
    : m_Length(0)
    , type(p_Type)
    , location(p_Location)
    , data(nullptr) {}

Lexeme::Lexeme(const Location& p_Location, const char p_Character)
    : m_Length(0)
    , type(static_cast<Type>(static_cast<unsigned char>(p_Character)))
    , location(p_Location)
    , data(nullptr) {}

Lexeme::Lexeme(const Location& p_Location, const Type p_Type, const char* p_Data, const size_t p_Size)
    : m_Length(static_cast<unsigned>(p_Size))
    , type(p_Type)
    , location(p_Location)
    , data(p_Data)
{
    LL_assert(
        p_Type == RawString
        || p_Type == QuotedString
        || p_Type == InterpString_Begin
        || p_Type == InterpString_Mid
        || p_Type == InterpString_End
        || p_Type == InterpString_Simple
        || p_Type == Number
        || p_Type == Comment
        || p_Type == BlockComment,
        "Unexpected type."
    );
}

Lexeme::Lexeme(const Location& p_Location, const Type p_Type, const char* p_Name)
    : m_Length(0)
    , type(p_Type)
    , location(p_Location)
    , name(p_Name)
{
    LL_assert(p_Type == Name || type >= Reserved_Keyword_Begin && type < Reserved_Keyword_End, "Unexpected type.");
}

unsigned int Lexeme::getLength() const
{
    LL_assert(
        type == RawString
        || type == QuotedString
        || type == InterpString_Begin
        || type == InterpString_Mid
        || type == InterpString_End
        || type == InterpString_Simple
        || type == Number
        || type == Comment
        || type == BlockComment,
        "Unexpected type."
    );
    return m_Length;
}

std::string Lexeme::toString() const
{
    switch (type)
    {
        case Eof: return "<eof>";
        case Equal: return "'=='";
        case LessEqual: return "'<='";
        case GreaterEqual: return "'>='";
        case NotEqual: return "'~='";
        case Dot2: return "'..'";
        case Dot3: return "'...'";
        case SkinnyArrow: return "'->'";
        case DoubleColon: return "'::'";
        case FloorDiv: return "'//'";
        case Add_Assign: return "'+='";
        case Sub_Assign: return "'-='";
        case Mul_Assign: return "'*='";
        case FloatDiv_Assign: return "'/='";
        case FloorDiv_Assign: return "'//='";
        case Mod_Assign: return "'%='";
        case Pow_Assign: return "'^='";
        case Concat_Assign: return "'..='";

        case RawString:
        case QuotedString:
        {
            return data ? fmt::sprintf("\"%.*s\"", m_Length, data) : "string";
        }

        case InterpString_Begin:
        {
            return data ? fmt::sprintf("`%.*s{", m_Length, data) : "the beginning of an interpolated string";
        }
        case InterpString_Mid:
        {
            return data ? fmt::sprintf("}%.*s{", m_Length, data) : "the middle of an interpolated string";
        }
        case InterpString_End:
        {
            return data ? fmt::sprintf("}%.*s`", m_Length, data) : "the end of an interpolated string";
        }
        case InterpString_Simple:
        {
            return data ? fmt::sprintf("`%.*s`", m_Length, data) : "interpolated string";
        }

        case Number:
        {
            return data ? fmt::sprintf("'%.*s'", m_Length, data) : "number";;
        }
        case Name:
        {
            return name ? fmt::sprintf("'%s'", name) : "identifier";
        }
        case Attribute:
        {
            return name ? fmt::sprintf("'%s'", name) : "attribute";
        }

        case Comment:
        case BlockComment:
        {
            return data ? fmt::sprintf("'--%.*s'", m_Length, data) : "comment";
        }

        case BrokenString: return "malformed string";
        case BrokenComment: return "unfinished comment";
        case BrokenInterpDoubleBrace: return "'{{', which is invalid (did you mean '\\{'?)";

        case BrokenUnicode:
        {
            if (codepoint)
            {
                if (const char* confusable = Luau::findConfusable(codepoint))
                    return fmt::sprintf("Unicode character U+%x (did you mean '%s'?)", codepoint, confusable);

                return fmt::sprintf("Unicode character U+%x", codepoint);
            }
            return "invalid UTF-8 sequence";
        }


        default:
        {
            static const char* k_reserved[] = {
                "and", "break", "do", "else", "elseif", "end",
                "false", "for", "function", "if", "in", "local",
                "nil", "not", "or", "repeat", "return", "then",
                "true", "until", "while"
            };

            if (type >= Char_Begin && type < Char_End)
            {
                return fmt::sprintf("'%c'", static_cast<char>(type));
            }
            else if (type >= Reserved_Keyword_Begin && type < Reserved_Keyword_End)
            {
                return fmt::sprintf("'%s'", k_reserved[type - Reserved_Keyword_Begin]);
            }
            return "<unknown>";
        }
    }
}

char Lexer::peekchar(const std::size_t p_LookAhead) const
{
    return (m_Offset + p_LookAhead < m_BufferSize) ? m_Buffer[m_Offset + p_LookAhead] : 0;
}

Position Lexer::position() const
{
    return Position(m_Line, m_Offset - m_LineOffset);
}

void Lexer::consume()
{
    LL_assert(m_Buffer[m_Offset] != '\n', "Cannot consume newline.");
    m_Offset++;
}

void Lexer::consumeAny()
{
    if (m_Buffer[m_Offset] == '\n')
    {
        m_Line++;
        m_LineOffset = m_Offset + 1;
    }
    m_Offset++;
}

void Lexer::readBackslashInString()
{
    LL_assert(peekchar() == '\\', "Expected backslash.");
    consume();

    switch (peekchar())
    {
        case 0:
        {
            break;
        }
        case '\r':
        {
            consume();

            if (peekchar() == '\n')
            {
                consumeAny();
            }
            break;
        }
        case 'z':
        {
            consume();

            while (std::isspace(peekchar()))
            {
                consumeAny();
            }
            break;
        }
        default:
        {
            consumeAny();
            break;
        }
    }
}

Lexeme Lexer::readQuotedString()
{
    const Position start = position();
    const char delimiter = peekchar();
    const unsigned int start_offset = m_Offset;

    LL_assert(delimiter == '\'' || delimiter == '"', "Expected quote.");
    consume();

    while (peekchar() != delimiter)
    {
        switch (peekchar())
        {
            case 0:
            case '\r':
            case '\n':
            {
                return Lexeme(Location(start, position()), Lexeme::BrokenString);
            }
            case '\\':
            {
                readBackslashInString();
                break;
            }
            default:
            {
                consume();
            }
        }
    }

    consume();
    return Lexeme(Location(start, position()), Lexeme::QuotedString, &m_Buffer[start_offset], m_Offset - start_offset - 1);
}

Lexeme Lexer::readInterpolatedStringBegin()
{
    LL_assert(peekchar() == '`', "Expected interpolated string beginning character.");

    const Position start = position();
    consume();

    return readInterpolatedStringSection(start, Lexeme::InterpString_Begin, Lexeme::InterpString_Simple);
}

Lexeme Lexer::readInterpolatedStringSection(const Position p_Start, const Lexeme::Type p_FormatType, const Lexeme::Type p_EndType)
{
    const unsigned int start_offset = m_Offset;

    while (peekchar() != '`')
    {
        switch (peekchar())
        {
            case 0:
            case '\r':
            case '\n':
            {
                return Lexeme(Location(p_Start, position()), Lexeme::BrokenString);
            }
            case '\\':
            {
                // Allow for \u{}, which would otherwise be consumed by looking for {
                if (peekchar(1) == 'u' && peekchar(2) == '{')
                {
                    consume(); // backslash
                    consume(); // u
                    consume(); // {
                    break;
                }

                readBackslashInString();
                break;
            }
            case '{':
            {
                m_BraceStack.push_back(BraceType::InterpolatedString);

                if (peekchar(1) == '{')
                {
                    const Lexeme broken_double_brace = Lexeme(Location(p_Start, position()), Lexeme::BrokenInterpDoubleBrace, &m_Buffer[start_offset], m_Offset - start_offset);
                    consume();
                    consume();
                    return broken_double_brace;
                }

                consume();
                return Lexeme(Location(p_Start, position()), p_FormatType, &m_Buffer[start_offset], m_Offset - start_offset - 1);
            }
            default:
            {
                consume();
                break;
            }
        }
    }

    consume();
    return Lexeme(Location(p_Start, position()), p_EndType, &m_Buffer[start_offset], m_Offset - start_offset - 1);
}

int Lexer::skipLongSeparator()
{
    const char start = peekchar();

    LL_assert(start == '[' || start == ']', "Expected bracket open or bracket close.");
    consume();

    unsigned int count = 0;

    while (peekchar() == '=')
    {
        consume();
        count++;
    }

    return (start == peekchar()) ? count : (-count) - 1;
}

Lexeme Lexer::readLongString(const Position& p_Start, const int p_SeparatorCount, const Lexeme::Type p_Type, const Lexeme::Type p_Broken)
{
    // skip (second) [
    LL_assert(peekchar() == '[', "Expected opening bracket.");
    consume();

    const unsigned int start_offset = m_Offset;

    while (peekchar())
    {
        if (peekchar() == ']')
        {
            if (skipLongSeparator() == p_SeparatorCount)
            {
                LL_assert(peekchar() == ']', "Expected closing bracket.");
                consume(); // skip (second) ]

                const unsigned int end_offset = m_Offset - p_SeparatorCount - 2;
                LL_assert(end_offset >= start_offset, "Expected long string to close properly.");

                return Lexeme(Location(p_Start, position()), p_Type, &m_Buffer[start_offset], end_offset - start_offset);
            }
        }
        else
        {
            consumeAny();
        }
    }

    return Lexeme(Location(p_Start, position()), p_Broken);
}

Lexeme Lexer::readCommentBody()
{
    const Position start = position();

    LL_assert(peekchar(0) == '-' && peekchar(1) == '-', "Expected comment to start with `--`.");
    consume();
    consume();

    const size_t start_offset = m_Offset;

    if (peekchar() == '[')
    {
        const int separator_count = skipLongSeparator();

        if (separator_count >= 0)
        {
            return readLongString(start, separator_count, Lexeme::BlockComment, Lexeme::BrokenComment);
        }
    }

    // fall back to single-line comment
    while (peekchar() != 0 && peekchar() != '\r' && peekchar() != '\n')
    {
        consume();
    }

    return Lexeme(Location(start, position()), Lexeme::Comment, &m_Buffer[start_offset], m_Offset - start_offset);
}

Lexeme Lexer::readNumber(const Position& p_Start, const unsigned int p_StartOffset)
{
    LL_assert(std::isdigit(peekchar()), "Expected digit.");

    // This function does not do the number parsing - it only skips a number-like pattern.
    // It uses the same logic as Lua stock lexer; the resulting string is later converted
    // to a number with proper verification.
    do
    {
        consume();
    }
    while (std::isdigit(peekchar()) || peekchar() == '.' || peekchar() == '_');

    if (peekchar() == 'e' || peekchar() == 'E')
    {
        consume();

        if (peekchar() == '+' || peekchar() == '-')
        {
            consume();
        }
    }

    while (std::isalpha(peekchar()) || std::isdigit(peekchar()) || peekchar() == '_')
    {
        consume();
    }

    return Lexeme(Location(p_Start, position()), Lexeme::Number, &m_Buffer[p_StartOffset], m_Offset - p_StartOffset);
}

Lexeme Lexer::readName()
{
    LL_assert(std::isalpha(peekchar()) || peekchar() == '_' || peekchar() == '@', "Expected character [a-zA-Z_@].");

    const Position start = position();
    const unsigned int start_offset = m_Offset;
    const Lexeme::Type type = (m_Buffer[start_offset] == '@') ? Lexeme::Attribute : Lexeme::Name;

    do
    {
        consume();
    }
    while (std::isalpha(peekchar()) || std::isdigit(peekchar()) || peekchar() == '_');

    return Lexeme(Location(start, position()), type, &m_Buffer[start_offset], m_Offset - start_offset);
}

Lexeme Lexer::readUtf8Error()
{
    const Position start = position();
    uint32_t codepoint = 0;
    int size = 0;

    if ((peekchar() & 0b10000000) == 0b00000000)
    {
        size = 1;
        codepoint = peekchar() & 0x7F;
    }
    else if ((peekchar() & 0b11100000) == 0b11000000)
    {
        size = 2;
        codepoint = peekchar() & 0b11111;
    }
    else if ((peekchar() & 0b11110000) == 0b11100000)
    {
        size = 3;
        codepoint = peekchar() & 0b1111;
    }
    else if ((peekchar() & 0b11111000) == 0b11110000)
    {
        size = 4;
        codepoint = peekchar() & 0b111;
    }
    else
    {
        consume();
        return Lexeme(Location(start, position()), Lexeme::BrokenUnicode);
    }

    consume();

    for (int i = 1; i < size; ++i)
    {
        if ((peekchar() & 0b11000000) != 0b10000000)
        {
            return Lexeme(Location(start, position()), Lexeme::BrokenUnicode);
        }

        codepoint = codepoint << 6;
        codepoint |= (peekchar() & 0b00111111);
        consume();
    }

    Lexeme result(Location(start, position()), Lexeme::BrokenUnicode);
    result.codepoint = codepoint;
    return result;
}
