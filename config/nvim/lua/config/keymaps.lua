-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

vim.keymap.set(
  "n",
  "<leader>fp",
  ":echo 'Current Relative File Path: ' . expand('%')<cr>",
  { desc = "Print Current Relative File Path" }
)
vim.keymap.set(
  "n",
  "<leader>fP",
  ":echo 'Current Absolute File Path: ' . expand('%:p')<cr>",
  { desc = "Print Current Absolute File Path" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>gB",
  "<cmd>:GH blame<cr>",
  { desc = "GitHub Blame", noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>gH",
  "<cmd>:GH browse<cr>",
  { desc = "GitHub Browse", noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "v",
  "<leader>gB",
  "<cmd>'<,'>:GH blame<CR>",
  { desc = "Git Blame", noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "v",
  "<leader>gH",
  "<cmd>'<,'>:GH browse<CR>",
  { desc = "Git Browse", noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>:GH pr<cr>", { desc = "GitHub PR", noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>gr",
  "<cmd>:GH repo pulls<cr>",
  { desc = "GitHub PRs", noremap = true, silent = true }
)
