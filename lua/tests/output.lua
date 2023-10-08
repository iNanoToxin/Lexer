{
    Kind: Chunk
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
                        [0] = 'CharSplitLMMinibatchLoader'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: TableConstructor
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
                        [0] = 'CharSplitLMMinibatchLoader'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = '__index'
                    }
                }
            }
            [1] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Identifier
                    [0] = 'CharSplitLMMinibatchLoader'
                }
            }
        }
        [2] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = 'CharSplitLMMinibatchLoader'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'create'
                    }
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'data_dir'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'batch_size'
                    }
                    [2] = {
                        Kind: Identifier
                        [0] = 'seq_length'
                    }
                    [3] = {
                        Kind: Identifier
                        [0] = 'split_fractions'
                    }
                    [4] = {
                        Kind: Identifier
                        [0] = 'min_freq'
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
                                    [0] = 'self'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: TableConstructor
                                }
                            }
                        }
                    }
                    [1] = {
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
                                    Kind: Identifier
                                    [0] = 'self'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'CharSplitLMMinibatchLoader'
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
                                    [0] = 'input_file'
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
                                            [0] = 'path'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'join'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'data_dir'
                                            }
                                            [1] = {
                                                Kind: String
                                                [0] = 'input.txt'
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
                                    [0] = 'vocab_file'
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
                                            [0] = 'path'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'join'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'data_dir'
                                            }
                                            [1] = {
                                                Kind: String
                                                [0] = 'vocab.t7'
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
                                    [0] = 'tensor_file'
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
                                            [0] = 'path'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'join'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'data_dir'
                                            }
                                            [1] = {
                                                Kind: String
                                                [0] = 'data.t7'
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
                                    [0] = 'run_prepro'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Boolean
                                    [0] = 'false'
                                }
                            }
                        }
                    }
                    [6] = {
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
                                        Kind: FunctionCall
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'path'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'exists'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'vocab_file'
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
                                                [0] = 'path'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'exists'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'tensor_file'
                                                }
                                            }
                                        }
                                    }
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
                                                [0] = 'vocab.t7 and data.t7 do not exist. Running preprocessing...'
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
                                            [0] = 'run_prepro'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Boolean
                                            [0] = 'true'
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
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: AttributeList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'input_attr'
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
                                                        [0] = 'lfs'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'attributes'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'input_file'
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
                                                [0] = 'vocab_attr'
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
                                                        [0] = 'lfs'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'attributes'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'vocab_file'
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
                                                [0] = 'tensor_attr'
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
                                                        [0] = 'lfs'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'attributes'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'tensor_file'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                [3] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = 'or'
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = '>'
                                                [1] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'input_attr'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'modification'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'vocab_attr'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'modification'
                                                    }
                                                }
                                            }
                                            [2] = {
                                                Kind: BinaryOperation
                                                [0] = '>'
                                                [1] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'input_attr'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'modification'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'tensor_attr'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'modification'
                                                    }
                                                }
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
                                                            [0] = 'vocab.t7 or data.t7 detected as stale. Re-running preprocessing...'
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
                                                        [0] = 'run_prepro'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Boolean
                                                        [0] = 'true'
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
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: Identifier
                                [0] = 'run_prepro'
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
                                                Kind: BinaryOperation
                                                [0] = '..'
                                                [1] = {
                                                    Kind: BinaryOperation
                                                    [0] = '..'
                                                    [1] = {
                                                        Kind: String
                                                        [0] = 'one-time setup: preprocessing input text file '
                                                    }
                                                    [2] = {
                                                        Kind: Identifier
                                                        [0] = 'input_file'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: String
                                                    [0] = '...'
                                                }
                                            }
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'CharSplitLMMinibatchLoader'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'text_to_tensor'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'input_file'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'vocab_file'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'tensor_file'
                                            }
                                            [3] = {
                                                Kind: Identifier
                                                [0] = 'min_freq'
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
                            [0] = 'print'
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: String
                                    [0] = 'loading data files...'
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
                                    [0] = 'data'
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
                                            [0] = 'torch'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'load'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'tensor_file'
                                            }
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
                                Kind: Member
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'self'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'vocab_mapping'
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
                                        [0] = 'torch'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'load'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'vocab_file'
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [11] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'len'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Method
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'data'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'size'
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
                    [12] = {
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '~='
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '%'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'len'
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '*'
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'batch_size'
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 'seq_length'
                                        }
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
                                                [0] = 'cutting off end of data so that the batches/sequences divide evenly'
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
                                            [0] = 'data'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: FunctionCall
                                            [0] = {
                                                Kind: Method
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'data'
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
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                    [1] = {
                                                        Kind: BinaryOperation
                                                        [0] = '*'
                                                        [1] = {
                                                            Kind: BinaryOperation
                                                            [0] = '*'
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'batch_size'
                                                            }
                                                            [2] = {
                                                                Kind: Identifier
                                                                [0] = 'seq_length'
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
                                                                    [0] = 'floor'
                                                                }
                                                            }
                                                            [1] = {
                                                                Kind: ArgumentList
                                                                [0] = {
                                                                    Kind: ExpressionList
                                                                    [0] = {
                                                                        Kind: BinaryOperation
                                                                        [0] = '/'
                                                                        [1] = {
                                                                            Kind: Identifier
                                                                            [0] = 'len'
                                                                        }
                                                                        [2] = {
                                                                            Kind: BinaryOperation
                                                                            [0] = '*'
                                                                            [1] = {
                                                                                Kind: Identifier
                                                                                [0] = 'batch_size'
                                                                            }
                                                                            [2] = {
                                                                                Kind: Identifier
                                                                                [0] = 'seq_length'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
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
                                    [0] = 'vocab_size'
                                }
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
                    [14] = {
                        Kind: ForStatement
                        [0] = {
                            Kind: NameList
                            [0] = {
                                Kind: Identifier
                                [0] = '_'
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
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'vocab_mapping'
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
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'vocab_size'
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = '+'
                                        [1] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'vocab_size'
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
                    [15] = {
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
                                    [0] = 'reshaping tensor...'
                                }
                            }
                        }
                    }
                    [16] = {
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
                                    [0] = 'batch_size'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'batch_size'
                            }
                        }
                    }
                    [17] = {
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
                                    [0] = 'seq_length'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'seq_length'
                            }
                        }
                    }
                    [18] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'ydata'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Method
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'data'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'clone'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                    }
                                }
                            }
                        }
                    }
                    [19] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Method
                            [0] = {
                                Kind: FunctionCall
                                [0] = {
                                    Kind: Method
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'ydata'
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
                                            Kind: Numeric
                                            [0] = 1
                                        }
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
                            [1] = {
                                Kind: Identifier
                                [0] = 'copy'
                            }
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Method
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'data'
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
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                            [1] = {
                                                Kind: UnaryOperation
                                                [0] = '-'
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
                    [20] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'ydata'
                                }
                                [1] = {
                                    Kind: UnaryOperation
                                    [0] = '-'
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 1
                                    }
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'data'
                                }
                                [1] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                    [21] = {
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
                                    [0] = 'x_batches'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
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
                                                [0] = 'data'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'view'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'batch_size'
                                                }
                                                [1] = {
                                                    Kind: UnaryOperation
                                                    [0] = '-'
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'seq_length'
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
                    [22] = {
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
                                    [0] = 'nbatches'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: UnaryOperation
                                [0] = '#'
                                [1] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'x_batches'
                                    }
                                }
                            }
                        }
                    }
                    [23] = {
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
                                    [0] = 'y_batches'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
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
                                                [0] = 'ydata'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'view'
                                            }
                                        }
                                        [1] = {
                                            Kind: ArgumentList
                                            [0] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'batch_size'
                                                }
                                                [1] = {
                                                    Kind: UnaryOperation
                                                    [0] = '-'
                                                    [1] = {
                                                        Kind: Numeric
                                                        [0] = 1
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split'
                                    }
                                }
                                [1] = {
                                    Kind: ArgumentList
                                    [0] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'seq_length'
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
                                    [0] = '=='
                                    [1] = {
                                        Kind: UnaryOperation
                                        [0] = '#'
                                        [1] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'x_batches'
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: UnaryOperation
                                        [0] = '#'
                                        [1] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'y_batches'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [25] = {
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '<'
                                [1] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'nbatches'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 50
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
                                                [0] = 'WARNING: less than 50 batches in the data in total? Looks like very small dataset. You probably want to use smaller batch_size and/or seq_length.'
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
                                    [0] = 'and'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '>='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '<='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
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
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '..'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '..'
                                        [1] = {
                                            Kind: String
                                            [0] = 'bad split fraction '
                                        }
                                        [2] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 1
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = ' for train, not between 0 and 1'
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
                                    [0] = 'and'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '>='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '<='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 1
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '..'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '..'
                                        [1] = {
                                            Kind: String
                                            [0] = 'bad split fraction '
                                        }
                                        [2] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 2
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = ' for val, not between 0 and 1'
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
                                        [0] = '>='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 3
                                            }
                                        }
                                        [2] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                    [2] = {
                                        Kind: BinaryOperation
                                        [0] = '<='
                                        [1] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
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
                                }
                                [1] = {
                                    Kind: BinaryOperation
                                    [0] = '..'
                                    [1] = {
                                        Kind: BinaryOperation
                                        [0] = '..'
                                        [1] = {
                                            Kind: String
                                            [0] = 'bad split fraction '
                                        }
                                        [2] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_fractions'
                                            }
                                            [1] = {
                                                Kind: Numeric
                                                [0] = 3
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: String
                                        [0] = ' for test, not between 0 and 1'
                                    }
                                }
                            }
                        }
                    }
                    [29] = {
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'split_fractions'
                                    }
                                    [1] = {
                                        Kind: Numeric
                                        [0] = 3
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
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'ntrain'
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
                                                    [0] = 'floor'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = '*'
                                                        [1] = {
                                                            Kind: Member
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'self'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'nbatches'
                                                            }
                                                        }
                                                        [2] = {
                                                            Kind: Index
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'split_fractions'
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
                                [1] = {
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
                                                [0] = 'nval'
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '-'
                                            [1] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'nbatches'
                                                }
                                            }
                                            [2] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ntrain'
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
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'ntest'
                                            }
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
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'ntrain'
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
                                                    [0] = 'floor'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = '*'
                                                        [1] = {
                                                            Kind: Member
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'self'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'nbatches'
                                                            }
                                                        }
                                                        [2] = {
                                                            Kind: Index
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'split_fractions'
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
                                [1] = {
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
                                                [0] = 'nval'
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
                                                    [0] = 'floor'
                                                }
                                            }
                                            [1] = {
                                                Kind: ArgumentList
                                                [0] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = '*'
                                                        [1] = {
                                                            Kind: Member
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'self'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'nbatches'
                                                            }
                                                        }
                                                        [2] = {
                                                            Kind: Index
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'split_fractions'
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
                                [2] = {
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
                                                [0] = 'ntest'
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '-'
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = '-'
                                                [1] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'self'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'nbatches'
                                                    }
                                                }
                                                [2] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'self'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'nval'
                                                    }
                                                }
                                            }
                                            [2] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ntrain'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [30] = {
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
                                    [0] = 'split_sizes'
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
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'ntrain'
                                            }
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'nval'
                                            }
                                        }
                                    }
                                    [2] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Member
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'self'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'ntest'
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [31] = {
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
                                    [0] = 'batch_ix'
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
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                    [1] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 0
                                        }
                                    }
                                    [2] = {
                                        Kind: TableValue
                                        [0] = {
                                            Kind: Numeric
                                            [0] = 0
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
                            [0] = 'print'
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
                                                [0] = 'data load done. Number of data batches in train: %d, val: %d, test: %d'
                                            }
                                            [1] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ntrain'
                                                }
                                            }
                                            [2] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'nval'
                                                }
                                            }
                                            [3] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ntest'
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
                            [0] = 'collectgarbage'
                        }
                        [1] = {
                            Kind: ArgumentList
                        }
                    }
                    [34] = {
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
        [3] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Method
                    [0] = {
                        Kind: Identifier
                        [0] = 'CharSplitLMMinibatchLoader'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'reset_batch_pointer'
                    }
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'split_index'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'batch_index'
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
                                [0] = 'batch_index'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = 'or'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'batch_index'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 0
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
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'batch_ix'
                                    }
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'split_index'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'batch_index'
                            }
                        }
                    }
                }
            }
        }
        [4] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Method
                    [0] = {
                        Kind: Identifier
                        [0] = 'CharSplitLMMinibatchLoader'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'next_batch'
                    }
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'split_index'
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
                                [0] = '=='
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'split_sizes'
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split_index'
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
                                    Kind: LocalStatement
                                    [0] = {
                                        Kind: AssignmentStatement
                                        [0] = {
                                            Kind: AttributeList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'split_names'
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
                                                            [0] = 'train'
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: String
                                                            [0] = 'val'
                                                        }
                                                    }
                                                    [2] = {
                                                        Kind: TableValue
                                                        [0] = {
                                                            Kind: String
                                                            [0] = 'test'
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
                                                    Kind: BinaryOperation
                                                    [0] = '..'
                                                    [1] = {
                                                        Kind: String
                                                        [0] = 'ERROR. Code requested a batch for split '
                                                    }
                                                    [2] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'split_names'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'split_index'
                                                        }
                                                    }
                                                }
                                                [2] = {
                                                    Kind: String
                                                    [0] = ', but this split has no data.'
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
                                            [0] = 'os'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'exit'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
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
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'batch_ix'
                                    }
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'split_index'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'batch_ix'
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split_index'
                                    }
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                    [2] = {
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '>'
                                [1] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'batch_ix'
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split_index'
                                    }
                                }
                                [2] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'split_sizes'
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split_index'
                                    }
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
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'batch_ix'
                                                }
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'split_index'
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
                                    [0] = 'ix'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Index
                                    [0] = {
                                        Kind: Member
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'self'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'batch_ix'
                                        }
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'split_index'
                                    }
                                }
                            }
                        }
                    }
                    [4] = {
                        Kind: IfStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '=='
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'split_index'
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
                                            [0] = 'ix'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'ix'
                                            }
                                            [2] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ntrain'
                                                }
                                            }
                                        }
                                    }
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
                                    Kind: Identifier
                                    [0] = 'split_index'
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
                                            [0] = 'ix'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: BinaryOperation
                                                [0] = '+'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ix'
                                                }
                                                [2] = {
                                                    Kind: Member
                                                    [0] = {
                                                        Kind: Identifier
                                                        [0] = 'self'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'ntrain'
                                                    }
                                                }
                                            }
                                            [2] = {
                                                Kind: Member
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'self'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'nval'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [6] = {
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'x_batches'
                                    }
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'ix'
                                }
                            }
                            [1] = {
                                Kind: Index
                                [0] = {
                                    Kind: Member
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'self'
                                    }
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'y_batches'
                                    }
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'ix'
                                }
                            }
                        }
                    }
                }
            }
        }
        [5] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'get_vocab'
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'str'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'min_freq'
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
                                    [0] = 'len'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: UnaryOperation
                                    [0] = '#'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'str'
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
                                    [0] = 'left'
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
                    [2] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'arr'
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
                                                [0] = 0
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xc0
                                            }
                                        }
                                        [2] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xe0
                                            }
                                        }
                                        [3] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xf0
                                            }
                                        }
                                        [4] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xf8
                                            }
                                        }
                                        [5] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xfc
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
                                    [0] = 'unordered'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: TableConstructor
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
                                    [0] = 'start'
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
                    [5] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'wordLen'
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
                    [6] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'g_total_chars'
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
                    [7] = {
                        Kind: WhileStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '~='
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'len'
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'left'
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
                                                [0] = 'tmp'
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
                                                        [0] = 'byte'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'str'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'start'
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
                                                [0] = 'i'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: UnaryOperation
                                                [0] = '#'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'arr'
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: WhileStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'arr'
                                            }
                                            [1] = {
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
                                                        [0] = '>='
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'tmp'
                                                        }
                                                        [2] = {
                                                            Kind: Index
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'arr'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'i'
                                                            }
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: Block
                                                        [0] = {
                                                            Kind: UNKNOWN_KIND
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
                                }
                                [3] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'wordLen'
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
                                                Kind: Identifier
                                                [0] = 'wordLen'
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
                                                [0] = 'tmpString'
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
                                                        [0] = 'sub'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'str'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'start'
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'wordLen'
                                                        }
                                                    }
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
                                            [0] = 'start'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'start'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'i'
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
                                            [0] = 'left'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'left'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                        }
                                    }
                                }
                                [7] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: UnaryOperation
                                            [0] = 'not'
                                            [1] = {
                                                Kind: Index
                                                [0] = {
                                                    Kind: Identifier
                                                    [0] = 'unordered'
                                                }
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'tmpString'
                                                }
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
                                                            [0] = 'unordered'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'tmpString'
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
                                                            Kind: Identifier
                                                            [0] = 'unordered'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'tmpString'
                                                        }
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: BinaryOperation
                                                        [0] = '+'
                                                        [1] = {
                                                            Kind: Index
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'unordered'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'tmpString'
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
                                [8] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'g_total_chars'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'g_total_chars'
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
                    [8] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'final_res'
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: TableConstructor
                            }
                        }
                    }
                    [9] = {
                        Kind: ForStatement
                        [0] = {
                            Kind: NameList
                            [0] = {
                                Kind: Identifier
                                [0] = 'char_val'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'char_cnt'
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
                                            Kind: Identifier
                                            [0] = 'unordered'
                                        }
                                    }
                                }
                            }
                        }
                        [2] = {
                            Kind: Block
                            [0] = {
                                Kind: IfStatement
                                [0] = {
                                    Kind: ConditionalBlock
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = '>='
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'char_cnt'
                                        }
                                        [2] = {
                                            Kind: Identifier
                                            [0] = 'min_freq'
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
                                                        [0] = 'final_res'
                                                    }
                                                    [1] = {
                                                        Kind: Identifier
                                                        [0] = 'char_val'
                                                    }
                                                }
                                            }
                                            [1] = {
                                                Kind: ExpressionList
                                                [0] = {
                                                    Kind: Boolean
                                                    [0] = 'true'
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    [10] = {
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'final_res'
                            }
                        }
                    }
                }
            }
        }
        [6] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Identifier
                    [0] = 'get_data'
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'str'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'vocab_mapping'
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
                                    [0] = 'data'
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
                                            [0] = 'torch'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'ShortTensor'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'g_total_chars'
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
                                    [0] = 'len'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: UnaryOperation
                                    [0] = '#'
                                    [1] = {
                                        Kind: Identifier
                                        [0] = 'str'
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
                                    [0] = 'left'
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
                    [3] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'arr'
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
                                                [0] = 0
                                            }
                                        }
                                        [1] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xc0
                                            }
                                        }
                                        [2] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xe0
                                            }
                                        }
                                        [3] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xf0
                                            }
                                        }
                                        [4] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xf8
                                            }
                                        }
                                        [5] = {
                                            Kind: TableValue
                                            [0] = {
                                                Kind: Numeric
                                                [0] = 0xfc
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
                                    [0] = 'start'
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
                    [5] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'wordLen'
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
                    [6] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'count'
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
                    [7] = {
                        Kind: WhileStatement
                        [0] = {
                            Kind: ConditionalBlock
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '~='
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'len'
                                }
                                [2] = {
                                    Kind: Identifier
                                    [0] = 'left'
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
                                                [0] = 'tmp'
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
                                                        [0] = 'byte'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'str'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'start'
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
                                                [0] = 'i'
                                            }
                                        }
                                        [1] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: UnaryOperation
                                                [0] = '#'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'arr'
                                                }
                                            }
                                        }
                                    }
                                }
                                [2] = {
                                    Kind: WhileStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'arr'
                                            }
                                            [1] = {
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
                                                        [0] = '>='
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'tmp'
                                                        }
                                                        [2] = {
                                                            Kind: Index
                                                            [0] = {
                                                                Kind: Identifier
                                                                [0] = 'arr'
                                                            }
                                                            [1] = {
                                                                Kind: Identifier
                                                                [0] = 'i'
                                                            }
                                                        }
                                                    }
                                                    [1] = {
                                                        Kind: Block
                                                        [0] = {
                                                            Kind: UNKNOWN_KIND
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
                                }
                                [3] = {
                                    Kind: AssignmentStatement
                                    [0] = {
                                        Kind: VariableList
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'wordLen'
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
                                                Kind: Identifier
                                                [0] = 'wordLen'
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
                                                [0] = 'tmpString'
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
                                                        [0] = 'sub'
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ArgumentList
                                                    [0] = {
                                                        Kind: ExpressionList
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'str'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'start'
                                                        }
                                                        [2] = {
                                                            Kind: Identifier
                                                            [0] = 'wordLen'
                                                        }
                                                    }
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
                                            [0] = 'start'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'start'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'i'
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
                                            [0] = 'left'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'left'
                                            }
                                            [2] = {
                                                Kind: Identifier
                                                [0] = 'i'
                                            }
                                        }
                                    }
                                }
                                [7] = {
                                    Kind: IfStatement
                                    [0] = {
                                        Kind: ConditionalBlock
                                        [0] = {
                                            Kind: Index
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'vocab_mapping'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'tmpString'
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
                                                            [0] = 'data'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'count'
                                                        }
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'vocab_mapping'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'tmpString'
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
                                                Kind: AssignmentStatement
                                                [0] = {
                                                    Kind: VariableList
                                                    [0] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'data'
                                                        }
                                                        [1] = {
                                                            Kind: Identifier
                                                            [0] = 'count'
                                                        }
                                                    }
                                                }
                                                [1] = {
                                                    Kind: ExpressionList
                                                    [0] = {
                                                        Kind: Index
                                                        [0] = {
                                                            Kind: Identifier
                                                            [0] = 'vocab_mapping'
                                                        }
                                                        [1] = {
                                                            Kind: String
                                                            [0] = 'UNKNOW'
                                                        }
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
                                            [0] = 'count'
                                        }
                                    }
                                    [1] = {
                                        Kind: ExpressionList
                                        [0] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'count'
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
                    [8] = {
                        Kind: ReturnStatement
                        [0] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: Identifier
                                [0] = 'data'
                            }
                        }
                    }
                }
            }
        }
        [7] = {
            Kind: FunctionDefinition
            [0] = {
                Kind: FunctionName
                [0] = {
                    Kind: Member
                    [0] = {
                        Kind: Identifier
                        [0] = 'CharSplitLMMinibatchLoader'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'text_to_tensor'
                    }
                }
            }
            [1] = {
                Kind: FunctionBody
                [0] = {
                    Kind: ParameterList
                    [0] = {
                        Kind: Identifier
                        [0] = 'in_textfile'
                    }
                    [1] = {
                        Kind: Identifier
                        [0] = 'out_vocabfile'
                    }
                    [2] = {
                        Kind: Identifier
                        [0] = 'out_tensorfile'
                    }
                    [3] = {
                        Kind: Identifier
                        [0] = 'min_freq'
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
                                    [0] = 'timer'
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
                                            [0] = 'torch'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'Timer'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                    }
                                }
                            }
                        }
                    }
                    [1] = {
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
                                    [0] = 'loading text file...'
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
                                            [0] = 'torch'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'DiskFile'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'in_textfile'
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
                                    [0] = 'rawdata'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Method
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'f'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'readString'
                                        }
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: String
                                                [0] = '*a'
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
                            Kind: Method
                            [0] = {
                                Kind: Identifier
                                [0] = 'f'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'close'
                            }
                        }
                        [1] = {
                            Kind: ArgumentList
                        }
                    }
                    [5] = {
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
                                    [0] = 'creating vocabulary mapping...'
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
                                    [0] = 'unordered'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'get_vocab'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'rawdata'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'min_freq'
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
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'ordered'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: TableConstructor
                                }
                            }
                        }
                    }
                    [8] = {
                        Kind: ForStatement
                        [0] = {
                            Kind: NameList
                            [0] = {
                                Kind: Identifier
                                [0] = 'char'
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
                                            Kind: Identifier
                                            [0] = 'unordered'
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
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'ordered'
                                        }
                                        [1] = {
                                            Kind: BinaryOperation
                                            [0] = '+'
                                            [1] = {
                                                Kind: UnaryOperation
                                                [0] = '#'
                                                [1] = {
                                                    Kind: Identifier
                                                    [0] = 'ordered'
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
                                        [0] = 'char'
                                    }
                                }
                            }
                        }
                    }
                    [9] = {
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
                                    Kind: Identifier
                                    [0] = 'ordered'
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
                                    [0] = 'vocab_mapping'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: TableConstructor
                                }
                            }
                        }
                    }
                    [11] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Identifier
                                [0] = 'count_vocab'
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
                    [12] = {
                        Kind: ForStatement
                        [0] = {
                            Kind: NameList
                            [0] = {
                                Kind: Identifier
                                [0] = 'i'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'char'
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
                                            [0] = 'ordered'
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
                                        Kind: Index
                                        [0] = {
                                            Kind: Identifier
                                            [0] = 'vocab_mapping'
                                        }
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'char'
                                        }
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'i'
                                    }
                                }
                            }
                            [1] = {
                                Kind: AssignmentStatement
                                [0] = {
                                    Kind: VariableList
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'count_vocab'
                                    }
                                }
                                [1] = {
                                    Kind: ExpressionList
                                    [0] = {
                                        Kind: BinaryOperation
                                        [0] = '+'
                                        [1] = {
                                            Kind: Identifier
                                            [0] = 'count_vocab'
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
                    [13] = {
                        Kind: AssignmentStatement
                        [0] = {
                            Kind: VariableList
                            [0] = {
                                Kind: Index
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'vocab_mapping'
                                }
                                [1] = {
                                    Kind: String
                                    [0] = 'UNKNOW'
                                }
                            }
                        }
                        [1] = {
                            Kind: ExpressionList
                            [0] = {
                                Kind: BinaryOperation
                                [0] = '+'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'count_vocab'
                                }
                                [2] = {
                                    Kind: Numeric
                                    [0] = 1
                                }
                            }
                        }
                    }
                    [14] = {
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
                                    [0] = 'putting data into tensor, it takes a lot of time...'
                                }
                            }
                        }
                    }
                    [15] = {
                        Kind: LocalStatement
                        [0] = {
                            Kind: AssignmentStatement
                            [0] = {
                                Kind: AttributeList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'data'
                                }
                            }
                            [1] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: FunctionCall
                                    [0] = {
                                        Kind: Identifier
                                        [0] = 'get_data'
                                    }
                                    [1] = {
                                        Kind: ArgumentList
                                        [0] = {
                                            Kind: ExpressionList
                                            [0] = {
                                                Kind: Identifier
                                                [0] = 'rawdata'
                                            }
                                            [1] = {
                                                Kind: Identifier
                                                [0] = 'vocab_mapping'
                                            }
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
                                        [0] = 'saving '
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'out_vocabfile'
                                    }
                                }
                            }
                        }
                    }
                    [17] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Member
                            [0] = {
                                Kind: Identifier
                                [0] = 'torch'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'save'
                            }
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'out_vocabfile'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'vocab_mapping'
                                }
                            }
                        }
                    }
                    [18] = {
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
                                        [0] = 'saving '
                                    }
                                    [2] = {
                                        Kind: Identifier
                                        [0] = 'out_tensorfile'
                                    }
                                }
                            }
                        }
                    }
                    [19] = {
                        Kind: FunctionCall
                        [0] = {
                            Kind: Member
                            [0] = {
                                Kind: Identifier
                                [0] = 'torch'
                            }
                            [1] = {
                                Kind: Identifier
                                [0] = 'save'
                            }
                        }
                        [1] = {
                            Kind: ArgumentList
                            [0] = {
                                Kind: ExpressionList
                                [0] = {
                                    Kind: Identifier
                                    [0] = 'out_tensorfile'
                                }
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'data'
                                }
                            }
                        }
                    }
                }
            }
        }
        [8] = {
            Kind: ReturnStatement
            [0] = {
                Kind: ExpressionList
                [0] = {
                    Kind: Identifier
                    [0] = 'CharSplitLMMinibatchLoader'
                }
            }
        }
    }
}