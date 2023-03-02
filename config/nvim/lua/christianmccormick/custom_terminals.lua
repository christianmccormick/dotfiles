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

-- bundle install

local bundle_install = Terminal:new({
  cmd = 'bundle install',
  close_on_exit = false
})

function custom_terminals.run_bundle_install()
  bundle_install:toggle()
end

return custom_terminals
