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
                                [0] = "=="
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
                                [0] = "//"
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
                                [0] = "%"
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
                            [0] = "^"
                            [1] = {
                                Kind: Numeric
                                [0] = 2
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "^"
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
                            [0] = "^"
                            [1] = {
                                Kind: Numeric
                                [0] = 2
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "^"
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
        [15] = {
            Kind: Semicolon
        }
        [16] = {
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
                            [0] = "*"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "^"
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
                            [0] = "*"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "^"
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
        [17] = {
            Kind: Semicolon
        }
        [18] = {
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
                                Kind: BinaryOperation
                                [0] = "^"
                                [1] = {
                                    Kind: Numeric
                                    [0] = 2
                                }
                                [2] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "/"
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
                            [0] = "=="
                            [1] = {
                                Kind: UnaryOperation
                                [0] = "-"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "^"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: UnaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "-"
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
                                [0] = "-"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
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
        [19] = {
            Kind: Semicolon
        }
        [20] = {
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
                                Kind: UnaryOperation
                                [0] = "not"
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
                            [0] = "not"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "or"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = ">"
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
                                    [0] = "<"
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
        [21] = {
            Kind: Semicolon
        }
        [22] = {
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
                                Kind: BinaryOperation
                                [0] = "-"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
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
                            [0] = "-"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
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
        [23] = {
            Kind: Semicolon
        }
        [24] = {
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
                                [0] = "=="
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "^"
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
                                    [0] = "-"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 4
                                    }
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "^"
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = "-"
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
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "-"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "-"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "*"
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
        [25] = {
            Kind: Semicolon
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "%"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
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
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "*"
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
                                    [0] = "/"
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
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = ".."
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
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
                                    [0] = "*"
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
        [28] = {
            Kind: Semicolon
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
                        [0] = "and"
                        [1] = {
                            Kind: UnaryOperation
                            [0] = "not"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = ">"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
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
                                    [0] = "*"
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
                            [0] = ">"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = ".."
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
        [30] = {
            Kind: Semicolon
        }
        [31] = {
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
                            [0] = "|"
                            [1] = {
                                Kind: Numeric
                                [0] = 240
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "~"
                                [1] = {
                                    Kind: Numeric
                                    [0] = 204
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "&"
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
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "|"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "~"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "&"
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
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "&"
                            [1] = {
                                Kind: Numeric
                                [0] = 240
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "+"
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
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "//"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "//"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "^"
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
                                    [0] = "^"
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
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "+"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "//"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "//"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "*"
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
                                            [0] = "^"
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: BinaryOperation
                                                [0] = "^"
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
                                [0] = "/"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "%"
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
                            [0] = "+"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "-"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "//"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "//"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "*"
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
                                            [0] = "^"
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: BinaryOperation
                                                [0] = "^"
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
                                [0] = "/"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "%"
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
                        Kind: UnaryOperation
                        [0] = "not"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "or"
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
                        Kind: BinaryOperation
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "or"
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
        [38] = {
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
                    [0] = "or"
                    [1] = {
                        Kind: BinaryOperation
                        [0] = "or"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "or"
                            [1] = {
                                Kind: Boolean
                                [0] = 0
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 0
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
        [39] = {
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
                    [0] = "+"
                    [1] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [2] = {
                        Kind: Numeric
                        [0] = 1
                    }
                }
            }
        }
        [40] = {
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
                    [0] = "//"
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
        [41] = {
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
                    [0] = "+"
                    [1] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [2] = {
                        Kind: String
                        [0] = "1e33333"
                    }
                }
            }
        }
        [42] = {
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
                    [0] = 142.3
                }
            }
        }
        [43] = {
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
                    [0] = inf
                }
            }
        }
        [44] = {
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
                    Kind: String
                    [0] = "a"
                }
            }
        }
        [45] = {
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
                            [0] = "or"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "or"
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
        [46] = {
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
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "or"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
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
        [47] = {
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
        [48] = {
            Kind: Semicolon
        }
        [49] = {
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
                                [0] = "-"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "or"
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
                                [0] = "-"
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
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
                                    [0] = "or"
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 1.25
                                        }
                                    }
                                    [2] = {
                                        Kind: UnaryOperation
                                        [0] = "-"
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 4
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 0.75
                            }
                        }
                    }
                }
            }
        }
        [50] = {
            Kind: Semicolon
        }
        [51] = {
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "or"
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
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "or"
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
        [52] = {
            Kind: Semicolon
        }
        [53] = {
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
        [54] = {
            Kind: Semicolon
        }
        [55] = {
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
                    [0] = "and"
                    [1] = {
                        Kind: BinaryOperation
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "or"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "<"
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
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "<"
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
        [56] = {
            Kind: Semicolon
        }
        [57] = {
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
        [58] = {
            Kind: Semicolon
        }
        [59] = {
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
                        [0] = "or"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = ">"
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
                            [0] = "=="
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
        [62] = {
            Kind: Semicolon
        }
        [63] = {
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
        [64] = {
            Kind: Semicolon
        }
        [65] = {
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
                        [0] = "or"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = ">"
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
                            [0] = "=="
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
        [66] = {
            Kind: Semicolon
        }
        [67] = {
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
                                            [0] = "1234567890"
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
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
        [68] = {
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
                                            [0] = "-"
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
                                            [0] = "-"
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
                                            [0] = "-"
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
                                                                                [0] = "return function (x,y)\n                return x %s y\n              end"
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
                                                        [0] = "=="
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
                                                        [0] = "=="
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
                                                        [0] = "=="
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
        [69] = {
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
        [70] = {
            Kind: Semicolon
        }
        [71] = {
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
        [72] = {
            Kind: Semicolon
        }
        [73] = {
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
        [74] = {
            Kind: Semicolon
        }
        [75] = {
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
        [76] = {
            Kind: Semicolon
        }
        [77] = {
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
        [78] = {
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
                                        [0] = "+"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
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
                                    [0] = ".."
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
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
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
                                                [0] = ".."
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
                                                [0] = "=="
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
                                [0] = "~"
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
                                [0] = "|"
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
                                [0] = "+"
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
                                [0] = "<<"
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
        [79] = {
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
                                    [0] = "~="
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
                                        [0] = "number"
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
                                                [0] = "jojo"
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
                                    [0] = ">"
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
                                                            [0] = "-"
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
        [80] = {
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
        [81] = {
            Kind: Semicolon
        }
        [82] = {
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
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
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
                                        [0] = "=="
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
                                    [0] = "=="
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
                                [0] = "=="
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
                            [0] = "=="
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
        [83] = {
            Kind: Semicolon
        }
        [84] = {
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
        [85] = {
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
                                        [0] = "alo"
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
                                        [0] = "xixi"
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
        [86] = {
            Kind: Semicolon
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "=="
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
                                    [0] = "alo"
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "=="
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
                                    [0] = "xixi"
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
        [88] = {
            Kind: Semicolon
        }
        [89] = {
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
                                [0] = ".."
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
                                            [0] = "alo"
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "xixi"
                                }
                            }
                        }
                    }
                }
            }
        }
        [90] = {
            Kind: Semicolon
        }
        [91] = {
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
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = "aloxixi"
                        }
                    }
                }
            }
        }
        [92] = {
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
        [93] = {
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
                                [0] = "jojo"
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
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
                                [0] = "table"
                            }
                        }
                    }
                }
            }
        }
        [94] = {
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
                                            [0] = "<"
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
                                                        [0] = "a"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "<"
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
                                                        [0] = "b"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "<"
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
                                                        [0] = "c"
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
        [95] = {
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
                                        [0] = "a"
                                    }
                                }
                                [2] = {
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
                                                    Kind: Numeric
                                                    [0] = 12
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = "b"
                                    }
                                }
                            }
                            [2] = {
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
                                                Kind: Numeric
                                                [0] = 26
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "c"
                                }
                            }
                        }
                        [2] = {
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
        [96] = {
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
        [99] = {
            Kind: Semicolon
        }
        [100] = {
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
        [101] = {
            Kind: Semicolon
        }
        [102] = {
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
        [103] = {
            Kind: Semicolon
        }
        [104] = {
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
        [105] = {
            Kind: WhileStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: UnaryOperation
                    [0] = "not"
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
                                    [0] = "-"
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
                                                [0] = "+"
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
        [106] = {
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
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "/"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "*"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'n'
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
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
                            [0] = "=="
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
        [107] = {
            Kind: Semicolon
        }
        [108] = {
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
                                [0] = "not"
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
                            [0] = "not"
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 't'
                                }
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
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
        [109] = {
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
                                [0] = ">="
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
                                            [0] = "=="
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
                                            [0] = "=="
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
                                            [0] = "=="
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
                                                        [0] = "+"
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
        [110] = {
            Kind: Semicolon
        }
        [111] = {
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
        [112] = {
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
                                            [0] = "<"
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
                                                        [0] = "a"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "<"
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
                                                        [0] = "b"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "<"
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
                                                        [0] = "c"
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
        [113] = {
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
                                        [0] = "a"
                                    }
                                }
                                [2] = {
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
                                                    Kind: Numeric
                                                    [0] = 12
                                                }
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = "b"
                                    }
                                }
                            }
                            [2] = {
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
                                                Kind: Numeric
                                                [0] = 26
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "c"
                                }
                            }
                        }
                        [2] = {
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
        [114] = {
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
        [115] = {
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
                                [0] = "or"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "*"
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
                                [0] = "or"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
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
        [116] = {
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
                            [0] = "=="
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
        [117] = {
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
                                [0] = "or"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
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
                                [0] = "+"
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
        [118] = {
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
                            [0] = "=="
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
        [119] = {
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
        [120] = {
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
        [121] = {
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
        [122] = {
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
                                                [0] = ">"
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
                                                            [0] = "-"
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
        [123] = {
            Kind: Semicolon
        }
        [124] = {
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
                                                [0] = ">"
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
                                                            [0] = "-"
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
        [125] = {
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
        [126] = {
            Kind: Semicolon
        }
        [127] = {
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
        [128] = {
            Kind: Semicolon
        }
        [129] = {
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
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
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
                                        [0] = "=="
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
                                    [0] = "=="
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
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
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
                                        [0] = "=="
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
                                    [0] = "=="
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
        [130] = {
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
                        [0] = "and"
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
        [131] = {
            Kind: Semicolon
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "=="
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
                            [0] = "=="
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
        [134] = {
            Kind: Semicolon
        }
        [135] = {
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
        [136] = {
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
                                [0] = "or"
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
        [137] = {
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
        [138] = {
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
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 1
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
                                Kind: Null
                                [0] = 'nil'
                            }
                        }
                    }
                }
            }
        }
        [139] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = "+"
                }
            }
        }
        [140] = {
            Kind: Semicolon
        }
        [141] = {
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
                                [0] = "local x <XXX> = 10"
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
                                [0] = "local xxx <const> = 20; xxx = 10"
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
                                [0] = "\n    local xx; \\n\n    local xxx <const> = 20;\n    local yyy;\n    local function foo ()\n      local abc = xx + yyy + xxx;\n      return function () return function () xxx = yyy end end\n    end\n  "
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
                                [0] = "\n      \-17\-65\-67  A\n    local x <close> = nil\n    x = io.open()\n  "
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
        [142] = {
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
                    [0] = "\nreturn function ( a , b , c , d , e )\n  local x = a >= b or c or ( d and e ) or nil\n  return x\nend , { a = 1 , b = 2 >= 1 , } or { 1 };\n"
                }
            }
        }
        [143] = {
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
                    Kind: String
                    [0] = "\"
                }
            }
        }
        [144] = {
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
        [145] = {
            Kind: Semicolon
        }
        [146] = {
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
        [147] = {
            Kind: Semicolon
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "=="
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
        [149] = {
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
                                [0] = "not"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "or"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "and"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "or"
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = "or"
                                                [1] = {
                                                    Kind: BinaryOperation
                                                    [0] = ">="
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
        [150] = {
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
                                    [0] = "or"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "or"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "or"
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = ">="
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
                                            [0] = "and"
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
        [151] = {
            Kind: Semicolon
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
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
                                [0] = "=="
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
                            [0] = "=="
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
        [153] = {
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: String
                                                [0] = "a"
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "a"
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "=="
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
                                                [0] = "a"
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
                            [0] = "=="
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
                                            [0] = "a"
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
        [154] = {
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
                        [0] = "~="
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
                                        [0] = "a"
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
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
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [2] = {
                                                Kind: String
                                                [0] = "a"
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "a"
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "=="
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
                                                [0] = "a"
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
                            [0] = "=="
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
                                            [0] = "a"
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
        [156] = {
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
                                                [0] = "x"
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "x"
                                }
                            }
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "=="
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
                                                [0] = "x"
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
                            [0] = "=="
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
                                            [0] = "x"
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
        [157] = {
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
                                                [0] = "x"
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
                                [0] = "=="
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
                                                [0] = "x"
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
                            [0] = "=="
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
                                            [0] = "x"
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
                            [1] = {
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
                                [0] = "=="
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
                            [0] = "=="
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
        [159] = {
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
                                    Kind: Numeric
                                    [0] = 1
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "<"
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
                                [0] = "<"
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
                            [0] = "=="
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "<"
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
                                Kind: Boolean
                                [0] = 1
                            }
                        }
                    }
                }
            }
        }
        [160] = {
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
                    [0] = "and"
                    [1] = {
                        Kind: BinaryOperation
                        [0] = "<"
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
                        [0] = "not"
                        [1] = {
                            Kind: Numeric
                            [0] = 3
                        }
                    }
                }
            }
        }
        [161] = {
            Kind: Semicolon
        }
        [162] = {
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
        [163] = {
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
                    [0] = "or"
                    [1] = {
                        Kind: BinaryOperation
                        [0] = "<"
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
                        [0] = "and"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = ">"
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
                            [0] = "a"
                        }
                    }
                }
            }
        }
        [164] = {
            Kind: Semicolon
        }
        [165] = {
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
                            [0] = 'x'
                        }
                        [2] = {
                            Kind: String
                            [0] = "a"
                        }
                    }
                }
            }
        }
        [166] = {
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
                                [0] = "=="
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
        [167] = {
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
                                        [0] = "=="
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
                                            [0] = "F"
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
        [168] = {
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
                    [0] = "~="
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
        [169] = {
            Kind: Semicolon
        }
        [170] = {
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
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
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
                                Kind: Null
                                [0] = 'nil'
                            }
                        }
                    }
                }
            }
        }
        [171] = {
            Kind: Semicolon
        }
        [172] = {
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
                    [0] = "=="
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
        [173] = {
            Kind: Semicolon
        }
        [174] = {
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
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Boolean
                                [0] = 1
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
                                Kind: Null
                                [0] = 'nil'
                            }
                        }
                    }
                }
            }
        }
        [175] = {
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
        [176] = {
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
                                                [0] = "=="
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
        [177] = {
            Kind: LocalStatement
            [0] = {
                Kind: AttributeList
                [0] = {
                    Kind: Identifier
                    [0] = 'prog'
                }
            }
        }
        [178] = {
            Kind: IfStatement
            [0] = {
                Kind: ConditionalBlock
                [0] = {
                    Kind: BinaryOperation
                    [0] = "=="
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
                                [0] = "\n    local F <const> = false\n    if %s then IX = true end\n    return %s\n"
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
                                [0] = "\n    local k10 <const> = 10\n    if %s then IX = true end\n    return %s\n  "
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
                        Kind: BinaryOperation
                        [0] = ".."
                        [1] = {
                            Kind: String
                            [0] = "testing short-circuit optimizations ("
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = ".."
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
                                [0] = ")"
                            }
                        }
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
                                                                    [0] = "not"
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
        [181] = {
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
        [182] = {
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
                                [0] = "-"
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
                                                                    [0] = "-"
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
                                                                                    [0] = ".."
                                                                                    [1] = {
                                                                                        Kind: String
                                                                                        [0] = "("
                                                                                    }
                                                                                    [2] = {
                                                                                        Kind: BinaryOperation
                                                                                        [0] = ".."
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
                                                                                            [0] = ".."
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
                                                                                                [0] = ".."
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
                                                                        [0] = "+"
                                                                        [1] = {
                                                                            Kind: UnaryOperation
                                                                            [0] = "#"
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
                                                                        [0] = "+"
                                                                        [1] = {
                                                                            Kind: UnaryOperation
                                                                            [0] = "#"
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
                                                                                [0] = ".."
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
                                                                                [0] = "not"
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
        [183] = {
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
                        [0] = "or"
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "and"
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
        [184] = {
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
        [185] = {
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
        [186] = {
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
        [187] = {
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
        [188] = {
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
                                        [0] = "and"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
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
                                            [0] = "=="
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'IX'
                                            }
                                            [2] = {
                                                Kind: UnaryOperation
                                                [0] = "not"
                                                [1] = {
                                                    Kind: UnaryOperation
                                                    [0] = "not"
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
                        [5] = {
                            Kind: IfStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "%"
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
                                                    [0] = "+"
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
        [189] = {
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
        [190] = {
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
        [191] = {
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
        [192] = {
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
        [193] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = "OK"
                }
            }
        }
    }
}