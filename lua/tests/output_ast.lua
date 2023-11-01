{
    Kind: Chunk
    [0] = {
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
                        Kind: BinaryOperation
                        [0] = '^'
                        [1] = {
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
                        [2] = {
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
        [1] = {
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
                    [0] = '+'
                    [1] = {
                        Kind: Numeric
                        [0] = 1
                    }
                    [2] = {
                        Kind: BinaryOperation
                        [0] = '*'
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