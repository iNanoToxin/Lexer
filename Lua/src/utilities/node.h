#pragma once
#include "ast/node_headers.h"

namespace Node
{
    bool perform_binary_op(
        std::shared_ptr<AstNode>& p_Result,
        const std::shared_ptr<AstNode>& p_Lhs,
        double (*p_Operation)(double, double),
        const std::shared_ptr<AstNode>& p_Rhs,
        bool p_ForceDouble = false
    );

    bool perform_comparison(
        std::shared_ptr<AstNode>& p_Result,
        const std::shared_ptr<AstNode>& p_Lhs,
        bool (*p_Operation)(double, double),
        const std::shared_ptr<AstNode>& p_Rhs
    );

    bool perform_concatenation(
        std::shared_ptr<AstNode>& p_Result,
        const std::shared_ptr<AstNode>& p_Lhs,
        const std::shared_ptr<AstNode>& p_Rhs
    );

    void merge_blocks(
        const std::shared_ptr<AstNode>& p_BlockA,
        const std::shared_ptr<AstNode>& p_BlockB,
        const std::shared_ptr<AstNode>& p_Node
    );

    std::vector<std::shared_ptr<AstNode>> get_variable_list(const std::shared_ptr<AstNode>& p_Node);
    bool remove_assignment(const std::shared_ptr<AstNode>& p_Node);
    bool is_allowed_comparison(const std::shared_ptr<AstNode>& p_Node);
    bool convert_to_bool(bool* p_Bool, const std::shared_ptr<AstNode>& p_Node);

    bool is_in_scope(const std::shared_ptr<AstNode>& p_NodeA, const std::shared_ptr<AstNode>& p_NodeB);

    void print_path(const std::shared_ptr<AstNode>& p_Node);
}
