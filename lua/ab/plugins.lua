-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- text objects
  { "sgur/vim-textobj-parameter", dependencies = { "kana/vim-textobj-user" } },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          ensure_installed = {
            "asm",
            "astro",
            "bash",
            "c",
            "cmake",
            "cpp",
            "css",
            "csv",
            "cuda",
            "dart",
            "diff",
            "disassembly",
            "dockerfile",
            "dot",
            "elixir",
            "elm",
            "erlang",
            "fish",
            "fortran",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "gleam",
            "glsl",
            "gnuplot",
            "go",
            "gomod",
            "gosum",
            "graphql",
            "haskell",
            "hlsl",
            "html",
            "htmldjango",
            "ini",
            "ispc",
            "java",
            "javascript",
            "jq",
            "json",
            "just",
            "kotlin",
            "latex",
            "linkerscript",
            "llvm",
            "lua",
            "make",
            "markdown",
            "meson",
            "mlir",
            "nasm",
            "nginx",
            "ninja",
            "nix",
            "nu",
            "objc",
            "objdump",
            "ocaml",
            "passwd",
            "php",
            "powershell",
            "python",
            "regex",
            "rst",
            "ruby",
            "rust",
            "scss",
            "sql",
            "ssh_config",
            "strace",
            "svelte",
            "swift",
            "tablegen",
            "tmux",
            "typescript",
            "typst",
            "verilog",
            "vue",
            "xml",
            "yaml",
            "zig",
          },
          auto_install = true,
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })

      vim.filetype.add({
        extension = {
          vert = "glsl",
          tesc = "glsl",
          tese = "glsl",
          frag = "glsl",
          geom = "glsl",
          comp = "glsl",

          ll = "llvm",

          mlir = "mlir",
        },
      })
    end,
  },

  -- languages
  {
    "ziglang/zig.vim",
    config = function()
      vim.g.zig_fmt_parse_errors = false
      vim.g.zig_fmt_autosave = false
    end,
  },

  "czheo/mojo.vim",

  -- misc
  "andymass/vim-matchup",
  -- 'tpope/vim-endwise',
  -- 'rstacruz/vim-closer', -- buggy, deprecated
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "lambdalisue/suda.vim",
    init = function()
      -- suda automatically switch a buffer name
      -- when the target file is not readable or writable
      vim.g.suda_smart_edit = 1
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    -- event = 'CursorHold',
    config = function()
      require("colorizer").setup()
    end,
  },

  -- fancy
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
    config = function()
      require("ab.plugins.lualine")
    end,
  },

  -- navigation and fuzzy search
  -- TODO: update tag.
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("ab.plugins.telescope")
    end,
  },

  -- TODO: consider removing as i rarely use it
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
      vim.keymap.set("n", "F", "<cmd>HopWord<cr>")
    end,
  },

  -- editing
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  {
    "AndrewRadev/splitjoin.vim",
    -- NOTE: splitjoin won't work with `BufRead` event
    event = "CursorHold",
  },

  "wellle/context.vim",

  -- "github/copilot.vim",

  -- lsp
  "hrsh7th/cmp-nvim-lsp",

  {
    "neovim/nvim-lspconfig",
    -- event = 'BufRead',
    opts = {
      inlay_hints = {
        enable = true
      },
    },
    config = function()
      require("ab.plugins.lsp.servers")
    end,
    -- after = 'cmp-nvim-lsp',
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("ab.plugins.lsp.nvim-cmp")
    end,
  },

  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },

  {
    "nvimtools/none-ls.nvim",
    event = "BufRead",
    config = function()
      require("ab.plugins.lsp.null-ls")
    end,
  },

  {
    "kosayoda/nvim-lightbulb",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
    config = function()
      require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
    end,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },

  -- color themes
  "savq/melange",
  "p00f/alabaster.nvim",
})
