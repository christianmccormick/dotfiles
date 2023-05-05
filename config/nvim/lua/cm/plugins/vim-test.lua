vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'

vim.g['test#custom_strategies'] = {
  clean_toggleterm = function(cmd)
    local Terminal = require('toggleterm.terminal').Terminal

    Terminal:new({
      cmd = cmd,
      close_on_exit = false,
      direction = 'float',
      highlights = {
        NormalFloat = {
          guibg = '#1a1b26'
        },
        FloatBorder = {
          guifg = '#3b4261',
          guibg = '#1a1b26'
        }
      },
    }):toggle()
  end,
}

vim.g['test#strategy'] = 'clean_toggleterm'
