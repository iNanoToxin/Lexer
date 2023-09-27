block = {
    statements = {
        [1]: <local_stat> = {
            declaration: <assignment_stat> = {
                lhs: <attnamelist> = {
                    value = {
                        [1]: <identifier_expr> = {
                            value = a
                        }
                    }
                }
                rhs: <explist> = {
                    value = {
                        [1]: <binary_operator_expr> = {
                            binary_operator = '+'
                            lhs: <binary_operator_expr> = {
                                binary_operator = '-'
                                lhs: <binary_operator_expr> = {
                                    binary_operator = '^'
                                    lhs: <numeric_literal_expr> = {
                                        value = 2
                                    }
                                    rhs: <numeric_literal_expr> = {
                                        value = 32
                                    }
                                }
                                rhs: <numeric_literal_expr> = {
                                    value = 1
                                }
                            }
                            rhs: <functiondef_anon> = {
                                body: <funcbody> = {
                                    parameters = nullptr
                                    block = nullptr
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
