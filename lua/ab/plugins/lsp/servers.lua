local lsp = require("lspconfig")
local U = require("ab.plugins.lsp.utils")

local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

local capabilities = U.capabilities()

local function on_attach(client, buf)
  if client.name == "ruff_lsp" then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
  U.mappings(client, buf)
end

-- native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = "always",
  },
  float = {
    source = "always",
  },
})

-- language servers
if U.has_executable("lua-language-server") then
  lsp.lua_ls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        completion = {
          enable = true,
          showWord = "Disable",
        },
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = { os.getenv("VIMRUNTIME") },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })
end

if U.has_executable("rust-analyzer") then
  lsp.rust_analyzer.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
        },
        procMacro = {
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  })
end

if U.has_executable("clangd") then
  lsp.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "cc" },
    flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 500,
    },
  })
end

if U.has_executable("cmake-language-server") then
  lsp.cmake.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("ruff-lsp") then
  lsp.ruff_lsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      settings = {
        args = {},
      },
    },
  })
end

if U.has_executable("pyright") then
  lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  })
end

if U.has_executable("zls") then
  lsp.zls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("nixd") then
  lsp.nixd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("tsserver") then
  lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("tailwindcss-language-server") then
  lsp.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("astro-ls") then
  lsp.astro.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("mojo-lsp-server") then
  lsp.mojo.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end

if U.has_executable("glsl_analyzer") then
  lsp.glsl_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  })
end
