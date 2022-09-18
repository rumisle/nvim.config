local nls = require('null-ls')
local U = require('ab.plugins.lsp.utils')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

-- Configuring null-ls
nls.setup({
  sources = {
    ----------------
    -- FORMATTING --
    ----------------
    fmt.trim_whitespace.with({
      filetypes = { 'text', 'zsh', 'toml', 'make', 'conf', 'tmux' },
    }),
    -- fmt.rustfmt,
    fmt.stylua,
    -- fmt.gofmt,
    -- fmt.zigfmt,
    fmt.shfmt.with({
      extra_args = { '-i', 4, '-ci', '-sr' },
    }),
    -----------------
    -- DIAGNOSTICS --
    -----------------
    dgn.shellcheck,
    -- dgn.luacheck.with({
    --   extra_args = { '--globals', 'vim', '--std', 'luajit' },
    -- }),
    ------------------
    -- CODE ACTIONS --
    ------------------
    cda.shellcheck,
    -----------------
    -- COMPLETIONS --
    -----------------
  },
  on_attach = function(client, bufnr)
    U.mappings(client, bufnr)
  end,
})
