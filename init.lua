require("config.lazy")

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>rr', ':luafile ~/.config/nvim/init.lua<CR>', {silent=true})
vim.keymap.set('n', '<leader>re', ':sp ~/.config/nvim/init.lua<CR>', {silent=true})
vim.keymap.set('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next()<cr>', {silent=true})
vim.keymap.set('n', '<leader>lN', '<cmd>lua vim.diagnostic.goto_prev()<cr>', {silent=true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

 
