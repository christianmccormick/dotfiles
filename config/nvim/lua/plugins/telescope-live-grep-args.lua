local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  config = function()
    local set_keymap = function()
      vim.keymap.set(
        "n",
        "<leader>/",
        ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        { desc = "Grep (Root Dir with Args)" }
      )
    end

    set_keymap()

    Util.on_load("telescope.nvim", function()
      require("telescope").load_extension("live_grep_args")

      set_keymap()
    end)
  end,
}
