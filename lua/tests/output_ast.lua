{
    Kind: Chunk
    [0] = {
        Kind: Block
        [0] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = "testing UTF-8 library"
                }
            }
        }
        [1] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'utf8'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'require'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: String
                                [0] = "utf8"
                            }
                        }
                    }
                }
            }
        }
        [2] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'checkerror'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'msg'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'f'
                        }
                        [2] = {
                            Kind: Varargs
                            [0] = '...'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: LocalStatement
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: AttributeList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'err'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'pcall'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'f'
                                                }
                                                [1] = {
                                                    Kind: Varargs
                                                    [0] = '...'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "and"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "not"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 's'
                                            }
                                        }
                                        [2] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'string'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'find'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'err'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'msg'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [3] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'len'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: ReturnStatement
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'string'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'gsub'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 's'
                                                }
                                                [1] = {
                                                    Kind: String
                                                    [0] = "[\x80-\xBF]"
                                                }
                                                [2] = {
                                                    Kind: String
                                                    [0] = ""
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [4] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'justone'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = ".."
                        [1] = {
                            Kind: String
                            [0] = "^"
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = ".."
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'charpattern'
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "$"
                            }
                        }
                    }
                }
            }
        }
        [5] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'checksyntax'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 't'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: LocalStatement
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: AttributeList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'ts'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: TableConstructor
                                        [0] = {
                                            Kind: FieldList
                                            [0] = {
                                                Kind: TableValue
                                                [0] = {
                                                    Kind: String
                                                    [0] = "return '"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                            [2] = {
                                Kind: UnaryOperation
                                [0] = "#"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 't'
                                }
                            }
                            [3] = nullptr
                            [4] = {
                                Kind: Block
                                [0] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ts'
                                            }
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = "+"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'string'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'format'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = "\\u{%x}"
                                                    }
                                                    [1] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 't'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'i'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: VariableList
                                [0] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'ts'
                                    }
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't'
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: String
                                    [0] = "'"
                                }
                            }
                        }
                        [3] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: VariableList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'ts'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'table'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'concat'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ts'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [4] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'assert'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'load'
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 'ts'
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = nullptr
                                            }
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 's'
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [6] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'assert'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: UnaryOperation
                        [0] = "not"
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'offset'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: String
                                        [0] = "alo"
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 5
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [7] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'assert'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: UnaryOperation
                        [0] = "not"
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'offset'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: String
                                        [0] = "alo"
                                    }
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 4
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [8] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'check'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 't'
                        }
                        [2] = {
                            Kind: Identifier
                            [0] = 'nonstrict'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: LocalStatement
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: AttributeList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'l'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'utf8'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'len'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 's'
                                                }
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                                [2] = {
                                                    Kind: UnaryOperation
                                                    [0] = "-"
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                }
                                                [3] = {
                                                    Kind: Identifier
                                                    [0] = 'nonstrict'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "and"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: UnaryOperation
                                                [0] = "#"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 't'
                                                }
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'l'
                                            }
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'len'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 's'
                                                        }
                                                    }
                                                }
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'l'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'char'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: FunctionCall
                                                        [0] = {
                                                            Kind: Member
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'table'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'unpack'
                                                            }
                                                        }
                                                        [1] = {
                                                            Kind: ArgumentList
                                                            [0] = {
                                                                Kind: ExpressionList
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 't'
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 's'
                                        }
                                    }
                                }
                            }
                        }
                        [3] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'offset'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 's'
                                                    }
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 0
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                }
                            }
                        }
                        [4] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'checksyntax'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 't'
                                    }
                                }
                            }
                        }
                        [5] = {
                            Kind: LocalStatement
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: AttributeList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 't1'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: TableConstructor
                                        [0] = {
                                            Kind: FieldList
                                            [0] = {
                                                Kind: TableValue
                                                [0] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'codepoint'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Numeric
                                                                [0] = 1
                                                            }
                                                            [2] = {
                                                                Kind: UnaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [6] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't'
                                            }
                                        }
                                        [2] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't1'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [7] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                            [2] = {
                                Kind: UnaryOperation
                                [0] = "#"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 't'
                                }
                            }
                            [3] = nullptr
                            [4] = {
                                Kind: Block
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: Index
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 't'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'i'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Index
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 't1'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'i'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [8] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 'l'
                            }
                            [3] = nullptr
                            [4] = {
                                Kind: Block
                                [0] = {
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: AttributeList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'pi'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'utf8'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'offset'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 's'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'i'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: AttributeList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'pi1'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'utf8'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'offset'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 's'
                                                        }
                                                        [1] = {
                                                            Kind: Numeric
                                                            [0] = 2
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'pi'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'string'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'find'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Member
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'string'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'sub'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 's'
                                                                    }
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'pi'
                                                                    }
                                                                    [2] = {
                                                                        Kind: BinaryOperation
                                                                        [0] = "-"
                                                                        [1] = {
                                                                            Kind: Identifier
                                                                            [0] = 'pi1'
                                                                        }
                                                                        [2] = {
                                                                            Kind: Numeric
                                                                            [0] = 1
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'justone'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [3] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'offset'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: UnaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'pi1'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'pi'
                                                }
                                            }
                                        }
                                    }
                                }
                                [4] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'offset'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: BinaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: BinaryOperation
                                                                    [0] = "-"
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'i'
                                                                    }
                                                                    [2] = {
                                                                        Kind: Identifier
                                                                        [0] = 'l'
                                                                    }
                                                                }
                                                                [2] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'pi'
                                                }
                                            }
                                        }
                                    }
                                }
                                [5] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: BinaryOperation
                                                    [0] = "-"
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'pi1'
                                                    }
                                                    [2] = {
                                                        Kind: Identifier
                                                        [0] = 'pi'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: UnaryOperation
                                                    [0] = "#"
                                                    [1] = {
                                                        Kind: FunctionCall
                                                        [0] = {
                                                            Kind: Member
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'utf8'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'char'
                                                            }
                                                        }
                                                        [1] = {
                                                            Kind: ArgumentList
                                                            [0] = {
                                                                Kind: ExpressionList
                                                                [0] = {
                                                                    Kind: FunctionCall
                                                                    [0] = {
                                                                        Kind: Member
                                                                        [0] = {
                                                                            Kind: Identifier
                                                                            [0] = 'utf8'
                                                                        }
                                                                        [1] = {
                                                                            Kind: Identifier
                                                                            [0] = 'codepoint'
                                                                        }
                                                                    }
                                                                    [1] = {
                                                                        Kind: ArgumentList
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 's'
                                                                            }
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'pi'
                                                                            }
                                                                            [2] = {
                                                                                Kind: Identifier
                                                                                [0] = 'pi'
                                                                            }
                                                                            [3] = {
                                                                                Kind: Identifier
                                                                                [0] = 'nonstrict'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [6] = {
                                    Kind: ForStatement
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'j'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'pi'
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'pi1'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [3] = nullptr
                                    [4] = {
                                        Kind: Block
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'assert'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = "=="
                                                        [1] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Member
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'utf8'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'offset'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 's'
                                                                    }
                                                                    [1] = {
                                                                        Kind: Numeric
                                                                        [0] = 0
                                                                    }
                                                                    [2] = {
                                                                        Kind: Identifier
                                                                        [0] = 'j'
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'pi'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [7] = {
                                    Kind: ForStatement
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'j'
                                    }
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'pi'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'pi1'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [3] = nullptr
                                    [4] = {
                                        Kind: Block
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'assert'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: UnaryOperation
                                                        [0] = "not"
                                                        [1] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Member
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'utf8'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'len'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 's'
                                                                    }
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'j'
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [8] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'len'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'pi'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'pi'
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                }
                                [9] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'len'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'pi'
                                                            }
                                                            [2] = {
                                                                Kind: BinaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'pi1'
                                                                }
                                                                [2] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                }
                                [10] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'len'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'pi'
                                                            }
                                                            [2] = {
                                                                Kind: UnaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: BinaryOperation
                                                    [0] = "+"
                                                    [1] = {
                                                        Kind: BinaryOperation
                                                        [0] = "-"
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'l'
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'i'
                                                        }
                                                    }
                                                    [2] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [11] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'len'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'pi1'
                                                            }
                                                            [2] = {
                                                                Kind: UnaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: BinaryOperation
                                                    [0] = "-"
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'l'
                                                    }
                                                    [2] = {
                                                        Kind: Identifier
                                                        [0] = 'i'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [12] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'len'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Numeric
                                                                [0] = 1
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'pi'
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [9] = {
                            Kind: LocalStatement
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: AttributeList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'i'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 0
                                    }
                                }
                            }
                        }
                        [10] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: NameList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'p'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'c'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codes'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 's'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'nonstrict'
                                            }
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Block
                                [0] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'i'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "+"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "and"
                                                [1] = {
                                                    Kind: BinaryOperation
                                                    [0] = "=="
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'c'
                                                    }
                                                    [2] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 't'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'i'
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: BinaryOperation
                                                    [0] = "=="
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'p'
                                                    }
                                                    [2] = {
                                                        Kind: FunctionCall
                                                        [0] = {
                                                            Kind: Member
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'utf8'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'offset'
                                                            }
                                                        }
                                                        [1] = {
                                                            Kind: ArgumentList
                                                            [0] = {
                                                                Kind: ExpressionList
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 's'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'i'
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'codepoint'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'p'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'p'
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'nonstrict'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'c'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [11] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'i'
                                        }
                                        [2] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [12] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: VariableList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'i'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                        [13] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: NameList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'c'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'string'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'gmatch'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 's'
                                            }
                                            [1] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'charpattern'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Block
                                [0] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'i'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "+"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'c'
                                                }
                                                [2] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'char'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Index
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 't'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'i'
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [14] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'i'
                                        }
                                        [2] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [15] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 'l'
                            }
                            [3] = nullptr
                            [4] = {
                                Kind: Block
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "=="
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'offset'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'i'
                                                            }
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'utf8'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'offset'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [1] = {
                                                                Kind: BinaryOperation
                                                                [0] = "-"
                                                                [1] = {
                                                                    Kind: BinaryOperation
                                                                    [0] = "-"
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'i'
                                                                    }
                                                                    [2] = {
                                                                        Kind: Identifier
                                                                        [0] = 'l'
                                                                    }
                                                                }
                                                                [2] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                            [2] = {
                                                                Kind: BinaryOperation
                                                                [0] = "+"
                                                                [1] = {
                                                                    Kind: UnaryOperation
                                                                    [0] = "#"
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 's'
                                                                    }
                                                                }
                                                                [2] = {
                                                                    Kind: Numeric
                                                                    [0] = 1
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [9] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'check'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 's'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'p'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: AttributeList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'a'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'b'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'utf8'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'len'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 's'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = "and"
                                                [1] = {
                                                    Kind: UnaryOperation
                                                    [0] = "not"
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'a'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: BinaryOperation
                                                    [0] = "=="
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'b'
                                                    }
                                                    [2] = {
                                                        Kind: Identifier
                                                        [0] = 'p'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "abc\xE3def"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                    }
                }
                [2] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\xF4\x9F\xBF"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
                [3] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\xF4\x9F\xBF\xBF"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
                [4] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\230\177\137\229\173\151\x80"
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: String
                                        [0] = "\230\177\137\229\173\151"
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                }
                [5] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\x80hello"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
                [6] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "hel\x80lo"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                    }
                }
                [7] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\230\177\137\229\173\151\xBF"
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: String
                                        [0] = "\230\177\137\229\173\151"
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                }
                [8] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\xBFhello"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
                [9] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "hel\xBFlo"
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                    }
                }
            }
        }
        [10] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'errorcodes'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 's'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'checkerror'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "invalid UTF%-8 code"
                                            }
                                            [1] = {
                                                Kind: FunctionDefinition
                                                [0] = nullptr
                                                [1] = {
                                                    Kind: FunctionBody
                                                    [0] = nullptr
                                                    [1] = {
                                                        Kind: Block
                                                        [0] = {
                                                            Kind: ForStatement
                                                            [0] = {
                                                                Kind: NameList
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'c'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ExpressionList
                                                                [0] = {
                                                                    Kind: FunctionCall
                                                                    [0] = {
                                                                        Kind: Member
                                                                        [0] = {
                                                                            Kind: Identifier
                                                                            [0] = 'utf8'
                                                                        }
                                                                        [1] = {
                                                                            Kind: Identifier
                                                                            [0] = 'codes'
                                                                        }
                                                                    }
                                                                    [1] = {
                                                                        Kind: ArgumentList
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 's'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            [2] = {
                                                                Kind: Block
                                                                [0] = {
                                                                    Kind: FunctionCall
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 'assert'
                                                                    }
                                                                    [1] = {
                                                                        Kind: ArgumentList
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 'c'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'errorcodes'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "ab\xff"
                            }
                        }
                    }
                }
                [2] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'errorcodes'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\u{110000}"
                            }
                        }
                    }
                }
                [3] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'errorcodes'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "in\x80valid"
                            }
                        }
                    }
                }
                [4] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'errorcodes'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\xbfinvalid"
                            }
                        }
                    }
                }
                [5] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'errorcodes'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\206\177\206\187\207\134\xBF\206\177"
                            }
                        }
                    }
                }
                [6] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 'f'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'utf8'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'codes'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: String
                                            [0] = ""
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [7] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = ""
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                        }
                    }
                }
                [8] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = ""
                                            }
                                            [1] = {
                                                Kind: UnaryOperation
                                                [0] = "-"
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                        }
                    }
                }
                [9] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = ""
                                            }
                                            [1] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'math'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'mininteger'
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                        }
                    }
                }
            }
        }
        [11] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "position out of bounds"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "abc"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: Numeric
                        [0] = 5
                    }
                }
            }
        }
        [12] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "position out of bounds"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "abc"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: UnaryOperation
                        [0] = "-"
                        [1] = {
                            Kind: Numeric
                            [0] = 4
                        }
                    }
                }
            }
        }
        [13] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "position out of bounds"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = ""
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: Numeric
                        [0] = 2
                    }
                }
            }
        }
        [14] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "position out of bounds"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = ""
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: UnaryOperation
                        [0] = "-"
                        [1] = {
                            Kind: Numeric
                            [0] = 1
                        }
                    }
                }
            }
        }
        [15] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "continuation byte"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "\240\166\167\186"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: Numeric
                        [0] = 2
                    }
                }
            }
        }
        [16] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "continuation byte"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "\240\166\167\186"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: Numeric
                        [0] = 2
                    }
                }
            }
        }
        [17] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "continuation byte"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'offset'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "\x80"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                }
            }
        }
        [18] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "out of bounds"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'len'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "abc"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 0
                    }
                    [4] = {
                        Kind: Numeric
                        [0] = 2
                    }
                }
            }
        }
        [19] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "out of bounds"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'len'
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "abc"
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [4] = {
                        Kind: Numeric
                        [0] = 4
                    }
                }
            }
        }
        [20] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 's'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "hello World"
                    }
                }
            }
        }
        [21] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 't'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'string'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'byte'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 's'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [2] = {
                                                Kind: UnaryOperation
                                                [0] = "-"
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [22] = {
            Kind: ForStatement
            [0] = {
                Kind: Identifier
                [0] = 'i'
            }
            [1] = {
                Kind: Numeric
                [0] = 1
            }
            [2] = {
                Kind: FunctionCall
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = 'utf8'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'len'
                    }
                }
                [1] = {
                    Kind: ArgumentList
                    [0] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                    }
                }
            }
            [3] = nullptr
            [4] = {
                Kind: Block
                [0] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 't'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'i'
                                    }
                                }
                                [2] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'string'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'byte'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 's'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [23] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Identifier
                        [0] = 's'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 't'
                    }
                }
            }
        }
        [24] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\230\177\137\229\173\151/\230\188\162\229\173\151"
                    }
                    [1] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 27721
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 23383
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 47
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 28450
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 23383
                                }
                            }
                        }
                    }
                }
            }
        }
        [25] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\195\161\195\169\195\173\128"
                            }
                        }
                    }
                }
                [1] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 't'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: TableConstructor
                                [0] = {
                                    Kind: FieldList
                                    [0] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'codepoint'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 's'
                                                    }
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                    [2] = {
                                                        Kind: BinaryOperation
                                                        [0] = "-"
                                                        [1] = {
                                                            Kind: UnaryOperation
                                                            [0] = "#"
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                        }
                                                        [2] = {
                                                            Kind: Numeric
                                                            [0] = 1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [2] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "and"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: UnaryOperation
                                                [0] = "#"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 't'
                                                }
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 3
                                            }
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: Index
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 't'
                                                }
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 225
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 't'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 233
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 't'
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 3
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 237
                                    }
                                }
                            }
                        }
                    }
                }
                [3] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkerror'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "invalid UTF%-8 code"
                            }
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'codepoint'
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [3] = {
                                Kind: Numeric
                                [0] = 1
                            }
                            [4] = {
                                Kind: UnaryOperation
                                [0] = "#"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 's'
                                }
                            }
                        }
                    }
                }
                [4] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkerror'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "out of bounds"
                            }
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'codepoint'
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [3] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                }
                [5] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 't'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: TableConstructor
                            [0] = {
                                Kind: FieldList
                                [0] = {
                                    Kind: TableValue
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'utf8'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'codepoint'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 's'
                                                }
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 4
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 3
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [6] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 't'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                    }
                }
                [7] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkerror'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "out of bounds"
                            }
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'codepoint'
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [3] = {
                                Kind: UnaryOperation
                                [0] = "-"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = "#"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 's'
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                            [4] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
                [8] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkerror'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "out of bounds"
                            }
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'codepoint'
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [3] = {
                                Kind: Numeric
                                [0] = 1
                            }
                            [4] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                }
                [9] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codepoint'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "\u{D7FF}"
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "-"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 55296
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                    }
                }
                [10] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codepoint'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "\u{E000}"
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 57343
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                    }
                }
                [11] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codepoint'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "\u{D800}"
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [3] = {
                                                Kind: Boolean
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 55296
                                }
                            }
                        }
                    }
                }
                [12] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codepoint'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "\u{DFFF}"
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [3] = {
                                                Kind: Boolean
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 57343
                                }
                            }
                        }
                    }
                }
                [13] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codepoint'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "\u{7FFFFFFF}"
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [3] = {
                                                Kind: Boolean
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2147483647
                                }
                            }
                        }
                    }
                }
            }
        }
        [26] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'assert'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'char'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = ""
                        }
                    }
                }
            }
        }
        [27] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'assert'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'char'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 0
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 97
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 98
                                    }
                                    [3] = {
                                        Kind: Numeric
                                        [0] = 99
                                    }
                                    [4] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = "\0abc\1"
                        }
                    }
                }
            }
        }
        [28] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'assert'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'codepoint'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'utf8'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'char'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Numeric
                                                    [0] = 1114111
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 1114111
                        }
                    }
                }
            }
        }
        [29] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'assert'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'utf8'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'codepoint'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'utf8'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'char'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Numeric
                                                    [0] = 2147483647
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [3] = {
                                        Kind: Boolean
                                        [0] = 1
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "-"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "<<"
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 31
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
            }
        }
        [30] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "value out of range"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'char'
                        }
                    }
                    [2] = {
                        Kind: BinaryOperation
                        [0] = "+"
                        [1] = {
                            Kind: Numeric
                            [0] = 2147483647
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 1
                        }
                    }
                }
            }
        }
        [31] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkerror'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "value out of range"
                    }
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'utf8'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'char'
                        }
                    }
                    [2] = {
                        Kind: UnaryOperation
                        [0] = "-"
                        [1] = {
                            Kind: Numeric
                            [0] = 1
                        }
                    }
                }
            }
        }
        [32] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'invalid'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'checkerror'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: String
                                        [0] = "invalid UTF%-8 code"
                                    }
                                    [1] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'codepoint'
                                        }
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: UnaryOperation
                                        [0] = "not"
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'len'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 's'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [33] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xF4\x9F\xBF\xBF"
                    }
                }
            }
        }
        [34] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\u{D800}"
                    }
                }
            }
        }
        [35] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\u{DFFF}"
                    }
                }
            }
        }
        [36] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xC0\x80"
                    }
                }
            }
        }
        [37] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xC1\xBF"
                    }
                }
            }
        }
        [38] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xE0\x9F\xBF"
                    }
                }
            }
        }
        [39] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xF0\x8F\xBF\xBF"
                    }
                }
            }
        }
        [40] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\x80"
                    }
                }
            }
        }
        [41] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xBF"
                    }
                }
            }
        }
        [42] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xFE"
                    }
                }
            }
        }
        [43] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'invalid'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\xFF"
                    }
                }
            }
        }
        [44] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = ""
                    }
                    [1] = {
                        Kind: TableConstructor
                        [0] = nullptr
                    }
                }
            }
        }
        [45] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 's'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: String
                    [0] = "\0 \x7F\z\xC2\x80 \xDF\xBF\z\xE0\xA0\x80 \xEF\xBF\xBF\z\xF0\x90\x80\x80  \xF4\x8F\xBF\xBF"
                }
            }
        }
        [46] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 's'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'string'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'gsub'
                        }
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [1] = {
                                Kind: String
                                [0] = " "
                            }
                            [2] = {
                                Kind: String
                                [0] = ""
                            }
                        }
                    }
                }
            }
        }
        [47] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Identifier
                        [0] = 's'
                    }
                    [1] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 127
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 128
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 2047
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 2048
                                }
                            }
                            [5] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 65535
                                }
                            }
                            [6] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 65536
                                }
                            }
                            [7] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1114111
                                }
                            }
                        }
                    }
                }
            }
        }
        [48] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "\u{4000000}\u{7FFFFFFF}"
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 12
                                }
                            }
                        }
                    }
                }
                [2] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [1] = {
                                Kind: TableConstructor
                                [0] = {
                                    Kind: FieldList
                                    [0] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 67108864
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 2147483647
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                    }
                }
                [3] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: String
                            [0] = "\u{200000}\u{3FFFFFF}"
                        }
                    }
                }
                [4] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 10
                                }
                            }
                        }
                    }
                }
                [5] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [1] = {
                                Kind: TableConstructor
                                [0] = {
                                    Kind: FieldList
                                    [0] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 2097152
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 67108863
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                    }
                }
                [6] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 's'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: String
                            [0] = "\u{10000}\u{1fffff}"
                        }
                    }
                }
                [7] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 's'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 8
                                }
                            }
                        }
                    }
                }
                [8] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'check'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 's'
                            }
                            [1] = {
                                Kind: TableConstructor
                                [0] = {
                                    Kind: FieldList
                                    [0] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 65536
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 2097151
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                    }
                }
            }
        }
        [49] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'x'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\230\151\165\230\156\172\232\170\158a-4\0\195\169\195\179"
                    }
                }
            }
        }
        [50] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Identifier
                        [0] = 'x'
                    }
                    [1] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 26085
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 26412
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 35486
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 97
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 45
                                }
                            }
                            [5] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 52
                                }
                            }
                            [6] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                            [7] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 233
                                }
                            }
                            [8] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 243
                                }
                            }
                        }
                    }
                }
            }
        }
        [51] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\240\163\178\183\240\160\156\142\240\160\177\147\240\161\129\187\240\160\181\188ab\240\160\186\162"
                    }
                    [1] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 146615
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 132878
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 134227
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 135291
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 134524
                                }
                            }
                            [5] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 97
                                }
                            }
                            [6] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 98
                                }
                            }
                            [7] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 134818
                                }
                            }
                        }
                    }
                }
            }
        }
        [52] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'check'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "\240\168\179\138\240\169\182\152\240\166\167\186\240\168\179\146\240\165\132\171\240\164\147\147\xF4\x8F\xBF\xBF"
                    }
                    [1] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 167114
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 171416
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 158202
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 167122
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 151851
                                }
                            }
                            [5] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 148691
                                }
                            }
                            [6] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1114111
                                }
                            }
                        }
                    }
                }
            }
        }
        [53] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'i'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Numeric
                        [0] = 0
                    }
                }
            }
        }
        [54] = {
            Kind: ForStatement
            [0] = {
                Kind: NameList
                [0] = {
                    Kind: Identifier
                    [0] = 'p'
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'c'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'string'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'gmatch'
                        }
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = ".."
                                [1] = {
                                    Kind: String
                                    [0] = "()("
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = ".."
                                    [1] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'charpattern'
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = ")"
                                    }
                                }
                            }
                        }
                    }
                }
            }
            [2] = {
                Kind: Block
                [0] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 'i'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: BinaryOperation
                            [0] = "+"
                            [1] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'offset'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'p'
                                }
                            }
                        }
                    }
                }
                [2] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'len'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'p'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'len'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 'i'
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                    }
                }
                [3] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'assert'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'utf8'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'len'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'c'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                }
                [4] = {
                    Kind: ForStatement
                    [0] = {
                        Kind: Identifier
                        [0] = 'j'
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [2] = {
                        Kind: BinaryOperation
                        [0] = "-"
                        [1] = {
                            Kind: UnaryOperation
                            [0] = "#"
                            [1] = {
                                Kind: Identifier
                                [0] = 'c'
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 1
                        }
                    }
                    [3] = nullptr
                    [4] = {
                        Kind: Block
                        [0] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'utf8'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'offset'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 0
                                                    }
                                                    [2] = {
                                                        Kind: BinaryOperation
                                                        [0] = "-"
                                                        [1] = {
                                                            Kind: BinaryOperation
                                                            [0] = "+"
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'p'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'j'
                                                            }
                                                        }
                                                        [2] = {
                                                            Kind: Numeric
                                                            [0] = 1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 'p'
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [55] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = "ok"
                }
            }
        }
    }
}