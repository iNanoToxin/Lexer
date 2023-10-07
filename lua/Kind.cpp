#include "Kind.h"

std::string getKindName(const Kind& kind) {
    switch (kind)
    {
        case Kind::Identifier: return "Identifier";
        case Kind::String: return "String";
        case Kind::Numeric: return "Numeric";
        case Kind::Boolean: return "Boolean";
        case Kind::Unknown: return "Unknown";
        case Kind::UnaryOperation: return "UnaryOperation";
        case Kind::Null: return "Null";
        case Kind::Varargs: return "Varargs";
        case Kind::Attribute: return "Attribute";
        case Kind::AttributeList: return "AttributeList";
        case Kind::ExpressionList: return "ExpressionList";
        case Kind::ReturnStatement: return "ReturnStatement";
        case Kind::Member: return "Member";
        case Kind::Method: return "Method";
        case Kind::Index: return "Index";
        case Kind::FunctionName: return "FunctionName";
        case Kind::ParameterList: return "ParameterList";
        case Kind::NameList: return "NameList";
        case Kind::TableIndexValue: return "TableIndexValue";
        case Kind::TableNameValue: return "TableNameValue";
        case Kind::TableValue: return "TableValue";
        case Kind::FieldList: return "FieldList";
        case Kind::ArgumentList: return "ArgumentList";
        case Kind::TableConstructor: return "TableConstructor";
        case Kind::FunctionCall: return "FunctionCall";
        case Kind::VariableList: return "VariableList";
        case Kind::FunctionBody: return "FunctionBody";
        case Kind::FunctionDefinition: return "FunctionDefinition";
        case Kind::Semicolon: return "Semicolon";
        case Kind::IfStatement: return "IfStatement";
        case Kind::ConditionalBlock: return "ConditionalBlock";
        case Kind::WhileStatement: return "WhileStatement";
        case Kind::RepeatStatement: return "RepeatStatement";
        case Kind::DoStatement: return "DoStatement";
        case Kind::LocalStatement: return "LocalStatement";
        case Kind::AssignmentStatement: return "AssignmentStatement";
        case Kind::ForStatement: return "ForStatement";
        case Kind::GotoStatement: return "GotoStatement";
        case Kind::Label: return "Label";
        case Kind::Block: return "Block";
        case Kind::BinaryOperation: return "BinaryOperation";
        case Kind::Chunk: return "Chunk";
        default: return "UNKNOWN_KIND";
    }
}