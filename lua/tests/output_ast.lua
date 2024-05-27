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
                    [0] = "+"
                    [1] = {
                        Kind: UnaryOperation
                        [0] = "-"
                        [1] = {
                            Kind: Numeric
                            [0] = 5
                        }
                    }
                    [2] = {
                        Kind: UnaryOperation
                        [0] = "-"
                        [1] = {
                            Kind: Numeric
                            [0] = 6
                        }
                    }
                }
            }
        }
    }
}