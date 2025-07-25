local Snacks = require("snacks")

return {
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#project_root"] = function()
        return LazyVim.root()
      end

      vim.g["test#custom_strategies"] = {
        snacks = function(cmd)
          Snacks.terminal.open(cmd, {
            interactive = false,
          })
        end,
      }
      vim.g["test#strategy"] = "snacks"

      vim.g["test#custom_transformations"] = {
        devbox = function(cmd)
          return 'devbox run "' .. cmd .. '"'
        end,
      }
      vim.g["test#transformation"] = "devbox"

      local wk = require("which-key")

      wk.add({
        { "<leader>t", group = "test" },
      })

      vim.keymap.set("n", "<leader>tt", ":TestFile<cr>", { desc = "Run File Tests", silent = true })
      vim.keymap.set("n", "<leader>tr", ":TestNearest<cr>", { desc = "Run Nearest Test", silent = true })
      vim.keymap.set("n", "<leader>tl", ":TestLast<cr>", { desc = "Run Last Test(s)", silent = true })
      vim.keymap.set("n", "<leader>ts", ":TestSuite<cr>", { desc = "Run Test Suite", silent = true })
      vim.keymap.set("n", "<leader>tv", ":TestVisit<cr>", { desc = "Visit Last Test File", silent = true })
    end,
  },
}
