local colors = {
  blue = "#80a0ff",
  cyan = "#79dac8",
  black = "#080808",
  white = "#c6c6c6",
  red = "#ff5189",
  violet = "#d183e8",
  grey = "#303030",
  orange = "#ffbc5d",
  none = nil,
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.orange },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.violet, bg = colors.none },
    -- b = { fg = colors.black, bg = colors.none },
    -- c = { fg = colors.violet, bg = colors.none },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.none },
    b = { fg = colors.white, bg = colors.none },
    c = { fg = colors.black, bg = colors.none },
  },
}

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = bubbles_theme,
    component_separators = "|",
    -- section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      -- { "mode", separator = { left = "" }, right_padding = 2 },
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { "filename", "branch" },
    lualine_c = { "fileformat" },
    lualine_x = {},
    lualine_y = { "filetype", "progress" },
    lualine_z = {
      -- { "location", separator = { right = "" }, left_padding = 2 },
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
})

