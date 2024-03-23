local colorscheme_palette = require('nightfox.palette').load("nightfox")

require('lualine').setup {
  options = {
    tab_seperators = ''
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'branch' },
    lualine_c = {
      'diff',
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' },
      }
    },
  },
  inactive_sections = {
    lualine_c = {}
  },
  tabline = {
    lualine_a = { { 'tabs', mode = 2, max_length = vim.o.columns } }
  },
  winbar = {
    lualine_a = {
      {
        'filename',
        path = 1,
        color = {
          fg = colorscheme_palette.fg3,
          bg = colorscheme_palette.bg0
        }
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
