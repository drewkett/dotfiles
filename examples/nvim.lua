local rust_analyzer_settings = {
    ["rust-analyzer"] = {
        cargo = {
            features = { "bar" },
        },
    },
}

require("lspconfig").rust_analyzer.setup({
    settings = rust_analyzer_settings,
    -- Merge with any existing config
    on_init = function(client)
        client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, rust_analyzer_settings)
    end,
})

