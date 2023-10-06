#include "tokenizer.h"

bool is_digit(char c)
{
    return (c >= '0') && (c <= '9');
}

bool is_hexadecimal_digit(char c)
{
    return is_digit(c) || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F');
}

bool is_binary_digit(char c)
{
    return (c == '0') || (c == '1');
}

bool is_identifier_nondigit(char c)
{
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c == '_');
}

bool is_identifier(char c)
{
    return is_identifier_nondigit(c) || (c >= '0' && c <= '9');
}

bool is_escape_character(char c)
{
    switch (c)
    {
        case '\"':
        case '\'':
        case '?':
        case '\\':
        case '#':
        case 'a':
        case 'b':
        case 'f':
        case 'n':
        case 'r':
        case 't':
        case 'v':
        case '0':
        {
            return true;
        }
        default:
        {
            return false;
        }
    }
}

bool is_symbol(char c)
{
    switch (c)
    {
        case '`':
        case '~':
        case '!':
        case '@':
        case '#':
        case '$':
        case '%':
        case '^':
        case '&':
        case '*':
        case '(':
        case ')':
        case '_':
        case '-':
        case '+':
        case '=':
        case '{':
        case '}':
        case '[':
        case ']':
        case '|':
        case '\\':
        case ':':
        case ';':
        case '\"':
        case '\'':
        case '<':
        case '>':
        case ',':
        case '.':
        case '?':
        case '/':
        {
            return true;
        }
        default:
        {
            return false;
        }
    }
}

bool is_white_space(char c)
{
    return (c == ' ' || c == '\n' || c == '\t' || c == '\r' || c == '\v' || c == '\f');
}

bool is_keyword(const std::string& str)
{
    for (const char* keyword: keywords)
    {
        if (keyword == str)
        {
            return true;
        }
    }
    return false;
}
