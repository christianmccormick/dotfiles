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

-- Goodbye inlay hints 👋🏻
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.inlayHintProvider = nil
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})
