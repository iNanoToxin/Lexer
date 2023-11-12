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
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "testing functions and calls"
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
                                [0] = 'type'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "<"
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
                        [2] = {
                            Kind: String
                            [0] = "boolean"
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
                        [0] = "and"
                        [1] = {
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
                                            Kind: Boolean
                                            [0] = 1
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "boolean"
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
                                            Kind: Boolean
                                            [0] = 0
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "boolean"
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
                                                        Kind: Null
                                                        [0] = 'nil'
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "nil"
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
                                                        Kind: UnaryOperation
                                                        [0] = "-"
                                                        [1] = {
                                                            Kind: Numeric
                                                            [0] = 3
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "number"
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
                                            [0] = 'type'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: String
                                                [0] = "x"
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = "string"
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
                                        [0] = 'type'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: TableConstructor
                                            [0] = nullptr
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "table"
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
                                    [0] = 'type'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'type'
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "function"
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
                                [0] = 'type'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'assert'
                                    }
                                }
                            }
                        }
                        [2] = {
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
                                        [0] = 'print'
                                    }
                                }
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
                            Kind: ReturnStatement
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Method
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'x'
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
                                [0] = 'type'
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
                        [2] = {
                            Kind: String
                            [0] = "function"
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
                        Kind: UnaryOperation
                        [0] = "not"
                        [1] = {
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
                                        [0] = 'type'
                                    }
                                }
                            }
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
                    [0] = 'fact'
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
        [10] = {
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
                                [0] = 'res'
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
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'fact'
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
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'n'
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
                                                        [0] = 'res'
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
                                                        Kind: BinaryOperation
                                                        [0] = "*"
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'n'
                                                        }
                                                        [2] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'fact'
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
                                        Kind: Identifier
                                        [0] = 'fact'
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
                                [2] = {
                                    Kind: Numeric
                                    [0] = 120
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
                            [0] = 'fact'
                        }
                        [2] = {
                            Kind: Boolean
                            [0] = 0
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
                    [0] = 'fact'
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
        [13] = {
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
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableNameValue
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'i'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 10
                                }
                            }
                        }
                    }
                }
            }
        }
        [14] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'self'
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
        }
        [15] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Method
                    [0] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'x'
                    }
                }
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
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [2] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
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
        [16] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
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
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'self'
                                }
                            }
                        }
                    }
                }
            }
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
                        [0] = "=="
                        [1] = {
                            Kind: BinaryOperation
                            [0] = "+"
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Method
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'x'
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
                            [2] = {
                                Kind: Numeric
                                [0] = 10
                            }
                        }
                        [2] = {
                            Kind: FunctionCall
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
        }
        [18] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 't'
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
                            Kind: TableNameValue
                            [0] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [1] = {
                                Kind: UnaryOperation
                                [0] = "-"
                                [1] = {
                                    Kind: Numeric
                                    [0] = 100
                                }
                            }
                        }
                    }
                }
            }
        }
        [19] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Index
                        [0] = {
                            Kind: Identifier
                            [0] = 'a'
                        }
                        [1] = {
                            Kind: String
                            [0] = "t"
                        }
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'x'
                    }
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
                                [0] = 'self'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 'b'
                            }
                        }
                        [1] = {
                            Kind: Block
                            [0] = {
                                Kind: ReturnStatement
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "+"
                                            [1] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'a'
                                            }
                                        }
                                        [2] = {
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Method
                                [0] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 't'
                                    }
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
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
                                        [0] = 3
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: UnaryOperation
                            [0] = "-"
                            [1] = {
                                Kind: Numeric
                                [0] = 95
                            }
                        }
                    }
                }
            }
        }
        [21] = {
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
                                            [0] = 'x'
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionDefinition
                    [0] = {
                        Kind: FunctionName
                        [0] = {
                            Kind: Method
                            [0] = {
                                Kind: Identifier
                                [0] = 'a'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'add'
                            }
                        }
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
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                    }
                                    [1] = {
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
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 20
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
                                        Kind: Identifier
                                        [0] = 'self'
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
                                    [0] = "=="
                                    [1] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Method
                                                [0] = {
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Method
                                                        [0] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Method
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'a'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'add'
                                                                }
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
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'add'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: ArgumentList
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: Numeric
                                                                [0] = 20
                                                            }
                                                        }
                                                    }
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'add'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 30
                                                    }
                                                }
                                            }
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 60
                                    }
                                }
                                [2] = {
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
                                            [0] = 'y'
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 20
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [22] = {
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
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableNameValue
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'b'
                                }
                                [1] = {
                                    Kind: TableConstructor
                                    [0] = {
                                        Kind: FieldList
                                        [0] = {
                                            Kind: TableNameValue
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'c'
                                            }
                                            [1] = {
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
            }
        }
        [23] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Member
                        [0] = {
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
                        [1] = {
                            Kind: Identifier
                            [0] = 'c'
                        }
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'f1'
                    }
                }
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
                        Kind: ReturnStatement
                        [0] = {
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
                }
            }
        }
        [24] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Method
                    [0] = {
                        Kind: Member
                        [0] = {
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
                        [1] = {
                            Kind: Identifier
                            [0] = 'c'
                        }
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'f2'
                    }
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
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
                    Kind: Block
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'self'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'y'
                            }
                        }
                    }
                }
            }
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Member
                                    [0] = {
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
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'c'
                                    }
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'f1'
                                }
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
                            [0] = 5
                        }
                    }
                }
            }
        }
        [26] = {
            Kind: FunctionCall
            [0] = {
                Kind: Method
                [0] = {
                    Kind: Member
                    [0] = {
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
                    [1] = {
                        Kind: Identifier
                        [0] = 'c'
                    }
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'f2'
                }
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "k"
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 12
                    }
                }
            }
        }
        [27] = {
            Kind: Semicolon
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
                            Kind: Member
                            [0] = {
                                Kind: Member
                                [0] = {
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
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'c'
                                }
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'k'
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
        [29] = {
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
        [30] = {
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
                    Kind: Null
                    [0] = 'nil'
                }
            }
        }
        [31] = {
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
                    Kind: Block
                    [0] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'd'
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
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'b'
                                        }
                                    }
                                    [2] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'c'
                                        }
                                    }
                                    [3] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'd'
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [32] = {
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
                                            [0] = 't'
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
                                        [0] = 2
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
                                    Kind: Null
                                    [0] = 'nil'
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
                                    [0] = 4
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
        [34] = {
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
                        Kind: Numeric
                        [0] = 3
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 4
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
                                            [0] = 't'
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
                                        [0] = 2
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
                                    [0] = 3
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
                                    [0] = 4
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
        [36] = {
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
                    Kind: Null
                    [0] = 'nil'
                }
            }
        }
        [37] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'fat'
                }
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
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = "<="
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
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
                                            Kind: BinaryOperation
                                            [0] = "*"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'x'
                                            }
                                            [2] = {
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
                                                                Kind: BinaryOperation
                                                                [0] = ".."
                                                                [1] = {
                                                                    Kind: String
                                                                    [0] = "return fat("
                                                                }
                                                                [2] = {
                                                                    Kind: BinaryOperation
                                                                    [0] = ".."
                                                                    [1] = {
                                                                        Kind: BinaryOperation
                                                                        [0] = "-"
                                                                        [1] = {
                                                                            Kind: Identifier
                                                                            [0] = 'x'
                                                                        }
                                                                        [2] = {
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
                                                            [1] = {
                                                                Kind: String
                                                                [0] = ""
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
                            }
                        }
                    }
                }
            }
        }
        [38] = {
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
                                    Kind: String
                                    [0] = "load 'assert(fat(6)==720)' () "
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
        [39] = {
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
                                Kind: String
                                [0] = "return fat(5), 3"
                            }
                        }
                    }
                }
            }
        }
        [40] = {
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
                            Kind: Identifier
                            [0] = 'a'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = nullptr
                        }
                    }
                }
            }
        }
        [41] = {
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
                                [0] = 120
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
                                [0] = 3
                            }
                        }
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
                    [0] = 'fat'
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
        [43] = {
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
        [44] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'err_on_n'
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
                            Kind: IfStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'n'
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
                                            [0] = 'error'
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
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'exit'
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
                                    [3] = {
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
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'err_on_n'
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
                                    [1] = {
                                        Kind: Semicolon
                                    }
                                    [2] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'exit'
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
                                    [3] = {
                                        Kind: Semicolon
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [45] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'dummy'
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
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = ">"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'n'
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
                                                                    Kind: Identifier
                                                                    [0] = 'pcall'
                                                                }
                                                                [1] = {
                                                                    Kind: ArgumentList
                                                                    [0] = {
                                                                        Kind: ExpressionList
                                                                        [0] = {
                                                                            Kind: Identifier
                                                                            [0] = 'err_on_n'
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
                                                }
                                            }
                                            [1] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'dummy'
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
                            }
                        }
                    }
                }
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'dummy'
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
        [46] = {
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
                        [0] = 'deep'
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
        [47] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'deep'
                }
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
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = ">"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'n'
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
                                        [0] = 'deep'
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
                }
            }
        }
        [48] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'deep'
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
        [49] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'deep'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Numeric
                        [0] = 180
                    }
                }
            }
        }
        [50] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'print'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: String
                    [0] = "testing tail calls"
                }
            }
        }
        [51] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'deep'
                }
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
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = ">"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'n'
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
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'deep'
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
                                            [0] = 101
                                        }
                                    }
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
                                [0] = 'deep'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 30000
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 101
                        }
                    }
                }
            }
        }
        [53] = {
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
                    [0] = nullptr
                }
            }
        }
        [54] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Method
                    [0] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'deep'
                    }
                }
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
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = ">"
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'n'
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
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Method
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'deep'
                                                }
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
                                            [0] = 101
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
                                Kind: Method
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'deep'
                                }
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 30000
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 101
                        }
                    }
                }
            }
        }
        [56] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'foo'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
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
                                                        Kind: TableValue
                                                        [0] = {
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
                                    Kind: Semicolon
                                }
                                [2] = {
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'x'
                                        }
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'a'
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
                                                [0] = 'a'
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
                [1] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'foo1'
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
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'foo'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 10
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
                                                    }
                                                    [2] = {
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
                                        }
                                    }
                                }
                            }
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
                                    [0] = 'foo1'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
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
                                            [0] = 10
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
                                            Kind: UnaryOperation
                                            [0] = "-"
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
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
                [4] = {
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
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'setmetatable'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: TableConstructor
                                            [0] = nullptr
                                        }
                                        [1] = {
                                            Kind: TableConstructor
                                            [0] = {
                                                Kind: FieldList
                                                [0] = {
                                                    Kind: TableNameValue
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = '__call'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'foo'
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
                [5] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'foo2'
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
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 't'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Numeric
                                                        [0] = 10
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'x'
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
                                [0] = 'foo2'
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
                                            Kind: Identifier
                                            [0] = 't'
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
                                            [0] = 10
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
                                        [0] = 100
                                    }
                                }
                            }
                        }
                    }
                }
                [8] = {
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
                                Kind: FunctionDefinition
                                [0] = nullptr
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
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'foo'
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
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
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
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'a'
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
                [10] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AttributeList
                        [0] = {
                            Kind: Identifier
                            [0] = 'X'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'Y'
                        }
                        [2] = {
                            Kind: Identifier
                            [0] = 'A'
                        }
                    }
                }
                [11] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'foo'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'y'
                                }
                                [2] = {
                                    Kind: Varargs
                                    [0] = '...'
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
                                            [0] = 'X'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'x'
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
                                            [0] = 'Y'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'y'
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
                                            [0] = 'A'
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
                                                        Kind: Varargs
                                                        [0] = '...'
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
                [12] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'foo1'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = {
                                Kind: ParameterList
                                [0] = {
                                    Kind: Varargs
                                    [0] = '...'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'foo'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Varargs
                                                        [0] = '...'
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
                [13] = {
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
                                    [0] = 'foo1'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = nullptr
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
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'X'
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
                                            Kind: Identifier
                                            [0] = 'Y'
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
                                        Kind: UnaryOperation
                                        [0] = "#"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'A'
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
                [15] = {
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
                                [0] = 'foo1'
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
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'X'
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
                                            Kind: Identifier
                                            [0] = 'Y'
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
                                        Kind: UnaryOperation
                                        [0] = "#"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'A'
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
                [17] = {
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
                                [0] = 'foo1'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 20
                                    }
                                }
                            }
                        }
                    }
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
                                    [0] = "and"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "=="
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'X'
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
                                            Kind: Identifier
                                            [0] = 'Y'
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
                                        Kind: UnaryOperation
                                        [0] = "#"
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'A'
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
                [19] = {
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
                                [0] = 'foo1'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 20
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 30
                                    }
                                }
                            }
                        }
                    }
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
                                        Kind: BinaryOperation
                                        [0] = "and"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'X'
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
                                                Kind: Identifier
                                                [0] = 'Y'
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
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'A'
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
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'A'
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 30
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [57] = {
            Kind: DoStatement
            [0] = {
                Kind: Block
                [0] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'loop'
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
                                                    [0] = 'pcall'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'loop'
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
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 'err'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'msg'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'xpcall'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'loop'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'loop'
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
                                    Kind: UnaryOperation
                                    [0] = "not"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'err'
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
                                                [0] = 'msg'
                                            }
                                            [1] = {
                                                Kind: String
                                                [0] = "error"
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
        [58] = {
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
                                [0] = 'n'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Numeric
                                [0] = 10000
                            }
                        }
                    }
                }
                [1] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: FunctionDefinition
                        [0] = {
                            Kind: Identifier
                            [0] = 'foo'
                        }
                        [1] = {
                            Kind: FunctionBody
                            [0] = nullptr
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "=="
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'n'
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
                                                        Kind: Numeric
                                                        [0] = 1023
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
                                                        Kind: Identifier
                                                        [0] = 'n'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
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
                                                        Kind: FunctionCall
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'foo'
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
                        }
                    }
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
                        Kind: Numeric
                        [0] = 100
                    }
                    [3] = nullptr
                    [4] = {
                        Kind: Block
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: VariableList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'foo'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'setmetatable'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: TableConstructor
                                                [0] = nullptr
                                            }
                                            [1] = {
                                                Kind: TableConstructor
                                                [0] = {
                                                    Kind: FieldList
                                                    [0] = {
                                                        Kind: TableNameValue
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = '__call'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'foo'
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
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'coroutine'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'wrap'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: FunctionDefinition
                                                    [0] = nullptr
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
                                                                        Kind: FunctionCall
                                                                        [0] = {
                                                                            Kind: Identifier
                                                                            [0] = 'foo'
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
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = nullptr
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1023
                                }
                            }
                        }
                    }
                }
            }
        }
        [59] = {
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
        [60] = {
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
                                [0] = 'N'
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
                }
                [1] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 'u'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'table'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'pack'
                                }
                            }
                        }
                    }
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
                        [0] = 'N'
                    }
                    [3] = nullptr
                    [4] = {
                        Kind: Block
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: VariableList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'u'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'setmetatable'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: TableConstructor
                                                [0] = {
                                                    Kind: FieldList
                                                    [0] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'i'
                                                        }
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: TableConstructor
                                                [0] = {
                                                    Kind: FieldList
                                                    [0] = {
                                                        Kind: TableNameValue
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = '__call'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'u'
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
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 'Res'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'u'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: String
                                            [0] = "a"
                                        }
                                        [1] = {
                                            Kind: String
                                            [0] = "b"
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "c"
                                        }
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
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'Res'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'n'
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'N'
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
                [5] = {
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
                        [0] = 'N'
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
                                                Kind: Index
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'Res'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'i'
                                                }
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
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
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'Res'
                                            }
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = "+"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'N'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 1
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
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'Res'
                                            }
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = "+"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'N'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 2
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
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'Res'
                                        }
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "+"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'N'
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 3
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = "c"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [61] = {
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
                    Kind: Null
                    [0] = 'nil'
                }
            }
        }
        [62] = {
            Kind: FunctionCall
            [0] = {
                Kind: FunctionDefinition
                [0] = nullptr
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
                                    [0] = 'a'
                                }
                            }
                            [1] = {
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
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: Numeric
                        [0] = 23
                    }
                }
            }
        }
        [63] = {
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
                                [0] = 23
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: FunctionDefinition
                                    [0] = nullptr
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
                                                Kind: ReturnStatement
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = "*"
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'x'
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
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 20
                                        }
                                    }
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 40
                            }
                        }
                    }
                }
            }
        }
        [64] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'Z'
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
                                    [0] = 'le'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: FunctionDefinition
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [1] = {
                                            Kind: FunctionBody
                                            [0] = {
                                                Kind: ParameterList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'f'
                                                }
                                            }
                                            [1] = {
                                                Kind: Block
                                                [0] = {
                                                    Kind: ReturnStatement
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: FunctionCall
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'le'
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
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
                                                                                    [0] = 'x'
                                                                                }
                                                                            }
                                                                            [1] = {
                                                                                Kind: Block
                                                                                [0] = {
                                                                                    Kind: ReturnStatement
                                                                                    [0] = {
                                                                                        Kind: ExpressionList
                                                                                        [0] = {
                                                                                            Kind: FunctionCall
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
                                                                                                            [0] = 'f'
                                                                                                        }
                                                                                                    }
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
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'a'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
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
                                }
                            }
                        }
                    }
                }
            }
        }
        [65] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'F'
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
                                    [0] = 'f'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: ReturnStatement
                                    [0] = {
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
                                                        [0] = 'n'
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
                                                                [0] = "=="
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'n'
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
                                                                            Kind: Numeric
                                                                            [0] = 1
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
                                                                            Kind: BinaryOperation
                                                                            [0] = "*"
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'n'
                                                                            }
                                                                            [2] = {
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
        [66] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'fat'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'Z'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'F'
                                }
                            }
                        }
                    }
                }
            }
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
                            [0] = "and"
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'fat'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
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
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "=="
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'fat'
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
                                    [0] = 24
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'Z'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'F'
                                            }
                                        }
                                    }
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
                            [2] = {
                                Kind: BinaryOperation
                                [0] = "*"
                                [1] = {
                                    Kind: Numeric
                                    [0] = 5
                                }
                                [2] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'Z'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'F'
                                                }
                                            }
                                        }
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
                            }
                        }
                    }
                }
            }
        }
        [68] = {
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
                            [0] = 'z'
                        }
                    }
                    [1] = {
                        Kind: Block
                        [0] = {
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
                                        Kind: Block
                                        [0] = {
                                            Kind: ReturnStatement
                                            [0] = {
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
                                                                [0] = 'x'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'y'
                                                            }
                                                        }
                                                        [1] = {
                                                            Kind: Block
                                                            [0] = {
                                                                Kind: ReturnStatement
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: BinaryOperation
                                                                        [0] = "+"
                                                                        [1] = {
                                                                            Kind: BinaryOperation
                                                                            [0] = "+"
                                                                            [1] = {
                                                                                Kind: BinaryOperation
                                                                                [0] = "+"
                                                                                [1] = {
                                                                                    Kind: BinaryOperation
                                                                                    [0] = "+"
                                                                                    [1] = {
                                                                                        Kind: BinaryOperation
                                                                                        [0] = "+"
                                                                                        [1] = {
                                                                                            Kind: BinaryOperation
                                                                                            [0] = "+"
                                                                                            [1] = {
                                                                                                Kind: BinaryOperation
                                                                                                [0] = "+"
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
                                                                                        [0] = 'a'
                                                                                    }
                                                                                }
                                                                                [2] = {
                                                                                    Kind: Identifier
                                                                                    [0] = 'x'
                                                                                }
                                                                            }
                                                                            [2] = {
                                                                                Kind: Identifier
                                                                                [0] = 'y'
                                                                            }
                                                                        }
                                                                        [2] = {
                                                                            Kind: Identifier
                                                                            [0] = 'z'
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
                            Kind: ReturnStatement
                            [0] = {
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
                                                [0] = 'z'
                                            }
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = "+"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'z'
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
                                                    Kind: Identifier
                                                    [0] = 'z'
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 2
                                                }
                                            }
                                            [3] = {
                                                Kind: BinaryOperation
                                                [0] = "+"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'z'
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
            }
        }
        [69] = {
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
                }
            }
        }
        [70] = {
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
                                        Kind: Numeric
                                        [0] = 9
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 16
                                    }
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
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = "+"
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = "+"
                                                [1] = {
                                                    Kind: BinaryOperation
                                                    [0] = "+"
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 10
                                                    }
                                                    [2] = {
                                                        Kind: Numeric
                                                        [0] = 11
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Numeric
                                                    [0] = 12
                                                }
                                            }
                                            [2] = {
                                                Kind: Numeric
                                                [0] = 13
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 10
                                        }
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 9
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 16
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
        }
        [71] = {
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
        [72] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'unlpack'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 't'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'i'
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
                                    [0] = "or"
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
                            Kind: IfStatement
                            [0] = {
                                Kind: ConditionalBlock
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = "<="
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
                                [1] = {
                                    Kind: Block
                                    [0] = {
                                        Kind: ReturnStatement
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
                                            [1] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'unlpack'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 't'
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
        [73] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'equaltab'
                }
                [1] = {
                    Kind: FunctionBody
                    [0] = {
                        Kind: ParameterList
                        [0] = {
                            Kind: Identifier
                            [0] = 't1'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 't2'
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
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't1'
                                            }
                                        }
                                        [2] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 't2'
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
                                    [0] = 't1'
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
                                                        [0] = 't1'
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
                                                        [0] = 't2'
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
        }
        [74] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
                        Kind: Identifier
                        [0] = 'pack'
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
                                    Kind: Varargs
                                    [0] = '...'
                                }
                            }
                            [1] = {
                                Kind: Block
                                [0] = {
                                    Kind: ReturnStatement
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
                                                    [0] = 'pack'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Varargs
                                                        [0] = '...'
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
        [75] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
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
                                    [0] = 30
                                }
                                [3] = {
                                    Kind: Numeric
                                    [0] = 4
                                }
                            }
                        }
                    }
                }
            }
        }
        [76] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'ret2'
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
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'b'
                                }
                            }
                        }
                    }
                }
            }
        }
        [77] = {
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
                            Kind: Identifier
                            [0] = 'unlpack'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: TableConstructor
                                [0] = {
                                    Kind: FieldList
                                    [0] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 2
                                        }
                                    }
                                    [2] = {
                                        Kind: TableValue
                                        [0] = {
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
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: Identifier
                                [0] = 'd'
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
        [79] = {
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
                            Kind: TableValue
                            [0] = {
                                Kind: Numeric
                                [0] = 1
                            }
                        }
                        [1] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Numeric
                                [0] = 2
                            }
                        }
                        [2] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Numeric
                                [0] = 3
                            }
                        }
                        [3] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Numeric
                                [0] = 4
                            }
                        }
                        [4] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Boolean
                                [0] = 0
                            }
                        }
                        [5] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Numeric
                                [0] = 10
                            }
                        }
                        [6] = {
                            Kind: TableValue
                            [0] = {
                                Kind: String
                                [0] = "alo"
                            }
                        }
                        [7] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Boolean
                                [0] = 0
                            }
                        }
                        [8] = {
                            Kind: TableValue
                            [0] = {
                                Kind: Identifier
                                [0] = 'assert'
                            }
                        }
                    }
                }
            }
        }
        [80] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'equaltab'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'pack'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'unlpack'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
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
                        }
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'a'
                    }
                }
            }
        }
        [81] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'equaltab'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Identifier
                            [0] = 'pack'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'unlpack'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'a'
                                            }
                                        }
                                    }
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
                    [1] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
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
        [82] = {
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
                        Kind: Identifier
                        [0] = 'ret2'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
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
                [1] = {
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'ret2'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
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
            }
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
                                        [0] = 1
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
                                    [0] = 2
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: Identifier
                                [0] = 'd'
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
        [84] = {
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
                        Kind: Identifier
                        [0] = 'unlpack'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'pack'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ret2'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
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
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ret2'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
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
                                    }
                                }
                            }
                        }
                    }
                }
            }
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
                                        [0] = 1
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
                                    [0] = 2
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: Identifier
                                [0] = 'd'
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
        [86] = {
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
                        Kind: Identifier
                        [0] = 'unlpack'
                    }
                    [1] = {
                        Kind: ArgumentList
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'pack'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ret2'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
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
                                        [1] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'ret2'
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
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
                                        [0] = 1
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
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: Identifier
                                [0] = 'd'
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
                    Kind: FunctionCall
                    [0] = {
                        Kind: Identifier
                        [0] = 'ret2'
                    }
                    [1] = {
                        Kind: ArgumentList
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
                                            [0] = 'unlpack'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: TableConstructor
                                                [0] = {
                                                    Kind: FieldList
                                                    [0] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: Numeric
                                                            [0] = 1
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: Numeric
                                                            [0] = 2
                                                        }
                                                    }
                                                    [2] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: Numeric
                                                            [0] = 3
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
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'unlpack'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
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
                                                            [0] = 2
                                                        }
                                                    }
                                                    [2] = {
                                                        Kind: TableValue
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
                                [2] = {
                                    Kind: TableValue
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'unlpack'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: TableConstructor
                                                [0] = {
                                                    Kind: FieldList
                                                    [0] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: String
                                                            [0] = "a"
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: String
                                                            [0] = "b"
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
                                            [0] = 'a'
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
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [1] = {
                                            Kind: Numeric
                                            [0] = 2
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
                                [0] = "=="
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'a'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "a"
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
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 4
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "b"
                            }
                        }
                    }
                }
            }
        }
        [90] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'rawget'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: TableConstructor
                        [0] = nullptr
                    }
                    [1] = {
                        Kind: String
                        [0] = "x"
                    }
                    [2] = {
                        Kind: Numeric
                        [0] = 1
                    }
                }
            }
        }
        [91] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'rawset'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: TableConstructor
                        [0] = nullptr
                    }
                    [1] = {
                        Kind: String
                        [0] = "x"
                    }
                    [2] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [3] = {
                        Kind: Numeric
                        [0] = 2
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
                        [0] = "=="
                        [1] = {
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
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 2
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
        }
        [93] = {
            Kind: FunctionCall
            [0] = {
                Kind: Member
                [0] = {
                    Kind: Identifier
                    [0] = 'table'
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'sort'
                }
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: TableConstructor
                        [0] = {
                            Kind: FieldList
                            [0] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 10
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 9
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 8
                                }
                            }
                            [3] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 4
                                }
                            }
                            [4] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 19
                                }
                            }
                            [5] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: Numeric
                                    [0] = 23
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
                                    [0] = 0
                                }
                            }
                        }
                    }
                    [1] = {
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
                                    Kind: ReturnStatement
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = "<"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'a'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'b'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [2] = {
                        Kind: String
                        [0] = "extra arg"
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
                        [0] = 'x'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "-- a comment\0\0\0\n  x = 10 + \n23; \n     local a = function () x = 'hi' end; \n     return '\0'"
                    }
                }
            }
        }
        [95] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'read1'
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
                        [1] = {
                            Kind: ReturnStatement
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionDefinition
                                    [0] = nullptr
                                    [1] = {
                                        Kind: FunctionBody
                                        [0] = nullptr
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'collectgarbage'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = nullptr
                                                }
                                            }
                                            [1] = {
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
                                            [2] = {
                                                Kind: ReturnStatement
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
                                                                    [0] = 'x'
                                                                }
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'i'
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
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [96] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'cannotload'
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
                            [0] = 'a'
                        }
                        [2] = {
                            Kind: Identifier
                            [0] = 'b'
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
                                                        [0] = 'b'
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
        [97] = {
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
                                                Kind: Identifier
                                                [0] = 'read1'
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
                                        [1] = {
                                            Kind: String
                                            [0] = "modname"
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "t"
                                        }
                                        [3] = {
                                            Kind: Identifier
                                            [0] = '_G'
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [98] = {
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
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = nullptr
                                }
                            }
                            [2] = {
                                Kind: String
                                [0] = "\0"
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = "=="
                            [1] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = '_G'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
                                }
                            }
                            [2] = {
                                Kind: Numeric
                                [0] = 33
                            }
                        }
                    }
                }
            }
        }
        [99] = {
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
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                    }
                                }
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'source'
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = "modname"
                        }
                    }
                }
            }
        }
        [100] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "attempt to load a text chunk"
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
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'read1'
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
                                [1] = {
                                    Kind: String
                                    [0] = "modname"
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "b"
                                }
                                [3] = {
                                    Kind: TableConstructor
                                    [0] = nullptr
                                }
                            }
                        }
                    }
                }
            }
        }
        [101] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "attempt to load a text chunk"
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
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: String
                                    [0] = "modname"
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "b"
                                }
                            }
                        }
                    }
                }
            }
        }
        [102] = {
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
                                            Kind: FunctionDefinition
                                            [0] = nullptr
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
                            }
                        }
                    }
                }
            }
        }
        [103] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'a'
            }
            [1] = {
                Kind: ArgumentList
                [0] = nullptr
            }
        }
        [104] = {
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
                                Kind: Identifier
                                [0] = 'load'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: FunctionDefinition
                                        [0] = nullptr
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
                                                            Kind: Boolean
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
        [105] = {
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
                                    Kind: Null
                                    [0] = 'nil'
                                }
                            }
                            [1] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: String
                                    [0] = "return "
                                }
                            }
                            [2] = {
                                Kind: TableValue
                                [0] = {
                                    Kind: String
                                    [0] = "3"
                                }
                            }
                        }
                    }
                }
            }
        }
        [106] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'f'
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'msg'
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
                                Kind: FunctionDefinition
                                [0] = nullptr
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
                                                    Kind: FunctionCall
                                                    [0] = {
                                                        Kind: Member
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'table'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'remove'
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
                        [0] = "=="
                        [1] = {
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
                        [2] = {
                            Kind: Null
                            [0] = 'nil'
                        }
                    }
                }
            }
        }
        [108] = {
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
                                        [0] = 'dump'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionDefinition
                                            [0] = nullptr
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
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            [1] = {
                                Kind: Null
                                [0] = 'nil'
                            }
                            [2] = {
                                Kind: String
                                [0] = "b"
                            }
                            [3] = {
                                Kind: TableConstructor
                                [0] = nullptr
                            }
                        }
                    }
                }
            }
        }
        [109] = {
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
                                    [0] = 'type'
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
                            [2] = {
                                Kind: String
                                [0] = "function"
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
                                    [0] = nullptr
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
        [110] = {
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
                                        [0] = 'dump'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionDefinition
                                            [0] = nullptr
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
                                                                Kind: String
                                                                [0] = "01234567890123456789012345678901234567890123456789"
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
                                            Kind: Identifier
                                            [0] = 'read1'
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
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = nullptr
                                    }
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "01234567890123456789012345678901234567890123456789"
                                }
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
                    Kind: FunctionCall
                    [0] = {
                        Kind: Member
                        [0] = {
                            Kind: Identifier
                            [0] = 'string'
                        }
                        [1] = {
                            Kind: Identifier
                            [0] = 'dump'
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
                                    [0] = 'load'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: String
                                            [0] = "x = 1; return x"
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
                                                Kind: Identifier
                                                [0] = 'read1'
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
                                        [1] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "b"
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
                            [0] = "=="
                            [1] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'a'
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = nullptr
                                }
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
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = '_G'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'x'
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
        [114] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "attempt to load a binary chunk"
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
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'read1'
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
                                [1] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "t"
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
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "attempt to load a binary chunk"
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
                                    [0] = 'x'
                                }
                                [1] = {
                                    Kind: Null
                                    [0] = 'nil'
                                }
                                [2] = {
                                    Kind: String
                                    [0] = "t"
                                }
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
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = '_G'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'x'
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
                        Kind: UnaryOperation
                        [0] = "not"
                        [1] = {
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
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'string'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'dump'
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'print'
                                    }
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
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "unexpected symbol"
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
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'read1'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = "*a = 123"
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
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "unexpected symbol"
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
                                    Kind: String
                                    [0] = "*a = 123"
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
                [0] = 'cannotload'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "hhi"
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
                                    Kind: FunctionDefinition
                                    [0] = nullptr
                                    [1] = {
                                        Kind: FunctionBody
                                        [0] = nullptr
                                        [1] = {
                                            Kind: Block
                                            [0] = {
                                                Kind: FunctionCall
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'error'
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: String
                                                            [0] = "hhi"
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
                                            Kind: String
                                            [0] = "return _ENV"
                                        }
                                        [1] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [2] = {
                                            Kind: Null
                                            [0] = 'nil'
                                        }
                                        [3] = {
                                            Kind: Numeric
                                            [0] = 123
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
                            Kind: Numeric
                            [0] = 123
                        }
                    }
                }
            }
        }
        [122] = {
            Kind: LocalStatement
            [0] = {
                Kind: AttributeList
                [0] = {
                    Kind: Identifier
                    [0] = 'x'
                }
            }
        }
        [123] = {
            Kind: Semicolon
        }
        [124] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'XX'
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Numeric
                    [0] = 123
                }
            }
        }
        [125] = {
            Kind: LocalStatement
            [0] = {
                Kind: FunctionDefinition
                [0] = {
                    Kind: Identifier
                    [0] = 'h'
                }
                [1] = {
                    Kind: FunctionBody
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
                                        [0] = 'y'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'x'
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
                                    [0] = 'XX'
                                }
                            }
                        }
                    }
                }
            }
        }
        [126] = {
            Kind: LocalStatement
            [0] = {
                Kind: AssignmentStatement
                [0] = {
                    Kind: AttributeList
                    [0] = {
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
                                [0] = 'string'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'dump'
                            }
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'h'
                                }
                            }
                        }
                    }
                }
            }
        }
        [127] = {
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
                                [0] = 'd'
                            }
                            [1] = {
                                Kind: String
                                [0] = ""
                            }
                            [2] = {
                                Kind: String
                                [0] = "b"
                            }
                        }
                    }
                }
            }
        }
        [128] = {
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
                                    [0] = 'debug'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'getupvalue'
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
                                        [0] = 2
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = "_ENV"
                        }
                    }
                }
            }
        }
        [129] = {
            Kind: FunctionCall
            [0] = {
                Kind: Member
                [0] = {
                    Kind: Identifier
                    [0] = 'debug'
                }
                [1] = {
                    Kind: Identifier
                    [0] = 'setupvalue'
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
                        [0] = 2
                    }
                    [2] = {
                        Kind: Identifier
                        [0] = '_G'
                    }
                }
            }
        }
        [130] = {
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
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 123
                        }
                    }
                }
            }
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
                                                        Kind: String
                                                        [0] = "return XX + ..."
                                                    }
                                                    [1] = {
                                                        Kind: Null
                                                        [0] = 'nil'
                                                    }
                                                    [2] = {
                                                        Kind: Null
                                                        [0] = 'nil'
                                                    }
                                                    [3] = {
                                                        Kind: TableConstructor
                                                        [0] = {
                                                            Kind: FieldList
                                                            [0] = {
                                                                Kind: TableNameValue
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 'XX'
                                                                }
                                                                [1] = {
                                                                    Kind: Numeric
                                                                    [0] = 13
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
                            [0] = 17
                        }
                    }
                }
            }
        }
        [132] = {
            Kind: AssignmentStatement
            [0] = {
                Kind: VariableList
                [0] = {
                    Kind: Identifier
                    [0] = 'XX'
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
        [133] = {
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
                    [0] = "\n  return function (x)\n    return function (y)\n     return function (z)\n       return x+y+z\n     end\n   end\n  end\n"
                }
            }
        }
        [134] = {
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
                                                Kind: Identifier
                                                [0] = 'read1'
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
                                        [1] = {
                                            Kind: String
                                            [0] = "read"
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "t"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
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
                                Kind: FunctionCall
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = nullptr
                                        }
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
                        [2] = {
                            Kind: Numeric
                            [0] = 15
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
                    [0] = 'x'
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
                            [0] = 'dump'
                        }
                    }
                    [1] = {
                        Kind: ArgumentList
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
        }
        [137] = {
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
                                                Kind: Identifier
                                                [0] = 'read1'
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
                                        [1] = {
                                            Kind: String
                                            [0] = "read"
                                        }
                                        [2] = {
                                            Kind: String
                                            [0] = "b"
                                        }
                                    }
                                }
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
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'a'
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = nullptr
                                        }
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
                        [2] = {
                            Kind: Numeric
                            [0] = 15
                        }
                    }
                }
            }
        }
        [139] = {
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
                        [0] = 20
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 30
                    }
                }
            }
        }
        [140] = {
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
                                        [0] = 'dump'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
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
                                                        [0] = 'x'
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
                                                                [0] = "=="
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'x'
                                                                }
                                                                [2] = {
                                                                    Kind: String
                                                                    [0] = "set"
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
                                                                            Kind: BinaryOperation
                                                                            [0] = "+"
                                                                            [1] = {
                                                                                Kind: Numeric
                                                                                [0] = 10
                                                                            }
                                                                            [2] = {
                                                                                Kind: Identifier
                                                                                [0] = 'b'
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
                                                                            [0] = 'b'
                                                                        }
                                                                    }
                                                                    [1] = {
                                                                        Kind: ExpressionList
                                                                        [0] = {
                                                                            Kind: BinaryOperation
                                                                            [0] = "+"
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'b'
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
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            [1] = {
                                Kind: String
                                [0] = ""
                            }
                            [2] = {
                                Kind: String
                                [0] = "b"
                            }
                            [3] = {
                                Kind: Null
                                [0] = 'nil'
                            }
                        }
                    }
                }
            }
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
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
        [142] = {
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
                                    [0] = 'debug'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'setupvalue'
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
                                        [0] = 1
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = "hi"
                                    }
                                }
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
        [143] = {
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
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                        [2] = {
                            Kind: String
                            [0] = "hi"
                        }
                    }
                }
            }
        }
        [144] = {
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
                                    [0] = 'debug'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'setupvalue'
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
                                        [0] = 2
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 13
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
            }
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
                        Kind: UnaryOperation
                        [0] = "not"
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'debug'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'setupvalue'
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
                                        [0] = 3
                                    }
                                    [2] = {
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
        [146] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'x'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "set"
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 23
                        }
                    }
                }
            }
        }
        [148] = {
            Kind: FunctionCall
            [0] = {
                Kind: Identifier
                [0] = 'x'
            }
            [1] = {
                Kind: ArgumentList
                [0] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: String
                        [0] = "set"
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: Identifier
                                [0] = 'x'
                            }
                            [1] = {
                                Kind: ArgumentList
                                [0] = nullptr
                            }
                        }
                        [2] = {
                            Kind: Numeric
                            [0] = 24
                        }
                    }
                }
            }
        }
        [150] = {
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
                                [0] = 'nup'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Numeric
                                [0] = 200
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
                                [0] = 'prog'
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
                                            [0] = "local a1"
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
                        Kind: Identifier
                        [0] = 'i'
                    }
                    [1] = {
                        Kind: Numeric
                        [0] = 2
                    }
                    [2] = {
                        Kind: Identifier
                        [0] = 'nup'
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
                                        [0] = 'prog'
                                    }
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'prog'
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
                                        Kind: String
                                        [0] = ", a"
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
                [3] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Index
                            [0] = {
                                Kind: Identifier
                                [0] = 'prog'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'prog'
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
                            [0] = " = 1"
                        }
                    }
                }
                [4] = {
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
                        [0] = 'nup'
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
                                        [0] = 'prog'
                                    }
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'prog'
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
                                        Kind: String
                                        [0] = ", "
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
                [5] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 'sum'
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
                [6] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Index
                            [0] = {
                                Kind: Identifier
                                [0] = 'prog'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'prog'
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
                            [0] = "; return function () return a1"
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
                        [0] = 2
                    }
                    [2] = {
                        Kind: Identifier
                        [0] = 'nup'
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
                                        [0] = 'prog'
                                    }
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = "+"
                                        [1] = {
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'prog'
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
                                        Kind: String
                                        [0] = " + a"
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'i'
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
                                    [0] = 'sum'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: BinaryOperation
                                    [0] = "+"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'sum'
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
                [8] = {
                    Kind: AssignmentStatement
                    [0] = {
                        Kind: VariableList
                        [0] = {
                            Kind: Index
                            [0] = {
                                Kind: Identifier
                                [0] = 'prog'
                            }
                            [1] = {
                                Kind: BinaryOperation
                                [0] = "+"
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = "#"
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'prog'
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
                            [0] = " end"
                        }
                    }
                }
                [9] = {
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
                                        [0] = 'prog'
                                    }
                                }
                            }
                        }
                    }
                }
                [10] = {
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
                                                            Kind: Identifier
                                                            [0] = 'prog'
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
                                        Kind: Identifier
                                        [0] = 'f'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = nullptr
                                    }
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'sum'
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
                            [0] = 'f'
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
                                                [0] = 'dump'
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
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                [13] = {
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
                                Kind: Numeric
                                [0] = 10
                            }
                        }
                    }
                }
                [14] = {
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
                            [0] = {
                                Kind: Identifier
                                [0] = 'h'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: FunctionDefinition
                                [0] = nullptr
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
                                                    Kind: Identifier
                                                    [0] = 'a'
                                                }
                                            }
                                        }
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
                        [0] = 'nup'
                    }
                    [3] = nullptr
                    [4] = {
                        Kind: Block
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
                                    [0] = 'upvaluejoin'
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
                                        Kind: Identifier
                                        [0] = 'i'
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'h'
                                    }
                                    [3] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                    }
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
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "*"
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 10
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'nup'
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        [151] = {
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
                }
                [1] = {
                    Kind: FunctionDefinition
                    [0] = {
                        Kind: FunctionName
                        [0] = {
                            Kind: Method
                            [0] = {
                                Kind: Identifier
                                [0] = 't'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = '_012345678901234567890123456789012345678901234567890123456789'
                            }
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
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'x'
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
                                        Kind: Method
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 't'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = '_012345678901234567890123456789012345678901234567890123456789'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = nullptr
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: FunctionDefinition
                                [0] = nullptr
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
                                                    Kind: Null
                                                    [0] = 'nil'
                                                }
                                            }
                                        }
                                    }
                                }
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
                            Kind: Null
                            [0] = 'nil'
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
                            [0] = {
                                Kind: FunctionDefinition
                                [0] = nullptr
                                [1] = {
                                    Kind: FunctionBody
                                    [0] = nullptr
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
                            Kind: Null
                            [0] = 'nil'
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
                        [0] = "=="
                        [1] = {
                            Kind: FunctionCall
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
        [155] = {
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
                        [0] = "testing binary chunks"
                    }
                }
            }
        }
        [156] = {
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
                                [0] = 'header'
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
                                        [0] = 'pack'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: String
                                            [0] = "c4BBc6BBB"
                                        }
                                        [1] = {
                                            Kind: String
                                            [0] = "\27Lua"
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 84
                                        }
                                        [3] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                        [4] = {
                                            Kind: String
                                            [0] = "\x19\x93\r\n\x1a\n"
                                        }
                                        [5] = {
                                            Kind: Numeric
                                            [0] = 4
                                        }
                                        [6] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'string'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'packsize'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = "j"
                                                    }
                                                }
                                            }
                                        }
                                        [7] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'string'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'packsize'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: String
                                                        [0] = "n"
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
                    Kind: LocalStatement
                    [0] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: AttributeList
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
                                        [0] = 'dump'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionDefinition
                                            [0] = nullptr
                                            [1] = {
                                                Kind: FunctionBody
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
                                                                    [0] = 3
                                                                }
                                                            }
                                                        }
                                                    }
                                                    [3] = {
                                                        Kind: Semicolon
                                                    }
                                                    [4] = {
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
                                                                        [0] = nullptr
                                                                        [1] = {
                                                                            Kind: Block
                                                                            [0] = {
                                                                                Kind: ReturnStatement
                                                                                [0] = {
                                                                                    Kind: ExpressionList
                                                                                    [0] = {
                                                                                        Kind: BinaryOperation
                                                                                        [0] = "+"
                                                                                        [1] = {
                                                                                            Kind: BinaryOperation
                                                                                            [0] = "+"
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
                                                                                            Kind: Member
                                                                                            [0] = {
                                                                                                Kind: Identifier
                                                                                                [0] = '_ENV'
                                                                                            }
                                                                                            [1] = {
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
                                                    [5] = {
                                                        Kind: LocalStatement
                                                        [0] = {
                                                            Kind: AssignmentStatement
                                                            [0] = {
                                                                Kind: AttributeList
                                                                [0] = {
                                                                    Kind: Identifier
                                                                    [0] = 's1'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ExpressionList
                                                                [0] = {
                                                                    Kind: String
                                                                    [0] = "a constant"
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
                                                                    [0] = 's2'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ExpressionList
                                                                [0] = {
                                                                    Kind: String
                                                                    [0] = "another constant"
                                                                }
                                                            }
                                                        }
                                                    }
                                                    [7] = {
                                                        Kind: ReturnStatement
                                                        [0] = {
                                                            Kind: ExpressionList
                                                            [0] = {
                                                                Kind: BinaryOperation
                                                                [0] = "+"
                                                                [1] = {
                                                                    Kind: Identifier
                                                                    [0] = 'a'
                                                                }
                                                                [2] = {
                                                                    Kind: BinaryOperation
                                                                    [0] = "*"
                                                                    [1] = {
                                                                        Kind: Identifier
                                                                        [0] = 'b'
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
                                                                [0] = 'c'
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
                                    Kind: Numeric
                                    [0] = 10
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
                                                [0] = 'c'
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
                                                    [0] = 'header'
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'header'
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
                                [0] = 'ci'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'cn'
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
                                        [0] = 'unpack'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: String
                                            [0] = "jn"
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'c'
                                        }
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = "+"
                                            [1] = {
                                                Kind: UnaryOperation
                                                [0] = "#"
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'header'
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
                                [0] = "and"
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'ci'
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 22136
                                    }
                                }
                                [2] = {
                                    Kind: BinaryOperation
                                    [0] = "=="
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'cn'
                                    }
                                    [2] = {
                                        Kind: Numeric
                                        [0] = 370.5
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
                            [0] = 'header'
                        }
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
                                        [0] = 's'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = ".."
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
                                                    [0] = 'sub'
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
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                    [2] = {
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
                                        [2] = {
                                            Kind: BinaryOperation
                                            [0] = ".."
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
                                                        [0] = 'char'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: BinaryOperation
                                                            [0] = "+"
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
                                                                        [0] = 'byte'
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
                                                                                        [0] = 'c'
                                                                                    }
                                                                                    [1] = {
                                                                                        Kind: Identifier
                                                                                        [0] = 'i'
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
                                                                Kind: Numeric
                                                                [0] = 1
                                                            }
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
                                                            [0] = 'c'
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
                                            Kind: UnaryOperation
                                            [0] = "#"
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'c'
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
                                        Kind: UnaryOperation
                                        [0] = "not"
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
                            Kind: LocalStatement
                            [0] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: AttributeList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'st'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'msg'
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
                                                            [0] = 'sub'
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
                                                            [1] = {
                                                                Kind: Numeric
                                                                [0] = 1
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
                                                [0] = 'st'
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
                                                        [0] = 'msg'
                                                    }
                                                    [1] = {
                                                        Kind: String
                                                        [0] = "truncated"
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
        [157] = {
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
                        [0] = "OK"
                    }
                }
            }
        }
        [158] = {
            Kind: ReturnStatement
            [0] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Identifier
                    [0] = 'deep'
                }
            }
        }
    }
}