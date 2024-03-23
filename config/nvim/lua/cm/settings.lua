-- faster updates (i.e. for CursorHold autocmds)
vim.o.updatetime = 1000

-- sign column
vim.o.signcolumn = 'yes:1'

-- line numbers
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true

-- indentation guides
vim.opt.list = true

-- hide mode since lualine already provides it
vim.o.showmode = false

-- use icons in sign gutter
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

-- make diffs look better
vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'

-- diagnostics
vim.diagnostic.config {
  virtual_text = false,
  signs = {
    priority = 10
  }
}

-- fold column
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 -- Using ufo provider needs a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- settings required to use cmp-spell
vim.opt.spelllang = { 'en_us' }

-- set shell
-- vim.o.shell = '/bin/zsh -i'
