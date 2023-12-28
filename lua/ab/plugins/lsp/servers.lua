local lsp = require('lspconfig')
local U = require('ab.plugins.lsp.utils')

local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

local capabilities = U.capabilities()

local function on_attach(client, buf)
  U.mappings(client, buf)
end

-- native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = 'always',
  },
  float = {
    source = 'always',
  },
})

-- language servers
if U.has_executable('lua-language-server') then
  lsp.lua_ls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        completion = {
          enable = true,
          showWord = 'Disable',
        },
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = { os.getenv('VIMRUNTIME') }
        },
        telemetry = {
          enable = false,
        }
      }
    }
  })
else
  vim.notify("lua-language-server not found in path!", vim.log.levels.WARN, { title = "nvim-config" })
end

if U.has_executable('rust-analyzer') then
  lsp.rust_analyzer.setup({
      flags = flags,
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
            },
            procMacro = {
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
        },
      },
  })
else
  vim.notify("rust-analyzer not found in path!", vim.log.levels.WARN, { title = "nvim-config" })
end

if U.has_executable("clangd") then
  lsp.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "cc" },
    flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 500,
    },
  }
else
  vim.notify("clangd not found in path!", vim.log.levels.WARN, { title = "nvim-config" })
end

if U.has_executable("cmake-language-server") then
  lsp.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  }
else
  vim.notify("camke-language-server not found in path!", vim.log.levels.WARN, { title = "nvim-config" })
end

if U.has_executable("ruff-lsp") then
  lsp.ruff_lsp.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      settings = {
        args = {},
      }
    }
  }
else
  vim.notify("ruff-lsp not found in path.", vim.log.levels.WARN, { title = "nvim-config" })
end

if U.has_executable("zls") then
  lsp.zls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  }
else
  vim.notify("zls not found in path!", vim.log.levels.WARN, { title = "nvim-config" })
end
