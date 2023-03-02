vim.g['test#custom_strategies'] = {
  clean_toggleterm = function(cmd)
    local Terminal = require('toggleterm.terminal').Terminal

    Terminal:new({
      cmd = cmd,
      close_on_exit = false,
      direction = 'float'
    }):toggle()
  end,
}

vim.g['test#strategy'] = 'clean_toggleterm'
