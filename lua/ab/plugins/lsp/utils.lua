local map = vim.keymap.set
local U = {}

-- lsp servers capabilities w/ nvim-cmp
function U.capabilities()
  -- The nvim-cmp almost supports LSP's capabilities so
  -- you should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require('cmp_nvim_lsp').default_capabilities(capabilities)
end

function U.has_executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end

  return false
end

function U.mappings(client, buf)
  local opts = { buffer = buf }

  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- TODO: Make rename trigger by F2
  map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- TODO: Make code action trigger by alt enter
  map('n', '<leader>.', '<cmd>CodeActionMenu<CR>', opts)
  -- map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  --

  -- formatting
  if client.server_capabilities.document_formatting then
    map('n', '<C-k>', vim.lsp.buf.formatting_sync, { desc = 'format code' })
  end

  if client.server_capabilities.document_range_formatting then
    map('x', '<C-k>', vim.lsp.buf.range_formatting, { desc = 'range format' })
  end

  require("lsp-inlayhints").on_attach(client, buf)
end

return U
