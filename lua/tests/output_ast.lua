{
    Kind: Chunk
    [0] = {
        Kind: Block
        [0] = {
            Kind: Semicolon
        }
        [1] = {
            Kind: Semicolon
        }
        [2] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = "testing syntax"
                }
            }
        }
        [3] = {
            Kind: Semicolon
        }
        [4] = {
            Kind: Semicolon
        }
        [5] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'debug'
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
                                [0] = "debug"
                            }
                        }
                    }
                }
            }
        }
        [6] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'checkload'
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
                            [0] = 'msg'
                        }
                    }
                    [1] = {
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
                                                        Kind: Identifier
                                                        [0] = 'select'
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Numeric
                                                                [0] = 2
                                                            }
                                                            [1] = {
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
                                                                            [0] = 's'
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
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
        [7] = {
            Kind: LocalStatement
            [0] = {
                Kind: AttributeList
                [0] = {
                    Kind: Identifier
                    [0] = 'a'
                }
            }
        }
        [8] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: Semicolon
                }
                [1] = {
                    Kind: Semicolon
                }
                [2] = {
                    Kind: Semicolon
                }
            }
        }
        [9] = {
            Kind: Semicolon
        }
        [10] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: Semicolon
                }
                [1] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: Numeric
                            [0] = 3
                        }
                    }
                }
                [2] = {
                    Kind: Semicolon
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
                                [0] = '=='
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'a'
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
        [11] = {
            Kind: Semicolon
        }
        [12] = {
            Kind: Semicolon
        }
        [13] = {
            Kind: IfStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: Boolean
                    [0] = 0
                }
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '//'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                    }
                    [1] = {
                        Kind: Semicolon
                    }
                    [2] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '%'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                    }
                }
            }
        }
        [14] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: UnaryOperation
                    [0] = '#'
                    [1] = {
                        Kind: BinaryOperation
                        [0] = '^'
                        [1] = {
                            Kind: Numeric
                            [0] = 2
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 2
                        }
                    }
                }
            }
        }
        [15] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '^'
                            [1] = {
                                Kind: Numeric
                                [0] = 2
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '^'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '^'
                            [1] = {
                                Kind: Numeric
                                [0] = 2
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '^'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                        }
                    }
                }
            }
        }
        [16] = {
            Kind: Semicolon
        }
        [17] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '*'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '^'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '*'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '^'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                    }
                }
            }
        }
        [18] = {
            Kind: Semicolon
        }
        [19] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '^'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '/'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 4
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: UnaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '^'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: UnaryOperation
                                        [0] = '-'
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = '-'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: UnaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = '-'
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
        [20] = {
            Kind: Semicolon
        }
        [21] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: UnaryOperation
                                [0] = 'not'
                                [1] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 2
                            }
                        }
                        [2] = {
                            Kind: UnaryOperation
                            [0] = 'not'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '>'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '<'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [22] = {
            Kind: Semicolon
        }
        [23] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '-'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 5
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '-'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 9
                            }
                        }
                    }
                }
            }
        }
        [24] = {
            Kind: Semicolon
        }
        [25] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '^'
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '^'
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = '-'
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 4
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '*'
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
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
        }
        [26] = {
            Kind: Semicolon
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '%'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 5
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 2
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 5
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 2
                            }
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '*'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '/'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 3
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '..'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '+'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '*'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "33"
                            }
                        }
                    }
                }
            }
        }
        [29] = {
            Kind: Semicolon
        }
        [30] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: UnaryOperation
                            [0] = 'not'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '>'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '+'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '*'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '>'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '..'
                                [1] = {
                                    Kind: String
                                    [0] = "a"
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "b"
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "a"
                            }
                        }
                    }
                }
            }
        }
        [31] = {
            Kind: Semicolon
        }
        [32] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '|'
                            [1] = {
                                Kind: Numeric
                                [0] = 240
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '~'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 204
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '&'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 170
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 253
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 244
                        }
                    }
                }
            }
        }
        [33] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '|'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '~'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '&'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 253
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 170
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 204
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 240
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 244
                        }
                    }
                }
            }
        }
        [34] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '&'
                            [1] = {
                                Kind: Numeric
                                [0] = 240
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 15
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 16
                        }
                    }
                }
            }
        }
        [35] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '//'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '//'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '^'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '^'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 5
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 2
                        }
                    }
                }
            }
        }
        [36] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '+'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '//'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '//'
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = '*'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 4
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 5
                                            }
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = '^'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: BinaryOperation
                                                [0] = '^'
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 3
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 2
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 9
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '/'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '%'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '+'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '//'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '//'
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = '*'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 4
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 5
                                            }
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = '^'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: BinaryOperation
                                                [0] = '^'
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 3
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 2
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 9
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '/'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '%'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
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
        [37] = {
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
                        [0] = 'not'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: Boolean
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Boolean
                                    [0] = 0
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
        [38] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'or'
                            [1] = {
                                Kind: Boolean
                                [0] = 1
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 0
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
        [39] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'or'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [2] = {
                                        Kind: Boolean
                                        [0] = 0
                                    }
                                }
                                [2] = {
                                    Kind: Boolean
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 0
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
        [40] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'and'
                                    [1] = {
                                        Kind: Null
                                        [0] = 'nil'
                                    }
                                    [2] = {
                                        Kind: Boolean
                                        [0] = 1
                                    }
                                }
                                [2] = {
                                    Kind: Boolean
                                    [0] = 0
                                }
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: Boolean
                            [0] = 0
                        }
                    }
                }
            }
        }
        [41] = {
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
                        Kind: Numeric
                        [0] = 1
                    }
                    [1] = {
                        Kind: Null
                        [0] = 'nil'
                    }
                }
            }
        }
        [42] = {
            Kind: Semicolon
        }
        [43] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: UnaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                            }
                            [2] = {
                                Kind: UnaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'and'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = '-'
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 1.2
                                        }
                                    }
                                    [2] = {
                                        Kind: UnaryOperation
                                        [0] = '-'
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 4
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 0.7
                            }
                        }
                    }
                }
            }
        }
        [44] = {
            Kind: Semicolon
        }
        [45] = {
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
                        Kind: BinaryOperation
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'b'
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 2
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 11
                            }
                        }
                    }
                }
            }
        }
        [46] = {
            Kind: Semicolon
        }
        [47] = {
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
                        [0] = 'x'
                    }
                }
            }
        }
        [48] = {
            Kind: Semicolon
        }
        [49] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: BinaryOperation
                    [0] = 'and'
                    [1] = {
                        Kind: BinaryOperation
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'or'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '<'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: Boolean
                            [0] = 1
                        }
                    }
                    [2] = {
                        Kind: BinaryOperation
                        [0] = '=='
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '<'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 4
                        }
                    }
                }
            }
        }
        [50] = {
            Kind: Semicolon
        }
        [51] = {
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
                        [0] = 'x'
                    }
                }
            }
        }
        [52] = {
            Kind: Semicolon
        }
        [53] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'x'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'y'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 2
                    }
                }
            }
        }
        [54] = {
            Kind: Semicolon
        }
        [55] = {
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
                        [0] = 'or'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '>'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'y'
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'y'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 2
                            }
                        }
                    }
                }
            }
        }
        [56] = {
            Kind: Semicolon
        }
        [57] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'y'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Numeric
                    [0] = 2
                }
                [1] = {
                    Kind: Numeric
                    [0] = 1
                }
            }
        }
        [58] = {
            Kind: Semicolon
        }
        [59] = {
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
                        [0] = 'or'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '>'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'y'
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'y'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 2
                            }
                        }
                    }
                }
            }
        }
        [60] = {
            Kind: Semicolon
        }
        [61] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Numeric
                                [0] = 1234567890
                            }
                            [2] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'tonumber'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: String
                                            [0] = '1234567890'
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1234567890
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1234567891
                            }
                        }
                    }
                }
            }
        }
        [62] = {
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
                                [0] = 'operand'
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
                                            Kind: Numeric
                                            [0] = 3
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 100
                                        }
                                    }
                                    [2] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 5
                                        }
                                    }
                                    [3] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: UnaryOperation
                                            [0] = '-'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 10
                                            }
                                        }
                                    }
                                    [4] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: UnaryOperation
                                            [0] = '-'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 5
                                            }
                                        }
                                    }
                                    [5] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 10000
                                        }
                                    }
                                    [6] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: UnaryOperation
                                            [0] = '-'
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 10000
                                            }
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
                                [0] = 'operator'
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
                                            [0] = "+"
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "-"
                                        }
                                    }
                                    [2] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "*"
                                        }
                                    }
                                    [3] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "/"
                                        }
                                    }
                                    [4] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "//"
                                        }
                                    }
                                    [5] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "%"
                                        }
                                    }
                                    [6] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "^"
                                        }
                                    }
                                    [7] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "&"
                                        }
                                    }
                                    [8] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "|"
                                        }
                                    }
                                    [9] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "^"
                                        }
                                    }
                                    [10] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "<<"
                                        }
                                    }
                                    [11] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = ">>"
                                        }
                                    }
                                    [12] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "=="
                                        }
                                    }
                                    [13] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "~="
                                        }
                                    }
                                    [14] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "<"
                                        }
                                    }
                                    [15] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = ">"
                                        }
                                    }
                                    [16] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = "<="
                                        }
                                    }
                                    [17] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: String
                                            [0] = ">="
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [2] = {
                    Kind: ForStatement
                    [0] = {
                        Kind: NameList
                        [0] = {
                            Kind: Identifier
                            [0] = '_'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'op'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'ipairs'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'operator'
                                    }
                                }
                            }
                        }
                    }
                    [2] = {
                        Kind: Block
                        [0] = {
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
                                                                                [0] = [[return function (x,y)
                return x %s y
              end]]
                                                                            }
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'op'
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
                                            Kind: ArgumentList
                                            [0] = nullptr
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: Semicolon
                        }
                        [2] = {
                            Kind: ForStatement
                            [0] = {
                                Kind: NameList
                                [0] = {
                                    Kind: Identifier
                                    [0] = '_'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'o1'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'ipairs'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'operand'
                                            }
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Block
                                [0] = {
                                    Kind: ForStatement
                                    [0] = {
                                        Kind: NameList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = '_'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'o2'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ipairs'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'operand'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: Block
                                        [0] = {
                                            Kind: LocalStatement
                                            [0] = {
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: AttributeList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'gab'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
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
                                                                    Kind: Identifier
                                                                    [0] = 'o1'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'o2'
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [1] = {
                                            Kind: AssignmentStatement
                                            [0] = {
                                                Kind: VariableList
                                                [0] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = '_ENV'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'XX'
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'o1'
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: LocalStatement
                                            [0] = {
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: AttributeList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'code'
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
                                                                    [0] = "return XX %s %s"
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'op'
                                                                }
                                                                [2] = {
                                                                    Kind: Identifier
                                                                    [0] = 'o2'
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
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: AttributeList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'res'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
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
                                                                                    [0] = 'code'
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
                                                        [0] = '=='
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'res'
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'gab'
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
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = '_ENV'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'XX'
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'o2'
                                                }
                                            }
                                        }
                                        [6] = {
                                            Kind: AssignmentStatement
                                            [0] = {
                                                Kind: VariableList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'code'
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
                                                                [0] = "return (%s) %s XX"
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'o1'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'op'
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [7] = {
                                            Kind: AssignmentStatement
                                            [0] = {
                                                Kind: VariableList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'res'
                                                }
                                            }
                                            [1] = {
                                                Kind: ExpressionList
                                                [0] = {
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
                                                                                [0] = 'code'
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
                                                        [0] = '=='
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'res'
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'gab'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [9] = {
                                            Kind: AssignmentStatement
                                            [0] = {
                                                Kind: VariableList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'code'
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
                                                                [0] = "return (%s) %s %s"
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'o1'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'op'
                                                            }
                                                            [3] = {
                                                                Kind: Identifier
                                                                [0] = 'o2'
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [10] = {
                                            Kind: AssignmentStatement
                                            [0] = {
                                                Kind: VariableList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'res'
                                                }
                                            }
                                            [1] = {
                                                Kind: ExpressionList
                                                [0] = {
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
                                                                                [0] = 'code'
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
                                                        [0] = '=='
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'res'
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'gab'
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
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Member
                            [0] = {
                                Kind: Identifier
                                [0] = '_ENV'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'XX'
                            }
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: Null
                            [0] = 'nil'
                        }
                    }
                }
            }
        }
        [63] = {
            Kind: RepeatStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: Numeric
                    [0] = 1
                }
                [1] = nullptr
            }
        }
        [64] = {
            Kind: Semicolon
        }
        [65] = {
            Kind: RepeatStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: Boolean
                    [0] = 1
                }
                [1] = nullptr
            }
        }
        [66] = {
            Kind: Semicolon
        }
        [67] = {
            Kind: WhileStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: Boolean
                    [0] = 0
                }
                [1] = nullptr
            }
        }
        [68] = {
            Kind: Semicolon
        }
        [69] = {
            Kind: WhileStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: Null
                    [0] = 'nil'
                }
                [1] = nullptr
            }
        }
        [70] = {
            Kind: Semicolon
        }
        [71] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AttributeList
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                    }
                }
                [1] = {
                    Kind: Semicolon
                }
                [2] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'f'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: TableConstructor
                                            [0] = {
                                                Kind: FieldList
                                                [0] = {
                                                    Kind: TableNameValue
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'a'
                                                    }
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: Semicolon
                                }
                                [2] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: TableConstructor
                                            [0] = {
                                                Kind: FieldList
                                                [0] = {
                                                    Kind: TableNameValue
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [3] = {
                                    Kind: Semicolon
                                }
                                [4] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: TableConstructor
                                            [0] = {
                                                Kind: FieldList
                                                [0] = {
                                                    Kind: TableNameValue
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'G'
                                                    }
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
        }
        [72] = {
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
                                [0] = 'code'
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
                                            [0] = "local x = {"
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
                        Kind: Numeric
                        [0] = 257
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
                                        [0] = 'code'
                                    }
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '+'
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = '#'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'code'
                                            }
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
                                    Kind: BinaryOperation
                                    [0] = '..'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'i'
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = ".1,"
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
                                [0] = 'code'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '#'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'code'
                                    }
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
                            Kind: String
                            [0] = "};"
                        }
                    }
                }
                [3] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 'code'
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
                                        [0] = 'code'
                                    }
                                }
                            }
                        }
                    }
                }
                [4] = {
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
                                    [0] = 'ret'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'val'
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
                                                [0] = 'code'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = '..'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'code'
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'ret'
                                                }
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'code'
                                        }
                                    }
                                    [1] = {
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
                                                        [0] = 'code'
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
                                                [0] = '=='
                                                [1] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'code'
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = nullptr
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'val'
                                                }
                                            }
                                        }
                                    }
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
                                [0] = "return (1 ~ (2 or 3))"
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '~'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
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
                                [0] = "return (1 | (2 or 3))"
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '|'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
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
                                [0] = "return (1 + (2 or 3))"
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
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
                                [0] = "return (1 << (2 or 3))"
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '<<'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                        }
                    }
                }
            }
        }
        [73] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'i'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: IfStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = '~='
                                    [1] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'type'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = 'number'
                                    }
                                }
                                [1] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: ReturnStatement
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [1] = {
                                                Kind: String
                                                [0] = 'jojo'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: Semicolon
                        }
                        [2] = {
                            Kind: IfStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = '>'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'i'
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 0
                                    }
                                }
                                [1] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: ReturnStatement
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
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
                                                            Kind: BinaryOperation
                                                            [0] = '-'
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
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [3] = {
                            Kind: Semicolon
                        }
                    }
                }
            }
        }
        [74] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
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
                                    Kind: Identifier
                                    [0] = 'f'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 3
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: TableValue
                            [0] = {
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
                                            Kind: Numeric
                                            [0] = 5
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: TableValue
                            [0] = {
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
                                            Kind: Numeric
                                            [0] = 10
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [75] = {
            Kind: Semicolon
        }
        [76] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'and'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '=='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 3
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '=='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 5
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
                                    [1] = {
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 3
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'x'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 9
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 12
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
        [77] = {
            Kind: Semicolon
        }
        [78] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: Index
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: Null
                                [0] = 'nil'
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
        [79] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
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
                                    Kind: Identifier
                                    [0] = 'f'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: String
                                        [0] = 'alo'
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: TableValue
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'f'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: String
                                        [0] = 'xixi'
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Null
                                [0] = 'nil'
                            }
                        }
                    }
                }
            }
        }
        [80] = {
            Kind: Semicolon
        }
        [81] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'x'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'alo'
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'x'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'xixi'
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 3
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
        [82] = {
            Kind: Semicolon
        }
        [83] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
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
                                Kind: BinaryOperation
                                [0] = '..'
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: String
                                            [0] = 'alo'
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'xixi'
                                }
                            }
                        }
                    }
                }
            }
        }
        [84] = {
            Kind: Semicolon
        }
        [85] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: Index
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = 'aloxixi'
                        }
                    }
                }
            }
        }
        [86] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
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
                                    Kind: Identifier
                                    [0] = 'f'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: TableConstructor
                                        [0] = nullptr
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [87] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = 'jojo'
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'type'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = 'table'
                            }
                        }
                    }
                }
            }
        }
        [88] = {
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
                        Kind: FunctionDefinition
                        [0] = nullptr
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'i'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '<'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 10
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = 'a'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '<'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 20
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = 'b'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '<'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 30
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = 'c'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: Semicolon
                                }
                            }
                        }
                    }
                }
            }
        }
        [89] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
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
                                                    Kind: Numeric
                                                    [0] = 3
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = 'a'
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
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
                                                    Kind: Numeric
                                                    [0] = 12
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = 'b'
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 26
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'c'
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
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
                                            Kind: Numeric
                                            [0] = 100
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
        [90] = {
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
                Kind: Numeric
                [0] = 1000
            }
            [3] = nullptr
            [4] = {
                Kind: Block
                [0] = {
                    Kind: BreakStatement
                }
                [1] = {
                    Kind: Semicolon
                }
            }
        }
        [91] = {
            Kind: Semicolon
        }
        [92] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'n'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Numeric
                        [0] = 100
                    }
                }
            }
        }
        [93] = {
            Kind: Semicolon
        }
        [94] = {
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
                        [0] = 3
                    }
                }
            }
        }
        [95] = {
            Kind: Semicolon
        }
        [96] = {
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
                        [0] = nullptr
                    }
                }
            }
        }
        [97] = {
            Kind: Semicolon
        }
        [98] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Null
                        [0] = 'nil'
                    }
                }
            }
        }
        [99] = {
            Kind: WhileStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: UnaryOperation
                    [0] = 'not'
                    [1] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                }
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'a'
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
                    [1] = {
                        Kind: Semicolon
                    }
                    [2] = {
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
                            [0] = 'n'
                        }
                        [3] = nullptr
                        [4] = {
                            Kind: Block
                            [0] = {
                                Kind: ForStatement
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'i'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'i'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [3] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                                [4] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: VariableList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'a'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = '+'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'a'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: Semicolon
                                    }
                                    [2] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: VariableList
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
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                    [3] = {
                                        Kind: Semicolon
                                    }
                                }
                            }
                            [1] = {
                                Kind: Semicolon
                            }
                        }
                    }
                    [3] = {
                        Kind: Semicolon
                    }
                }
            }
        }
        [100] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '/'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '*'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'n'
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '+'
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'n'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'i'
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
        [101] = {
            Kind: Semicolon
        }
        [102] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
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
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 't'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'n'
                                    }
                                }
                            }
                            [2] = {
                                Kind: UnaryOperation
                                [0] = 'not'
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 't'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 0
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: UnaryOperation
                            [0] = 'not'
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 't'
                                }
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '+'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'n'
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
        [103] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'b'
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
                                    [0] = 'x'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                    [1] = {
                        Kind: Semicolon
                    }
                    [2] = {
                        Kind: RepeatStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '>='
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 12
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: AttributeList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: Semicolon
                                }
                                [2] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '=='
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'b'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 1
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
                                                            [0] = 'b'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Numeric
                                                            [0] = 1
                                                        }
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: Semicolon
                                            }
                                            [2] = {
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: VariableList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 10
                                                    }
                                                }
                                            }
                                            [3] = {
                                                Kind: Semicolon
                                            }
                                            [4] = {
                                                Kind: BreakStatement
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '=='
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'b'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: VariableList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 20
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: Semicolon
                                            }
                                            [2] = {
                                                Kind: BreakStatement
                                            }
                                            [3] = {
                                                Kind: Semicolon
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '=='
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'b'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 3
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: VariableList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 30
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: Semicolon
                                            }
                                        }
                                    }
                                    [3] = {
                                        Kind: ConditionalBlock
                                        [0] = nullptr
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
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'c'
                                                        }
                                                        [3] = {
                                                            Kind: Identifier
                                                            [0] = 'd'
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
                                                                    [0] = 'math'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'sin'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: Numeric
                                                                        [0] = 1
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: Semicolon
                                            }
                                            [2] = {
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: VariableList
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = '+'
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'x'
                                                        }
                                                        [2] = {
                                                            Kind: Numeric
                                                            [0] = 1
                                                        }
                                                    }
                                                }
                                            }
                                            [3] = {
                                                Kind: Semicolon
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [3] = {
                        Kind: Semicolon
                    }
                    [4] = {
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                        }
                    }
                }
            }
        }
        [104] = {
            Kind: Semicolon
        }
        [105] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
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
                                                    Kind: Numeric
                                                    [0] = 1
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
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
                                                    Kind: Numeric
                                                    [0] = 2
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 20
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 3
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 30
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
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
                                            Kind: Numeric
                                            [0] = 4
                                        }
                                    }
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
        }
        [106] = {
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
                        Kind: FunctionDefinition
                        [0] = nullptr
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'i'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '<'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 10
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = 'a'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '<'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 20
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = 'b'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '<'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 30
                                            }
                                        }
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = 'c'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [3] = {
                                        Kind: ConditionalBlock
                                        [0] = nullptr
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 8
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
        [107] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
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
                                                    Kind: Numeric
                                                    [0] = 3
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = 'a'
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
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
                                                    Kind: Numeric
                                                    [0] = 12
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = 'b'
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 26
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'c'
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
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
                                            Kind: Numeric
                                            [0] = 100
                                        }
                                    }
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
        }
        [108] = {
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
                        Kind: Null
                        [0] = 'nil'
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 23
                    }
                }
            }
        }
        [109] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
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
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '+'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '*'
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
                                                        Kind: Numeric
                                                        [0] = 100
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                            }
                        }
                        [1] = {
                            Kind: TableValue
                            [0] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '+'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'b'
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [110] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 19
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 25
                            }
                        }
                    }
                }
            }
        }
        [111] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: TableConstructor
                    [0] = {
                        Kind: FieldList
                        [0] = {
                            Kind: TableNameValue
                            [0] = {
                                Kind: Identifier
                                [0] = 'f'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '+'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                            }
                        }
                        [1] = {
                            Kind: TableNameValue
                            [0] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'b'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                        }
                    }
                }
            }
        }
        [112] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'f'
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 5
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 25
                            }
                        }
                    }
                }
            }
        }
        [113] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'a'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: TableConstructor
                    [0] = {
                        Kind: FieldList
                        [0] = {
                            Kind: TableNameValue
                            [0] = {
                                Kind: Identifier
                                [0] = 'y'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                    }
                }
            }
        }
        [114] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
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
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'y'
                                }
                            }
                        }
                    }
                }
            }
        }
        [115] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: Index
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
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
        [116] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'i'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: WhileStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [1] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: IfStatement
                                        [0] = {
                                            Kind: ConditionalBlock
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = '>'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 0
                                                }
                                            }
                                            [1] = {
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
                                                            [0] = '-'
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
                                                    Kind: Semicolon
                                                }
                                            }
                                        }
                                        [1] = {
                                            Kind: ConditionalBlock
                                            [0] = nullptr
                                            [1] = {
                                                Kind: Block
                                                [0] = {
                                                    Kind: ReturnStatement
                                                    [0] = nullptr
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: Semicolon
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: Semicolon
                        }
                    }
                }
            }
        }
        [117] = {
            Kind: Semicolon
        }
        [118] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'g'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'i'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: WhileStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [1] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: IfStatement
                                        [0] = {
                                            Kind: ConditionalBlock
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = '>'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 0
                                                }
                                            }
                                            [1] = {
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
                                                            [0] = '-'
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
                                            }
                                        }
                                        [1] = {
                                            Kind: ConditionalBlock
                                            [0] = nullptr
                                            [1] = {
                                                Kind: Block
                                                [0] = {
                                                    Kind: ReturnStatement
                                                    [0] = nullptr
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
        [119] = {
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
                        Kind: Numeric
                        [0] = 10
                    }
                }
            }
        }
        [120] = {
            Kind: Semicolon
        }
        [121] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'g'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Numeric
                        [0] = 10
                    }
                }
            }
        }
        [122] = {
            Kind: Semicolon
        }
        [123] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: FunctionDefinition
                    [0] = {
                        Kind: FunctionName
                        [0] = {
                            Kind: Identifier
                            [0] = 'f'
                        }
                    }
                    [1] = {
                        Kind: FunctionBody
                        [0] = nullptr
                        [1] = {
                            Kind: Block
                            [0] = {
                                Kind: ReturnStatement
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
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
                [1] = {
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
                            [2] = {
                                Kind: Identifier
                                [0] = 'c'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'f'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = nullptr
                                }
                            }
                        }
                    }
                }
                [2] = {
                    Kind: Semicolon
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
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'and'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '=='
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '=='
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'b'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'c'
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
                [4] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'b'
                        }
                        [2] = {
                            Kind: Identifier
                            [0] = 'c'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'f'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                    }
                }
                [5] = {
                    Kind: Semicolon
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
                                [0] = 'and'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'and'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '=='
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '=='
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'b'
                                        }
                                        [2] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'c'
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
        }
        [124] = {
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
                        Kind: BinaryOperation
                        [0] = 'and'
                        [1] = {
                            Kind: Numeric
                            [0] = 3
                        }
                        [2] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'f'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                    }
                }
            }
        }
        [125] = {
            Kind: Semicolon
        }
        [126] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'b'
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
        [127] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'g'
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = nullptr
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'f'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = nullptr
                        }
                    }
                    [1] = {
                        Kind: Semicolon
                    }
                    [2] = {
                        Kind: ReturnStatement
                        [0] = nullptr
                    }
                }
            }
        }
        [128] = {
            Kind: Semicolon
        }
        [129] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'g'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
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
        [130] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'g'
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = nullptr
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                                [2] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = nullptr
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [131] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
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
                        Kind: Identifier
                        [0] = 'g'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = nullptr
                    }
                }
            }
        }
        [132] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'b'
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
        [133] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = '+'
                }
            }
        }
        [134] = {
            Kind: Semicolon
        }
        [135] = {
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
                                Kind: Attribute
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'prog'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'const'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = [[local x <XXX> = 10]]
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkload'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'prog'
                            }
                            [1] = {
                                Kind: String
                                [0] = "unknown attribute 'XXX'"
                            }
                        }
                    }
                }
                [2] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkload'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = [[local xxx <const> = 20; xxx = 10]]
                            }
                            [1] = {
                                Kind: String
                                [0] = ":1: attempt to assign to const variable 'xxx'"
                            }
                        }
                    }
                }
                [3] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkload'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = [[
    local xx;
    local xxx <const> = 20;
    local yyy;
    local function foo ()
      local abc = xx + yyy + xxx;
      return function () return function () xxx = yyy end end
    end
  ]]
                            }
                            [1] = {
                                Kind: String
                                [0] = ":6: attempt to assign to const variable 'xxx'"
                            }
                        }
                    }
                }
                [4] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'checkload'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = [[
    local x <close> = nil
    x = io.open()
  ]]
                            }
                            [1] = {
                                Kind: String
                                [0] = ":2: attempt to assign to const variable 'x'"
                            }
                        }
                    }
                }
            }
        }
        [136] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: String
                    [0] = [[
return function ( a , b , c , d , e )
  local x = a >= b or c or ( d and e ) or nil
  return x
end , { a = 1 , b = 2 >= 1 , } or { 1 };
]]
                }
            }
        }
        [137] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
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
                                [0] = 'f'
                            }
                            [1] = {
                                Kind: String
                                [0] = "%s+"
                            }
                            [2] = {
                                Kind: String
                                [0] = "\n"
                            }
                        }
                    }
                }
            }
        }
        [138] = {
            Kind: Semicolon
        }
        [139] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'a'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: FunctionCall
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
                                    [0] = 'f'
                                }
                            }
                        }
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = nullptr
                    }
                }
            }
        }
        [140] = {
            Kind: Semicolon
        }
        [141] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: Member
                            [0] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'b'
                            }
                        }
                    }
                }
            }
        }
        [142] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'g'
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'b'
                    }
                    [2] = {
                        Kind: Identifier
                        [0] = 'c'
                    }
                    [3] = {
                        Kind: Identifier
                        [0] = 'd'
                    }
                    [4] = {
                        Kind: Identifier
                        [0] = 'e'
                    }
                }
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: UnaryOperation
                                [0] = 'not'
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = 'and'
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = 'or'
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = 'or'
                                                [1] = {
                                                    Kind: BinaryOperation
                                                    [0] = '>='
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'a'
                                                    }
                                                    [2] = {
                                                        Kind: Identifier
                                                        [0] = 'b'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'c'
                                                }
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'd'
                                            }
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 'e'
                                        }
                                    }
                                    [2] = {
                                        Kind: Null
                                        [0] = 'nil'
                                    }
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: ConditionalBlock
                            [0] = nullptr
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [1] = {
                        Kind: Semicolon
                    }
                }
            }
        }
        [143] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'h'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'b'
                        }
                        [2] = {
                            Kind: Identifier
                            [0] = 'c'
                        }
                        [3] = {
                            Kind: Identifier
                            [0] = 'd'
                        }
                        [4] = {
                            Kind: Identifier
                            [0] = 'e'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
                            Kind: WhileStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = 'or'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = 'or'
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = 'or'
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = '>='
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'a'
                                                }
                                                [2] = {
                                                    Kind: Identifier
                                                    [0] = 'b'
                                                }
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'c'
                                            }
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = 'and'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'd'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'e'
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: Null
                                        [0] = 'nil'
                                    }
                                }
                                [1] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: ReturnStatement
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: Semicolon
                        }
                        [2] = {
                            Kind: ReturnStatement
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                    }
                }
            }
        }
        [144] = {
            Kind: Semicolon
        }
        [145] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Boolean
                                    [0] = 1
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'g'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
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
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 1
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
        }
        [146] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: String
                                                [0] = 'a'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'a'
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'g'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: String
                                                [0] = 'a'
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
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = 'a'
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
        }
        [147] = {
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
                        [0] = '~='
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
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = 'a'
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: Null
                            [0] = 'nil'
                        }
                    }
                    [1] = {
                        Kind: String
                        [0] = ""
                    }
                }
            }
        }
        [148] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: String
                                                [0] = 'a'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'a'
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'g'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: String
                                                [0] = 'a'
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
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = 'a'
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
        }
        [149] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [3] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [4] = {
                                                Kind: String
                                                [0] = 'x'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'x'
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'g'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [3] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [4] = {
                                                Kind: String
                                                [0] = 'x'
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
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [3] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [4] = {
                                            Kind: String
                                            [0] = 'x'
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
        }
        [150] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [3] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [4] = {
                                                Kind: String
                                                [0] = 'x'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'g'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [3] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [4] = {
                                                Kind: String
                                                [0] = 'x'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [3] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [4] = {
                                            Kind: String
                                            [0] = 'x'
                                        }
                                    }
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
        }
        [151] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '=='
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [3] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [4] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'g'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                            [3] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [4] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [3] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                        [4] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                    }
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
        }
        [152] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = 'and'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '<'
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 3
                                        }
                                    }
                                    [2] = {
                                        Kind: Boolean
                                        [0] = 1
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = '<'
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 3
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '<'
                                [1] = {
                                    Kind: String
                                    [0] = 'a'
                                }
                                [2] = {
                                    Kind: String
                                    [0] = 'b'
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
        [153] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: BinaryOperation
                    [0] = 'and'
                    [1] = {
                        Kind: BinaryOperation
                        [0] = '<'
                        [1] = {
                            Kind: Numeric
                            [0] = 2
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 3
                        }
                    }
                    [2] = {
                        Kind: UnaryOperation
                        [0] = 'not'
                        [1] = {
                            Kind: Numeric
                            [0] = 3
                        }
                    }
                }
            }
        }
        [154] = {
            Kind: Semicolon
        }
        [155] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: Identifier
                            [0] = 'x'
                        }
                        [2] = {
                            Kind: Boolean
                            [0] = 0
                        }
                    }
                }
            }
        }
        [156] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: BinaryOperation
                    [0] = 'or'
                    [1] = {
                        Kind: BinaryOperation
                        [0] = '<'
                        [1] = {
                            Kind: Numeric
                            [0] = 2
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 1
                        }
                    }
                    [2] = {
                        Kind: BinaryOperation
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '>'
                            [1] = {
                                Kind: Numeric
                                [0] = 2
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = 'a'
                        }
                    }
                }
            }
        }
        [157] = {
            Kind: Semicolon
        }
        [158] = {
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
                        [0] = '=='
                        [1] = {
                            Kind: Identifier
                            [0] = 'x'
                        }
                        [2] = {
                            Kind: String
                            [0] = 'a'
                        }
                    }
                }
            }
        }
        [159] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AttributeList
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                    }
                }
                [1] = {
                    Kind: Semicolon
                }
                [2] = {
                    Kind: IfStatement
                    [0] = {
                        Kind: ConditionalBlock
                        [0] = {
                            Kind: Null
                            [0] = 'nil'
                        }
                        [1] = {
                            Kind: Block
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: VariableList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                            [1] = {
                                Kind: Semicolon
                            }
                        }
                    }
                    [1] = {
                        Kind: ConditionalBlock
                        [0] = nullptr
                        [1] = {
                            Kind: Block
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: VariableList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                            }
                            [1] = {
                                Kind: Semicolon
                            }
                        }
                    }
                }
                [3] = {
                    Kind: Semicolon
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
                                [0] = '=='
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                            }
                        }
                    }
                }
            }
        }
        [160] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'F'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                    }
                    [1] = {
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
                                        [0] = '=='
                                        [1] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'debug'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'getinfo'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Numeric
                                                            [0] = 1
                                                        }
                                                        [1] = {
                                                            Kind: String
                                                            [0] = "n"
                                                        }
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'name'
                                            }
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = 'F'
                                        }
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: ReturnStatement
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
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
        [161] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
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
                    Kind: BinaryOperation
                    [0] = '~='
                    [1] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'F'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1
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
        [162] = {
            Kind: Semicolon
        }
        [163] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'b'
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
        [164] = {
            Kind: Semicolon
        }
        [165] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
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
                    Kind: BinaryOperation
                    [0] = '=='
                    [1] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'F'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Null
                                    [0] = 'nil'
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
        [166] = {
            Kind: Semicolon
        }
        [167] = {
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
                        [0] = 'and'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '=='
                            [1] = {
                                Kind: Identifier
                                [0] = 'b'
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
        [168] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = '_ENV'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'GLOB1'
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
                            [0] = 'math'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'random'
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
                                [0] = 1
                            }
                        }
                    }
                }
            }
        }
        [169] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'basiccases'
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
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = "nil"
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Null
                                                [0] = 'nil'
                                            }
                                        }
                                    }
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = "false"
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Boolean
                                                [0] = 0
                                            }
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = "true"
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Boolean
                                                [0] = 1
                                            }
                                        }
                                    }
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = "10"
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 10
                                            }
                                        }
                                    }
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = "(0==_ENV.GLOB1)"
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: BinaryOperation
                                                [0] = '=='
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 0
                                                }
                                                [2] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = '_ENV'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'GLOB1'
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
        [170] = {
            Kind: LocalStatement
            [0] = {
                Kind: AttributeList
                [0] = {
                    Kind: Identifier
                    [0] = 'prog'
                }
            }
        }
        [171] = {
            Kind: IfStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: BinaryOperation
                    [0] = '=='
                    [1] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = '_ENV'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'GLOB1'
                        }
                    }
                    [2] = {
                        Kind: Numeric
                        [0] = 0
                    }
                }
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'basiccases'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "F"
                            }
                        }
                    }
                    [1] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'prog'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = [[
    local F <const> = false
    if %s then IX = true end
    return %s
]]
                            }
                        }
                    }
                }
            }
            [1] = {
                Kind: ConditionalBlock
                [0] = nullptr
                [1] = {
                    Kind: Block
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'basiccases'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = "k10"
                            }
                        }
                    }
                    [1] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'prog'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: String
                                [0] = [[
    local k10 <const> = 10
    if %s then IX = true end
    return %s
  ]]
                            }
                        }
                    }
                }
            }
        }
        [172] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = '..'
                        [1] = {
                            Kind: String
                            [0] = 'testing short-circuit optimizations ('
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '..'
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = '_ENV'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'GLOB1'
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = ')'
                            }
                        }
                    }
                }
            }
        }
        [173] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Attribute
                        [0] = {
                            Kind: Identifier
                            [0] = 'binops'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'const'
                        }
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
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = " and "
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: FunctionDefinition
                                                [0] = nullptr
                                                [1] = {
                                                    Kind: FunctionBody
                                                    [0] = {
                                                        Kind: ParameterList
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
                                                        Kind: Block
                                                        [0] = {
                                                            Kind: IfStatement
                                                            [0] = {
                                                                Kind: ConditionalBlock
                                                                [0] = {
                                                                    Kind: UnaryOperation
                                                                    [0] = 'not'
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'a'
                                                                    }
                                                                }
                                                                [1] = {
                                                                    Kind: Block
                                                                    [0] = {
                                                                        Kind: ReturnStatement
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 'a'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ConditionalBlock
                                                                [0] = nullptr
                                                                [1] = {
                                                                    Kind: Block
                                                                    [0] = {
                                                                        Kind: ReturnStatement
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 'b'
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
                                Kind: TableValue
                                [0] = {
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: String
                                                [0] = " or "
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: FunctionDefinition
                                                [0] = nullptr
                                                [1] = {
                                                    Kind: FunctionBody
                                                    [0] = {
                                                        Kind: ParameterList
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
                                                        Kind: Block
                                                        [0] = {
                                                            Kind: IfStatement
                                                            [0] = {
                                                                Kind: ConditionalBlock
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'a'
                                                                }
                                                                [1] = {
                                                                    Kind: Block
                                                                    [0] = {
                                                                        Kind: ReturnStatement
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 'a'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ConditionalBlock
                                                                [0] = nullptr
                                                                [1] = {
                                                                    Kind: Block
                                                                    [0] = {
                                                                        Kind: ReturnStatement
                                                                        [0] = {
                                                                            Kind: ExpressionList
                                                                            [0] = {
                                                                                Kind: Identifier
                                                                                [0] = 'b'
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
            }
        }
        [174] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Attribute
                        [0] = {
                            Kind: Identifier
                            [0] = 'cases'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'const'
                        }
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: TableConstructor
                        [0] = nullptr
                    }
                }
            }
        }
        [175] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'createcases'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 'n'
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
                                        [0] = 'res'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: TableConstructor
                                        [0] = nullptr
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
                                Kind: BinaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'n'
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
                                    Kind: ForStatement
                                    [0] = {
                                        Kind: NameList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = '_'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'v1'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ipairs'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'cases'
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
                                    [2] = {
                                        Kind: Block
                                        [0] = {
                                            Kind: ForStatement
                                            [0] = {
                                                Kind: NameList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = '_'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'v2'
                                                }
                                            }
                                            [1] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'ipairs'
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Index
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'cases'
                                                                }
                                                                [1] = {
                                                                    Kind: BinaryOperation
                                                                    [0] = '-'
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'n'
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
                                            [2] = {
                                                Kind: Block
                                                [0] = {
                                                    Kind: ForStatement
                                                    [0] = {
                                                        Kind: NameList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = '_'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'op'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'ipairs'
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 'binops'
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    [2] = {
                                                        Kind: Block
                                                        [0] = {
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
                                                                                    Kind: BinaryOperation
                                                                                    [0] = '..'
                                                                                    [1] = {
                                                                                        Kind: String
                                                                                        [0] = "("
                                                                                    }
                                                                                    [2] = {
                                                                                        Kind: BinaryOperation
                                                                                        [0] = '..'
                                                                                        [1] = {
                                                                                            Kind: Index
                                                                                            [0] = {
                                                                                                Kind: Identifier
                                                                                                [0] = 'v1'
                                                                                            }
                                                                                            [1] = {
                                                                                                Kind: Numeric
                                                                                                [0] = 1
                                                                                            }
                                                                                        }
                                                                                        [2] = {
                                                                                            Kind: BinaryOperation
                                                                                            [0] = '..'
                                                                                            [1] = {
                                                                                                Kind: Index
                                                                                                [0] = {
                                                                                                    Kind: Identifier
                                                                                                    [0] = 'op'
                                                                                                }
                                                                                                [1] = {
                                                                                                    Kind: Numeric
                                                                                                    [0] = 1
                                                                                                }
                                                                                            }
                                                                                            [2] = {
                                                                                                Kind: BinaryOperation
                                                                                                [0] = '..'
                                                                                                [1] = {
                                                                                                    Kind: Index
                                                                                                    [0] = {
                                                                                                        Kind: Identifier
                                                                                                        [0] = 'v2'
                                                                                                    }
                                                                                                    [1] = {
                                                                                                        Kind: Numeric
                                                                                                        [0] = 1
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
                                                                            [1] = {
                                                                                Kind: TableValue
                                                                                [0] = {
                                                                                    Kind: FunctionCall
                                                                                    [0] = {
                                                                                        Kind: Index
                                                                                        [0] = {
                                                                                            Kind: Identifier
                                                                                            [0] = 'op'
                                                                                        }
                                                                                        [1] = {
                                                                                            Kind: Numeric
                                                                                            [0] = 2
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
                                                                                                    [0] = 'v1'
                                                                                                }
                                                                                                [1] = {
                                                                                                    Kind: Numeric
                                                                                                    [0] = 2
                                                                                                }
                                                                                            }
                                                                                            [1] = {
                                                                                                Kind: Index
                                                                                                [0] = {
                                                                                                    Kind: Identifier
                                                                                                    [0] = 'v2'
                                                                                                }
                                                                                                [1] = {
                                                                                                    Kind: Numeric
                                                                                                    [0] = 2
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
                                                            Kind: AssignmentStatement
                                                            [0] = {
                                                                Kind: VariableList
                                                                [0] = {
                                                                    Kind: Index
                                                                    [0] = {
                                                                        Kind: Identifier
                                                                        [0] = 'res'
                                                                    }
                                                                    [1] = {
                                                                        Kind: BinaryOperation
                                                                        [0] = '+'
                                                                        [1] = {
                                                                            Kind: UnaryOperation
                                                                            [0] = '#'
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'res'
                                                                            }
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
                                                                    Kind: Identifier
                                                                    [0] = 't'
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
                                                                        [0] = 'res'
                                                                    }
                                                                    [1] = {
                                                                        Kind: BinaryOperation
                                                                        [0] = '+'
                                                                        [1] = {
                                                                            Kind: UnaryOperation
                                                                            [0] = '#'
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'res'
                                                                            }
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
                                                                    Kind: TableConstructor
                                                                    [0] = {
                                                                        Kind: FieldList
                                                                        [0] = {
                                                                            Kind: TableValue
                                                                            [0] = {
                                                                                Kind: BinaryOperation
                                                                                [0] = '..'
                                                                                [1] = {
                                                                                    Kind: String
                                                                                    [0] = "not"
                                                                                }
                                                                                [2] = {
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
                                                                            }
                                                                        }
                                                                        [1] = {
                                                                            Kind: TableValue
                                                                            [0] = {
                                                                                Kind: UnaryOperation
                                                                                [0] = 'not'
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
                        [2] = {
                            Kind: ReturnStatement
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'res'
                                }
                            }
                        }
                    }
                }
            }
        }
        [176] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'level'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = 'or'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = 'and'
                            [1] = {
                                Kind: Identifier
                                [0] = '_soft'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 3
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 4
                        }
                    }
                }
            }
        }
        [177] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Index
                    [0] = {
                        Kind: Identifier
                        [0] = 'cases'
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 1
                    }
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Identifier
                    [0] = 'basiccases'
                }
            }
        }
        [178] = {
            Kind: ForStatement
            [0] = {
                Kind: Identifier
                [0] = 'i'
            }
            [1] = {
                Kind: Numeric
                [0] = 2
            }
            [2] = {
                Kind: Identifier
                [0] = 'level'
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
                                [0] = 'cases'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'createcases'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
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
        [179] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "+"
                    }
                }
            }
        }
        [180] = {
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
        [181] = {
            Kind: ForStatement
            [0] = {
                Kind: Identifier
                [0] = 'n'
            }
            [1] = {
                Kind: Numeric
                [0] = 1
            }
            [2] = {
                Kind: Identifier
                [0] = 'level'
            }
            [3] = nullptr
            [4] = {
                Kind: Block
                [0] = {
                    Kind: ForStatement
                    [0] = {
                        Kind: NameList
                        [0] = {
                            Kind: Identifier
                            [0] = '_'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'v'
                        }
                    }
                    [1] = {
                        Kind: ExpressionList
                        [0] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'pairs'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'cases'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'n'
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [2] = {
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
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'v'
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 1
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
                                        [0] = 'p'
                                    }
                                }
                                [1] = {
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
                                                                Kind: Identifier
                                                                [0] = 'prog'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 's'
                                                            }
                                                        }
                                                    }
                                                }
                                                [1] = {
                                                    Kind: String
                                                    [0] = ""
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
                                    Kind: Identifier
                                    [0] = 'IX'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Boolean
                                    [0] = 0
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
                                        [0] = 'and'
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = '=='
                                            [1] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'p'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = nullptr
                                                }
                                            }
                                            [2] = {
                                                Kind: Index
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'v'
                                                }
                                                [1] = {
                                                    Kind: Numeric
                                                    [0] = 2
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = '=='
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'IX'
                                            }
                                            [2] = {
                                                Kind: UnaryOperation
                                                [0] = 'not'
                                                [1] = {
                                                    Kind: UnaryOperation
                                                    [0] = 'not'
                                                    [1] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'v'
                                                        }
                                                        [1] = {
                                                            Kind: Numeric
                                                            [0] = 2
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
                                    [0] = '+'
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
                        [5] = {
                            Kind: IfStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = '=='
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '%'
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'i'
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 60000
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 0
                                    }
                                }
                                [1] = {
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
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: String
                                                    [0] = '+'
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
        [182] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'IX'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Null
                    [0] = 'nil'
                }
            }
        }
        [183] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = '_G'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'GLOB1'
                    }
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Null
                    [0] = 'nil'
                }
            }
        }
        [184] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "for x do"
                    }
                    [1] = {
                        Kind: String
                        [0] = "expected"
                    }
                }
            }
        }
        [185] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'checkload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "x:call"
                    }
                    [1] = {
                        Kind: String
                        [0] = "expected"
                    }
                }
            }
        }
        [186] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = 'OK'
                }
            }
        }
    }
}