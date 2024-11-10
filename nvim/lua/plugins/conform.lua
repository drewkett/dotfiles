return {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters = {
            stylua = {
                command = "stylua",
                prepend_args = { "--indent-type", "Spaces" },
            },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            -- python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    },
}
