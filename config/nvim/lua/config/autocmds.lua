-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local group = vim.api.nvim_create_augroup("cm", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = { "*.rb", "*.rake" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "gitcommit" },
  callback = function()
    vim.opt.bufhidden = "delete"
  end,
})
