local default_tool = "claude"

return {
  "folke/sidekick.nvim",
  keys = {
    {
      "<c-,>",
      function()
        require("sidekick.cli").toggle({ name = default_tool })
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Toggle",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").focus({ name = default_tool })
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").focus({ name = default_tool })
        require("sidekick.cli").ask({ prompt = "file" })
      end,
      mode = { "n" },
      desc = "Sidekick Add File to Prompt",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").focus({ name = default_tool })
        require("sidekick.cli").ask({ prompt = "position" })
      end,
      mode = { "v" },
      desc = "Sidekick Add Selection to Prompt",
    },
  },
}
