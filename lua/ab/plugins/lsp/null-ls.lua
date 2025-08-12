local nls = require("null-ls")
local U = require("ab.plugins.lsp.utils")

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

-- Configuring null-ls
nls.setup({
  sources = {
    ----------------
    -- FORMATTING --
    ----------------
    -- fmt.rustfmt,
    fmt.stylua.with({
      extra_args = { "--indent-type", "Spaces", "--indent-width", 2 },
    }),
    -- fmt.gofmt,
    -- fmt.zigfmt,
    fmt.shfmt.with({
      extra_args = { "-i", 4, "-ci", "-sr" },
    }),
    fmt.prettierd.with({
      filetypes = {
        "javascript",
        "typescript",
        "json",
        "yaml",
        "html",
        "css",
        "scss",
        "markdown",
        "javascriptreact",
        "typescriptreact",
      },
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
    -- cda.shellcheck, -- (use bashls / available in gbprod/none-ls-shellcheck.nvim)
    -----------------
    -- COMPLETIONS --
    -----------------
  },
  on_attach = function(client, bufnr)
    U.mappings(client, bufnr)
  end,
})
