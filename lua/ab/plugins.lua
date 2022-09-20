-- automatically run :PackerCompile whenever
-- plugins.lua is updated with an autocommand
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
  function(use)
    -- package manager
    use('wbthomason/packer.nvim')

    -- prereq for telescope
    use('nvim-lua/plenary.nvim')

    -- text objects
    use('kana/vim-textobj-user') -- prereq
    use { 'sgur/vim-textobj-parameter', after = 'vim-textobj-user' }

    -- misc
    use('andymass/vim-matchup')
    use('tpope/vim-endwise')
    use('rstacruz/vim-closer')
    use({
        'norcalli/nvim-colorizer.lua',
        -- event = 'CursorHold',
        config = function()
            require('colorizer').setup()
        end,
    })

    -- fancy
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('ab.plugins.lualine')
      end
    }

    -- navigation and fuzzy search
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      config = function()
        require('ab.plugins.telescope')
      end
    }

    use {
      'phaazon/hop.nvim',
      config = function()
        require('hop').setup()
        vim.keymap.set('n', 'F', '<cmd>HopWord<cr>')
      end
    }

    -- editing
    use({
      'numToStr/Comment.nvim',
      event = 'BufRead',
      config = function()
        require('Comment').setup()
      end,
    })

    use({
      'AndrewRadev/splitjoin.vim',
      -- NOTE: splitjoin won't work with `BufRead` event
      event = 'CursorHold',
    })

    use('wellle/context.vim')

    -- lsp
    use { 'hrsh7th/cmp-nvim-lsp' }

    use {
      'neovim/nvim-lspconfig',
      -- event = 'BufRead',
      config = function()
        require('ab.plugins.lsp.servers')
      end,
      after = 'cmp-nvim-lsp',
    }

    use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
          require('ab.plugins.lsp.nvim-cmp')
      end,
    }

    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      event = 'BufRead',
      config = function()
        require('ab.plugins.lsp.null-ls')
      end,
    }

    use {
      'kosayoda/nvim-lightbulb',
      requires = 'antoinemadec/FixCursorHold.nvim',
      config = function()
        require('nvim-lightbulb').setup({autocmd = {enabled = true}})
      end
    }

    use {
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
    }

    -- color themes
    use('savq/melange')
    use('p00f/alabaster_dark.nvim')

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
