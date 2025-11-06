local lsp = vim.lsp
local U = require("ab.plugins.lsp.utils")

-- native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = "always",
  },
  float = {
    source = "always",
  },
})

vim.lsp.enable({
    "lua_ls", -- lua-language-server
    "rust_analyzer", -- rust_analyzer
    "clangd", -- clangd
    "cmake", -- cmake-language-server
    "ruff", -- ruff
    "pyright", -- pyright
    "zls", -- zls
    "nixd", -- nixd
    "tsserver", -- tsserver
    "tailwindcss", -- tailwindcss-language-server
    "astro", -- astro-ls
    "mojo", -- mojo-lsp-server
    "glsl_analyzer", -- glsl_analyzer
})


local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

