local group = vim.api.nvim_create_augroup('CM', { clear = true })

-- formatting

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  command = 'lua vim.lsp.buf.formatting_seq_sync(nil, 100)',
  group = group,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
  command = 'EslintFixAll',
  group = group,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.rb', '*.rake' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync()
  end,
  group = group,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.html' },
  callback = function()
    local buffer_contents = table.concat(
      vim.api.nvim_buf_get_lines(0, 0, -1, false),
      '\n'
    )

    if string.find(buffer_contents, '{{') then
      vim.o.filetype = 'gohtmltmpl'
    end
  end,
  group = group
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { 'COMMIT_EDITMSG' },
  callback = function()
    vim.opt.spell = true
  end,
  group = group
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    vim.cmd('startinsert')
  end,
  group = group,
})
