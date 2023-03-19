local Terminal = require('toggleterm.terminal').Terminal

local custom_terminals = {}

-- floating terminal

local floating_terminal = Terminal:new({
  direction = 'float',
  float_opts = {
    border = 'curved'
  },
  highlights = {
    NormalFloat = {
      guibg = '#1a1b26'
    },
    FloatBorder = {
      guifg = '#3b4261',
      guibg = '#1a1b26'
    }
  },
  hidden = true
})

function custom_terminals.toggle_floating_terminal()
  floating_terminal:toggle()
end

-- rails console

local rails_console = Terminal:new({
  cmd = 'bin/rails console',
  close_on_exit = false,
  direction = 'float',
  float_opts = {
    border = 'curved'
  },
  highlights = {
    NormalFloat = {
      guibg = '#1a1b26'
    },
    FloatBorder = {
      guifg = '#3b4261',
      guibg = '#1a1b26'
    }
  },
  hidden = true
})

function custom_terminals.toggle_rails_console()
  rails_console:toggle()
end

-- bundle install

local bundle_install = Terminal:new({
  cmd = 'bundle install',
  close_on_exit = false,
  direction = 'float',
  float_opts = {
    border = 'curved'
  },
  highlights = {
    NormalFloat = {
      guibg = '#1a1b26'
    },
    FloatBorder = {
      guifg = '#3b4261',
      guibg = '#1a1b26'
    }
  },
})

function custom_terminals.run_bundle_install()
  bundle_install:toggle()
end

return custom_terminals
