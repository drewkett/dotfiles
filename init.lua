-- Notes
-- - Install nerd fonts manually for nice icons
-- - lsp
--   - Needs rust-analyzer installed as component
--   - ruff + pyright for python (pipx install)
-- - Formatters need to be installed manually
--   - mdformat (pipx)
--   - stylua (cargo)
-- - treesitter will install configured languages
--
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
vim.keymap.set("n", "<leader>cr", ":luafile ~/.config/nvim/init.lua<CR>", { desc = "Reload config", silent = true })
vim.keymap.set("n", "<leader>ce", ":sp ~/.config/nvim/init.lua<CR>", { desc = "Edit config", silent = true })
vim.keymap.set("n", "<leader>cE", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config in place", silent = true })
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<leader>bw", ":w<cr>", { desc = "Write file", silent = true })
vim.keymap.set("n", "<leader>l", "<c-w><right>", { desc = "right window", silent = true })
vim.keymap.set("n", "<leader>h", "<c-w><left>", { desc = "left window", silent = true })
vim.keymap.set("n", "<leader>j", "<c-w><down>", { desc = "down window", silent = true })
vim.keymap.set("n", "<leader>k", "<c-w><up>", { desc = "up window", silent = true })
vim.keymap.set("n", "<leader>wv", ":vsp<cr>", { desc = "Split vertical", silent = true })
vim.keymap.set("n", "<leader>wh", ":sp<cr>", { desc = "Split horizontal", silent = true })

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("tokyonight")
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
                build = ":TSUpdate",
                ensure_installed = { "rust", "lua", "markdown", "markdown_inline" },
                highlight = { enable = true },
            },
        },
        {
            "nvim-neorg/neorg",
            opts = {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {}, -- We added this line!
                    ["core.text-objects"] = {}, -- We added this line!
                },
            },
            ft = "norg",
            keys = {
                {
                    "<leader>nc",
                    "<cmd>Neorg toggle-concealer<cr>",
                    desc = "Neorg toggle concealer",
                },
                {
                    "<leader>nh",
                    "<Plug>(neorg.promo.demote)",
                    mode = { "n", "v" },
                    desc = "demote",
                },
                {
                    "<leader>nH",
                    "<Plug>(neorg.promo.demote.nested)",
                    mode = { "n", "v" },
                    desc = "demote (nested)",
                },
                {
                    "<leader>nl",
                    "<Plug>(neorg.promo.promote)",
                    mode = { "n", "v" },
                    desc = "Promote",
                },
                {
                    "<leader>nL",
                    "<Plug>(neorg.promo.promote.nested)",
                    mode = { "n", "v" },
                    desc = "Promote (nested",
                },
                {
                    "<leader>nj",
                    "<Plug>(neorg.text-objects.item-down)",
                    desc = "Item down",
                },
                {
                    "<leader>nk",
                    "<Plug>(neorg.text-objects.item-up)",
                    desc = "Item up",
                },
                {
                    "<leader>td",
                    "<Plug>(neorg.qol.todo-items.todo.task-done)",
                    desc = "Task Done",
                },
                {
                    "<leader>tu",
                    "<Plug>(neorg.qol.todo-items.todo.task-undone)",
                    desc = "Task Undone",
                },
                {
                    "<leader>tp",
                    "<Plug>(neorg.qol.todo-items.todo.task-pending)",
                    desc = "Task Pending",
                },
                {
                    "<leader>th",
                    "<Plug>(neorg.qol.todo-items.todo.task-on_hold)",
                    desc = "Task On Hold",
                },
                {
                    "<leader>tx",
                    "<Plug>(neorg.qol.todo-items.todo.task-cancelled)",
                    desc = "Task Cancelled",
                },
                {
                    "<leader>ti",
                    "<Plug>(neorg.qol.todo-items.todo.task-important)",
                    desc = "Task Important",
                },
                {
                    "<leader>tt",
                    "<Plug>(neorg.qol.todo-items.todo.task-cycle)",
                    desc = "Task Cycle",
                },
            },
        },
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup({})
                require("nvim-web-devicons").setup({})
                vim.g.loaded_netrw = 1
                vim.g.loaded_netrwPlugin = 1
            end,
            keys = {
                { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "File tree" },
            },
        },
        {
            "akinsho/toggleterm.nvim",
            opts = {
                persist_mode = true,
            },
            keys = {
                {
                    "<leader><leader>",
                    "<cmd>ToggleTerm<CR>",
                    mode = { "n", "t" },
                    desc = "Toggle terminal",
                },
            },
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp", -- LSP source
                "hrsh7th/cmp-buffer", -- Buffer source
                "hrsh7th/cmp-path", -- Path source
                "hrsh7th/cmp-cmdline", -- Cmdline source
                "L3MON4D3/LuaSnip", -- Snippets engine
                "saadparwaiz1/cmp_luasnip", -- Snippet completions
            },
            event = { "InsertEnter", "CmdlineEnter" },
            config = function()
                local cmp = require("cmp")

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.close(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    }),
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "buffer" },
                        { name = "path" },
                        { name = "luasnip" },
                    },
                })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            lazy = false,
            config = function()
                local lspconfig = require("lspconfig")

                lspconfig.rust_analyzer.setup({})
                lspconfig.ruff.setup({})
                lspconfig.pyright.setup({})
            end,
            keys = {
                { "<leader>ga", vim.lsp.buf.code_action, desc = "Code Action" },
                { "<leader>gc", vim.lsp.omnifunc, desc = "Omnifunc" },
                { "<leader>gd", vim.lsp.buf.definition, desc = "Jump to definition" },
                { "<leader>gD", vim.lsp.buf.declaration, desc = "Jump to declaration" },
                { "<leader>gl", vim.lsp.buf.hover, desc = "Hover" },
                { "<leader>gi", vim.lsp.buf.implementation, desc = "List implementations" },
                { "<leader>gI", vim.lsp.buf.incoming_calls, desc = "List incoming calls" },
                { "<leader>gn", vim.diagnostic.goto_next, desc = "Jump to next diagnostic" },
                { "<leader>gN", vim.diagnostic.goto_prev, desc = "Jump to previous diagnostic" },
                { "<leader>go", vim.lsp.buf.outgoing_calls, desc = "List outgoing calls" },
                { "<leader>gr", vim.lsp.buf.rename, desc = "Rename" },
                { "<leader>gR", vim.lsp.buf.references, desc = "Jump to references" },
                { "<leader>gt", vim.lsp.buf.type_definition, desc = "Jump to type definition" },
            },
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            cmd = "Telescope",
            keys = {
                { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
                { "<leader>p", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
                {
                    "<leader>fg",
                    "<cmd>Telescope live_grep<CR>",
                    desc = "Telescope live grep",
                },
                {
                    "<leader>fb",
                    "<cmd>Telescope buffers<CR>",
                    desc = "Telescope buffers",
                },
                {
                    "<leader>fh",
                    "<cmd>Telescope help_tags<CR>",
                    desc = "Telescope help tags",
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
                    python = { "ruff_format" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    markdown = { "mdformat" },
                    -- javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            },
        },
        {
            "folke/trouble.nvim",
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
        {
            "numToStr/Comment.nvim",
            keys = {
                {
                    "<leader>/",
                    "<Plug>(comment_toggle_linewise_current)",
                    desc = "Toggle Comment",
                },
                {
                    "<leader>/",
                    "<Plug>(comment_toggle_linewise_visual)",
                    mode = { "v", "x" },
                    desc = "Toggle Comment",
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
