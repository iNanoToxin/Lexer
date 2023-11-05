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
        [46] = {
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
        [47] = {
            Kind: Semicolon
        }
        [48] = {
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
        [49] = {
            Kind: Semicolon
        }
        [50] = {
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
        [51] = {
            Kind: Semicolon
        }
        [52] = {
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
        [53] = {
            Kind: Semicolon
        }
        [54] = {
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
        [55] = {
            Kind: Semicolon
        }
        [56] = {
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
        [57] = {
            Kind: Semicolon
        }
        [58] = {
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
        [59] = {
            Kind: Semicolon
        }
        [60] = {
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
        [61] = {
            Kind: Semicolon
        }
        [62] = {
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
        [63] = {
            Kind: Semicolon
        }
        [64] = {
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
        [65] = {
            Kind: Semicolon
        }
        [66] = {
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
                                            [0] = '1234567890'
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
        [67] = {
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
        [68] = {
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
        [69] = {
            Kind: Semicolon
        }
        [70] = {
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
        [71] = {
            Kind: Semicolon
        }
        [72] = {
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
        [73] = {
            Kind: Semicolon
        }
        [74] = {
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
        [75] = {
            Kind: Semicolon
        }
        [76] = {
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
        [77] = {
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
        [78] = {
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
        [82] = {
            Kind: Semicolon
        }
        [83] = {
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
        [84] = {
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
        [85] = {
            Kind: Semicolon
        }
        [86] = {
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
                                    [0] = 'alo'
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
                                    [0] = 'xixi'
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
        [87] = {
            Kind: Semicolon
        }
        [88] = {
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
        [89] = {
            Kind: Semicolon
        }
        [90] = {
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
                            [0] = 'aloxixi'
                        }
                    }
                }
            }
        }
        [91] = {
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
        [92] = {
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
                                [0] = 'jojo'
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
                                [0] = 'table'
                            }
                        }
                    }
                }
            }
        }
        [93] = {
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
        [94] = {
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
                                        [0] = 'a'
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
                                        [0] = 'b'
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
                                    [0] = 'c'
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
        [95] = {
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
        [96] = {
            Kind: Semicolon
        }
        [97] = {
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
        [98] = {
            Kind: Semicolon
        }
        [99] = {
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
        [100] = {
            Kind: Semicolon
        }
        [101] = {
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
        [102] = {
            Kind: Semicolon
        }
        [103] = {
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
        [104] = {
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
        [106] = {
            Kind: Semicolon
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
        [108] = {
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
        [109] = {
            Kind: Semicolon
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
        [111] = {
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
                                        [0] = 'a'
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
                                        [0] = 'b'
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
                                    [0] = 'c'
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
        [113] = {
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
        [116] = {
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
        [117] = {
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
        [118] = {
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
        [119] = {
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
        [120] = {
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
        [121] = {
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
        [122] = {
            Kind: Semicolon
        }
        [123] = {
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
        [124] = {
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
        [125] = {
            Kind: Semicolon
        }
        [126] = {
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
        [127] = {
            Kind: Semicolon
        }
        [128] = {
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
        [129] = {
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
        [130] = {
            Kind: Semicolon
        }
        [131] = {
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
        [132] = {
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
        [133] = {
            Kind: Semicolon
        }
        [134] = {
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
        [135] = {
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
        [136] = {
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
        [137] = {
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
        [138] = {
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
        [139] = {
            Kind: Semicolon
        }
        [140] = {
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
        [141] = {
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
        [143] = {
            Kind: Semicolon
        }
        [144] = {
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
        [145] = {
            Kind: Semicolon
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
        [147] = {
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
        [148] = {
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
        [149] = {
            Kind: Semicolon
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
        [158] = {
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
        [159] = {
            Kind: Semicolon
        }
        [160] = {
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
        [161] = {
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
                            [0] = 'a'
                        }
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
                        [0] = "=="
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
        [164] = {
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
        [165] = {
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
        [166] = {
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
        [167] = {
            Kind: Semicolon
        }
        [168] = {
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
        [169] = {
            Kind: Semicolon
        }
        [170] = {
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
        [171] = {
            Kind: Semicolon
        }
        [172] = {
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
        [173] = {
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
        [174] = {
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
        [175] = {
            Kind: LocalStatement
            [0] = {
                Kind: AttributeList
                [0] = {
                    Kind: Identifier
                    [0] = 'prog'
                }
            }
        }
        [176] = {
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
        [177] = {
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
                            [0] = 'testing short-circuit optimizations ('
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
                                [0] = ')'
                            }
                        }
                    }
                }
            }
        }
        [178] = {
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
        [179] = {
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
        [180] = {
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
        [181] = {
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
        [182] = {
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
        [183] = {
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
        [184] = {
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
        [185] = {
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
        [186] = {
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
        [187] = {
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
        [188] = {
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
        [189] = {
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
        [190] = {
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
        [191] = {
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