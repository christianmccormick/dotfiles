local util = require('tokyonight.util')

-- colorscheme

require('tokyonight').setup({
  style = 'night',
  on_colors = function(colors)
    vim.api.nvim_set_hl(0, 'DiffDelete', { fg = util.darken(colors.red1, 0.5), bg = colors.diff.delete })
  end
})

vim.cmd('colorscheme tokyonight')
