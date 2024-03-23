require('lualine').setup {
  options = {
    tab_seperators = ''
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' },
      }
    },
    lualine_c = {}
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
