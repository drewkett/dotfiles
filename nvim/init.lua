require("config.lazy")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rr", ":luafile ~/.config/nvim/init.lua<CR>", { silent = true })
vim.keymap.set("n", "<leader>re", ":sp ~/.config/nvim/init.lua<CR>", { silent = true })

vim.keymap.set("n", "<leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ld", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lI", "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ll", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", { silent = true })
vim.keymap.set("n", "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { silent = true })
vim.keymap.set("n", "<leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lR", "<Cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
