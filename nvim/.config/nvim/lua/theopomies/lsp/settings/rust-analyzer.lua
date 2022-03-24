local M = {}
M.get_opts = function(server, opts)
    return {
        tools = {
            autoSetHints = true,
            hover_with_actions = false,
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = "",
                other_hints_prefix = "",
            },
        },
        server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
            settings = {
                ["rust-analyzer"] = {
                    completion = {
                        postfix = {
                            enable = false
                        }
                    },
                    checkOnSave = {
                        command = "clippy"
                    },
                }
            }
        }),
    }
end

return M
