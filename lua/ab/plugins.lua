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
    { 'sgur/vim-textobj-parameter', dependencies = { 'kana/vim-textobj-user' } },

    -- languages
    {
      'ziglang/zig.vim',
      config = function()
        vim.g.zig_fmt_parse_errors = false
        vim.g.zig_fmt_autosave = false
      end
    },

    -- misc
    'andymass/vim-matchup',
    -- 'tpope/vim-endwise',
    -- 'rstacruz/vim-closer', -- buggy, deprecated
    {
      "windwp/nvim-autopairs",
       config = function()
         require("nvim-autopairs").setup {}
       end
    },

    {
        'norcalli/nvim-colorizer.lua',
        -- event = 'CursorHold',
        config = function()
            require('colorizer').setup()
        end,
    },

    -- fancy
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
      config = function()
        require('ab.plugins.lualine')
      end
    },

    -- navigation and fuzzy search
    -- TODO: update tag.
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('ab.plugins.telescope')
      end
    },

    -- TODO: consider removing as i rarely use it
    {
      'phaazon/hop.nvim',
      config = function()
        require('hop').setup()
        vim.keymap.set('n', 'F', '<cmd>HopWord<cr>')
      end
    },

    -- editing
    {
      'numToStr/Comment.nvim',
      event = 'BufRead',
      config = function()
        require('Comment').setup()
      end,
    },

    {
      'AndrewRadev/splitjoin.vim',
      -- NOTE: splitjoin won't work with `BufRead` event
      event = 'CursorHold',
    },

    'wellle/context.vim',

    'github/copilot.vim',

    -- lsp
    'hrsh7th/cmp-nvim-lsp',

    {
      "lvimuser/lsp-inlayhints.nvim",
      config = function()
        require("lsp-inlayhints").setup()
        -- require("lsp-inlayhints").on_attach(client, bufnr)
      end,
    },

    {
      'neovim/nvim-lspconfig',
      -- event = 'BufRead',
      config = function()
        require('ab.plugins.lsp.servers')
      end,
      -- after = 'cmp-nvim-lsp',
    },

    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
          require('ab.plugins.lsp.nvim-cmp')
      end,
    },

    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },

    {
      'jose-elias-alvarez/null-ls.nvim',
      event = 'BufRead',
      config = function()
        require('ab.plugins.lsp.null-ls')
      end,
    },

    {
      'kosayoda/nvim-lightbulb',
      dependencies = { 'antoinemadec/FixCursorHold.nvim' },
      config = function()
        require('nvim-lightbulb').setup({autocmd = {enabled = true}})
      end
    },

    {
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
    },

    -- color themes
    'savq/melange',
    'p00f/alabaster.nvim',

})
