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
                        [0] = 'x'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = '*'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '*'
                            [1] = {
                                Kind: Numeric
                            }
                            [2] = {
                                Kind: Numeric
                            }
                        }
                        [2] = {
                            Kind: UnaryOperation
                            [0] = '-'
                            [1] = {
                                Kind: Numeric
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
                        [0] = 'y'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: BinaryOperation
                        [0] = '*'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '*'
                            [1] = {
                                Kind: BinaryOperation
                                [0] = '/'
                                [1] = {
                                    Kind: Identifier
                                    [0] = 'c'
                                }
                                [2] = {
                                    Kind: Numeric
                                }
                            }
                            [2] = {
                                Kind: UnaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: Numeric
                                }
                            }
                        }
                        [2] = {
                            Kind: BinaryOperation
                            [0] = '*'
                            [1] = {
                                Kind: UnaryOperation
                                [0] = '-'
                                [1] = {
                                    Kind: Numeric
                                }
                            }
                            [2] = {
                                Kind: Identifier
                                [0] = 'a'
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
                        [0] = 'z'
                    }
                }
                [1] = {
                    Kind: ExpressionList
                    [0] = {
                        Kind: UnaryOperation
                        [0] = '-'
                        [1] = {
                            Kind: BinaryOperation
                            [0] = '+'
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
        [3] = {
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
                        Kind: UnaryOperation
                        [0] = '#'
                        [1] = {
                            Kind: UnaryOperation
                            [0] = '-'
                            [1] = {
                                Kind: Numeric
                            }
                        }
                    }
                }
            }
        }
    }
}