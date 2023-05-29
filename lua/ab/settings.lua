local g = vim.g
local o = vim.o

o.termguicolors = true

-- indent width
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true -- TODO: disable for Makefile

-- basic editor settings
o.number = true
o.smartcase = true
o.ignorecase = true
o.hlsearch = true
o.incsearch = true
o.mouse = "a"
o.cursorline = true
-- o.cmdheight = 0

-- disable carzy error and warning hint
o.signcolumn = "no"
-- TODO: Find a way to cycle through errors/warnings

-- undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- remember 50 items in command history
o.history = 50

-- set space as leader
g.mapleader = ' '
g.maplocalleader = ' '

-- color themes
-- vim.highlight.create("Pmenu", { guibg = "None", guifg = "None" }, false)
o.termguicolors = true
vim.cmd("colorscheme lunaperche")

-- transparent backgruond
-- vim.highlight.create("Normal", { guibg = "None", guifg = "None" }, false)
vim.api.nvim_set_hl(0, "Normal", { bg = "None", fg = "None" })
