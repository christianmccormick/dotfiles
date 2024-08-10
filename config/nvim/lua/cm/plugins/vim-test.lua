local toggleterm_custom_terminals = require("cm.plugins.toggleterm.custom_terminals")

vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"

vim.g["test#custom_strategies"] = {
  clean_toggleterm = function(cmd)
    toggleterm_custom_terminals.run_vim_test(cmd)
  end,
}

vim.g["test#strategy"] = "clean_toggleterm"
