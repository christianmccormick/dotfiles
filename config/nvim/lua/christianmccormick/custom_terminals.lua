local Terminal = require('toggleterm.terminal').Terminal

local custom_terminals = {}

-- rails console

local rails_console = Terminal:new({
  cmd = 'bin/rails console',
  close_on_exit = false,
  hidden = true
})

function custom_terminals.toggle_rails_console()
  rails_console:toggle()
end

return custom_terminals
