local Terminal = require("toggleterm.terminal").Terminal

local custom_terminals = {}

local border_highlight = vim.api.nvim_get_hl(0, { name = "TelescopeBorder" })
local highlights = {
  NormalFloat = {
    guibg = "",
  },
  FloatBorder = {
    guifg = border_highlight.fg,
  },
}

-- floating terminal

local floating_terminal = Terminal:new({
  direction = "float",
  float_opts = {
    border = "curved",
  },
  highlights = highlights,
  hidden = true,
})

function custom_terminals.toggle_floating_terminal()
  floating_terminal:toggle()
end

-- rails console

local rails_console = Terminal:new({
  cmd = "bin/rails console",
  close_on_exit = false,
  direction = "float",
  float_opts = {
    border = "curved",
  },
  highlights = highlights,
  hidden = true,
})

function custom_terminals.toggle_rails_console()
  rails_console:toggle()
end

-- bundle install

local bundle_install = Terminal:new({
  cmd = "bundle install",
  close_on_exit = false,
  direction = "float",
  float_opts = {
    border = "curved",
  },
  highlights = highlights,
})

function custom_terminals.run_bundle_install()
  bundle_install:toggle()
end

-- vim-test

function custom_terminals.run_vim_test(cmd)
  Terminal:new({
    cmd = cmd,
    close_on_exit = false,
    direction = "float",
    float_opts = {
      border = "curved",
    },
    highlights = highlights,
  }):toggle()
end

return custom_terminals
