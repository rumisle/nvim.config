require('telescope').setup()

-- keymap
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<cr>')
