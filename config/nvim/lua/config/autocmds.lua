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

-- Make diffs a little easier on the eyes
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  group = group,
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.wo[win].diff then
        -- Get rid of annoying bright white underline on diff cursor line
        -- Upstream issue: https://github.com/neovim/neovim/issues/9800
        vim.wo[win].cursorlineopt = "number"

        -- Get rid of more annoying bright white lines, this time the diagonal ones in diffs
        local colors = require("tokyonight.colors").setup({ style = "storm" })
        local default_diff_delete_bg = vim.api.nvim_get_hl(0, { name = "DiffDelete" }).bg
        vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.bg_dark, bg = default_diff_delete_bg })
      end
    end
  end,
})
