local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map('n', '*', '*N')

-- reload configs
map('n', '<leader>r', ':luafile $MYVIMRC<CR>')
map('n', '<leader>R', '<CMD>PackerInstall<CR>')

-- quick save
map('n', '<leader>w', ':w<CR>')

-- toggle inlay hints
map('n', '<leader>i', ":lua require('lsp-inlayhints').toggle()<CR>")

-- rebind copilot, as it conflicts with cmp about <Tab>
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<S-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
