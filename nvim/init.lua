-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>cr", ":luafile ~/.config/nvim/init.lua<CR>", { silent = true })
vim.keymap.set("n", "<leader>ce", ":sp ~/.config/nvim/init.lua<CR>", { silent = true })

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "neovim/nvim-lspconfig",
            lazy = false,
            config = function()
                local lspconfig = require("lspconfig")

                lspconfig.rust_analyzer.setup({})
            end,
            keys = {
                { "<leader>ld", vim.lsp.buf.definition, { desc = "Jump to definition" } },
                { "<leader>lD", vim.lsp.buf.declaration, { desc = "Jump to declaration" } },
                { "<leader>ll", vim.lsp.buf.hover, { desc = "Hover" } },
                { "<leader>li", vim.lsp.buf.implementation, { desc = "List implementations" } },
                { "<leader>lI", vim.lsp.buf.incoming_calls, { desc = "List incoming calls" } },
                { "<leader>ln", vim.diagnostic.goto_next, { desc = "Jump to next diagnostic" } },
                { "<leader>lN", vim.diagnostic.goto_prev, { desc = "Jump to previous diagnostic" } },
                { "<leader>lo", vim.lsp.buf.outgoing_calls, { desc = "List outgoing calls" } },
                { "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" } },
                { "<leader>lR", vim.lsp.buf.references, { desc = "Jump to references" } },
                { "<leader>lt", vim.lsp.buf.type_definition, { desc = "Jump to type definition" } },
            },
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            cmd = "Telescope",
            keys = {
                { "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" } },
                {
                    "<leader>fg",
                    "<cmd>Telescope live_grep<CR>",
                    { desc = "Telescope live grep" },
                },
                {
                    "<leader>fb",
                    "<cmd>Telescope buffers<CR>",
                    { desc = "Telescope buffers" },
                },
                {
                    "<leader>fh",
                    "<cmd>Telescope help_tags<CR>",
                    { desc = "Telescope help tags" },
                },
            },
        },
        {
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
        },
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
            keys = {
                {
                    "<leader>xx",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Diagnostics (Trouble)",
                },
                {
                    "<leader>xX",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
                {
                    "<leader>cs",
                    "<cmd>Trouble symbols toggle focus=false<cr>",
                    desc = "Symbols (Trouble)",
                },
                {
                    "<leader>cl",
                    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                    desc = "LSP Definitions / references / ... (Trouble)",
                },
                {
                    "<leader>xL",
                    "<cmd>Trouble loclist toggle<cr>",
                    desc = "Location List (Trouble)",
                },
                {
                    "<leader>xQ",
                    "<cmd>Trouble qflist toggle<cr>",
                    desc = "Quickfix List (Trouble)",
                },
            },
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
