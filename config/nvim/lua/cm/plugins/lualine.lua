local colors = require('tokyonight.colors').setup({ transform = true })

local custom_tokyonight = require 'lualine.themes.tokyonight'

custom_tokyonight.normal.b.bg = ''
custom_tokyonight.insert.b.bg = ''
custom_tokyonight.visual.b.bg = ''
custom_tokyonight.replace.b.bg = ''
custom_tokyonight.command.b.bg = ''
custom_tokyonight.inactive.b.bg = ''

custom_tokyonight.normal.c.bg = ''
custom_tokyonight.inactive.c.bg = ''

require('lualine').setup {
  options = {
    theme = custom_tokyonight,
    -- section_separators = { left = '\\uE0B4', right = '◖' },
    -- component_separators = { left = '◖', right = '◗' },
    -- section_separators = { left = '◗', right = '◖' }
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = { 'filetype' }
  },
  inactive_sections = {
    lualine_c = {}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 2,
        max_length = vim.o.columns,
        tabs_color = { inactive = 'lualine_b_normal' },
        -- fmt = function(name, context)
        --   return '◖' .. name .. '◗'
        -- end
      }
    }
  },
  winbar = {
    lualine_a = {
      {
        'filename',
        path = 1,
        color = { bg = '', fg = colors.comment }
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {
      {
        'filename',
        path = 1,
        color = { bg = '', fg = colors.comment }
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {
    'fugitive',
    'nvim-tree',
    'quickfix'
  }
}
