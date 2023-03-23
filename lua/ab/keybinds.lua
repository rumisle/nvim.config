local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map('n', '*', '*N')

-- reload configs
map('n', '<leader>r', ':luafile $MYVIMRC<CR>')
map('n', '<leader>R', '<CMD>PackerInstall<CR>')

-- toggle inlay hints
map('n', '<leader>i', ":lua require('lsp-inlayhints').toggle()<CR>")

-- rebind copilot to <C-J>
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
