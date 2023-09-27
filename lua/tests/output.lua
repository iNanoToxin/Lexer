block = {
    statements = {
        [1]: <assignment_stat> = {
            lhs: <varlist> = {
                value = {
                    [1]: <index_expr> = {
                        root: <member_expr> = {
                            root: <identifier_expr> = {
                                value = a
                            }
                            index: <identifier_expr> = {
                                value = x
                            }
                        }
                        index: <string_expr> = {
                            value = "B"
                        }
                    }
                }
            }
            rhs: <explist> = {
                value = {
                    [1]: <numeric_literal_expr> = {
                        value = 2
                    }
                }
            }
        }
    }
}
