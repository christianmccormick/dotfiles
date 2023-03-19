local telescope = require('telescope.builtin')
local telescope_custom_pickers = require('cm.plugins.telescope.custom_pickers')
local toggleterm_custom_terminals = require('cm.plugins.toggleterm.custom_terminals')

vim.g.mapleader = ' '

-- config
vim.keymap.set('n', '<leader>vc', ':tabedit $MYVIMRC<CR>', {})
vim.keymap.set('n', '<leader>vv', ':luafile $MYVIMRC<CR>', {})

-- navigation
vim.keymap.set('n', '<leader>qq', ':q!<CR>', {})
vim.keymap.set('n', '<leader>qa', ':qa!<CR>', {})
vim.keymap.set('n', '<leader>ww', ':w<CR>', {})
vim.keymap.set('n', '<leader>wq', ':wq<CR>', {})
vim.keymap.set('n', '<leader>h', '<C-W>h', {})
vim.keymap.set('n', '<leader>j', '<C-W>j', {})
vim.keymap.set('n', '<leader>k', '<C-W>k', {})
vim.keymap.set('n', '<leader>l', '<C-W>l', {})
vim.keymap.set('n', '<leader>H', '<C-W>H', {})
vim.keymap.set('n', '<leader>J', '<C-W>J', {})
vim.keymap.set('n', '<leader>K', '<C-W>K', {})
vim.keymap.set('n', '<leader>L', '<C-W>L', {})

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fl', telescope_custom_pickers.live_grep, {})
vim.keymap.set('n', '<leader>fw', telescope.grep_string, {})
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ":lua require'telescope'.extensions.project.project{}<CR>",
  {}
)
vim.keymap.set('n', '<leader>fr', telescope.resume, {})

vim.keymap.set('n', '<leader>tr', ':NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<leader>tn', ':LualineRenameTab ', {})
vim.keymap.set('n', '<leader>xx', ':copen<CR>', {})

-- diagnostics
vim.keymap.set('n', '<leader>dd', ':lua vim.diagnostic.open_float()<CR>')

-- editing
vim.keymap.set('n', '<leader>y', '"+y', {})
vim.keymap.set('v', '<leader>y', '"+y', {})

-- testing
vim.keymap.set('n', '<leader>T', ':TestNearest<CR>', {})
vim.keymap.set('n', '<leader>t', ':TestFile<CR>', {})
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', {})

-- terminal/toggleterm
vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-N>', {})
vim.keymap.set('n', '<leader>tt', toggleterm_custom_terminals.toggle_floating_terminal, {})
vim.keymap.set('t', '<leader>tt', toggleterm_custom_terminals.toggle_floating_terminal, {})
vim.keymap.set('n', '<leader>rc', toggleterm_custom_terminals.toggle_rails_console, {})
vim.keymap.set('t', '<leader>rc', toggleterm_custom_terminals.toggle_rails_console, {})
vim.keymap.set('n', '<leader>bi', toggleterm_custom_terminals.run_bundle_install, {})

-- git
vim.keymap.set('n', '<leader>gg', ':Git<CR>', {})

-- ufo
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
