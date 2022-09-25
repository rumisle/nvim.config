local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map('n', '*', '*N')

-- reload configs
map('n', '<leader>r', ':luafile $MYVIMRC<CR>')
map('n', '<leader>R', '<CMD>PackerInstall<CR>')

-- toggle inlay hints
map('n', '<leader>i', ":lua require('lsp-inlayhints').toggle()<CR>")
