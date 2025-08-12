local map = vim.keymap.set
local U = {}

-- lsp servers capabilities w/ nvim-cmp
function U.capabilities()
  -- The nvim-cmp almost supports LSP's capabilities so
  -- you should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

function U.has_executable(name)
  return vim.fn.executable(name) > 0
end

function U.mappings(client, buf)
  local opts = { noremap = true, silent = true, buffer = buf }

  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gh", vim.lsp.buf.hover, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gR", vim.lsp.buf.references, opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  -- map('n', '<leader>wa', lsp.buf.add_workspace_folder, opts)
  -- map('n', '<leader>wr', lsp.buf.remove_workspace_folder, opts)
  -- map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  map('n', 'gr', vim.lsp.buf.rename, opts)
  map("n", "<leader>.", "<cmd>CodeActionMenu<CR>", opts)
  -- map('v', '<leader>ca', vim.lsp.buf.range_code_action, opts)
  map("n", "<leader>e", vim.diagnostic.open_float, opts)
  map("n", "[g", vim.diagnostic.goto_prev, opts)
  map("n", "]g", vim.diagnostic.goto_next, opts)
  -- map('n', '<leader>q', vim.diagnostic.setloclist, opts)
  -- map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    map("n", "<C-k>", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "format code" })
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    map("x", "<C-k>", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "range format" })
  end
end

return U
